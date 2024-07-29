import 'dart:async';

import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/data/repositories/sync_clipboard.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/common/logging.dart';
import 'package:copycat_base/data/repositories/clip_collection.dart';
import 'package:copycat_base/db/clip_collection/clipcollection.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/db/sync_status/syncstatus.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

part 'sync_manager_cubit.freezed.dart';
part 'sync_manager_state.dart';

Future<void> syncChanges(BuildContext context) async {
  showTextSnackbar(context.locale.syncing("..."),
      isLoading: true, closePrevious: true);
  await context.read<SyncManagerCubit>().syncChanges(force: true);
  if (context.mounted) {
    showTextSnackbar(context.locale.done, closePrevious: true);
  }
  closeSnackbar();
}

const _syncId = 1;

@singleton
class SyncManagerCubit extends Cubit<SyncManagerState> {
  final Isar db;
  final AuthCubit auth;
  final SyncRepository syncRepo;
  final ClipCollectionRepository clipCollectionRepository;
  final String deviceId;

  int? syncHours;
  bool syncing = false;
  Timer? autoSyncTimer;
  DateTime? lastManualSyncTS;

  SyncManagerCubit(
    this.db,
    this.auth,
    this.syncRepo,
    this.clipCollectionRepository,
    @Named("device_id") this.deviceId,
  ) : super(const SyncManagerState.unknown());

  @override
  void emit(SyncManagerState state) {
    if (isClosed) return;
    super.emit(state);
  }

  void setupAutoSync(Duration duration) {
    autoSyncTimer?.cancel();

    if (duration == Duration.zero) {
      return;
    }

    autoSyncTimer = Timer.periodic(
      duration,
      (timer) => syncChanges(silent: true, auto: true),
    );
  }

  void stopAutoSync() {
    autoSyncTimer?.cancel();
    autoSyncTimer = null;
  }

  DateTime getLastSyncedTime(DateTime? current) {
    assert(syncHours != null, "syncing not configured");

    if (current != null) {
      final diff = now().difference(current);
      if (diff.inHours < syncHours!) {
        return current;
      }
    }

    return now().subtract(Duration(hours: syncHours!));
  }

  Future<SyncStatus?> getSyncInfo() async {
    final lastSync = await db.syncStatus.get(_syncId);
    return lastSync;
  }

  Future<void> reset() async {
    await db.writeTxn(() => db.syncStatus.clear());
    emit(const SyncManagerState.unknown());
  }

  Future<void> repairLocalClipboardAndCollectionRelations() async {
    final needRepairing = await db.txn(
          () => db.clipboardItems
              .filter()
              .collectionIdIsNull()
              .serverCollectionIdIsNotNull()
              .count(),
        ) >
        0;

    if (!needRepairing) return;

    final collections =
        await db.clipCollections.filter().serverIdIsNotNull().findAll();

    for (final collection in collections) {
      await db.writeTxn(() async {
        final items = await db.clipboardItems
            .filter()
            .serverCollectionIdEqualTo(collection.serverId)
            .collectionIdIsNull()
            .findAll();
        final updated = items
            .map((e) => e.copyWith(collectionId: collection.id)..applyId(e))
            .toList();
        await db.clipboardItems.putAll(updated);
      });
    }
  }

  Future<int> syncDeletedClipCollections(SyncStatus? lastSync) async {
    if (lastSync == null) return 0;
    // Fetch changes from server
    bool hasMore = true;
    int offset = 0;
    int deleted = 0;

    /// when the app can show the clips to the user.
    while (hasMore) {
      emit(const SyncManagerState.checking());
      final result = await syncRepo.getDeletedClipCollections(
        userId: auth.userId!,
        lastSynced: lastSync.lastSync,
        offset: offset,
        excludeDeviceId: deviceId,
      );

      await result.fold((l) async => logger.e(l), (r) async {
        hasMore = r.hasMore;
        offset += r.results.length;
        // Apply changes to local db
        final items = r.results;
        if (items.isEmpty) return;

        await db.writeTxn(
          () async {
            final count = await db.clipCollections
                .filter()
                .anyOf(
                  items,
                  (q, _) => q.serverIdEqualTo(_.serverId),
                )
                .deleteAll();

            deleted += count;
          },
        );
      });

      if (result.isLeft()) break;
    }
    logger.i("Deleted clip collection count: $deleted");
    return deleted;
  }

  Future<bool> syncClipCollections(
    SyncStatus? syncInfo, {
    bool silent = false,
  }) async {
    // Fetch changes from server
    bool hasMore = true;
    int offset = 0;
    bool partlySynced = false;
    int added = 0;
    int updated = 0;

    /// when the app can show the clips to the user.
    while (hasMore) {
      emit(const SyncManagerState.checking());
      final result = await syncRepo.getLatestClipCollections(
        userId: auth.userId!,
        lastSynced: syncInfo?.lastSync,
        offset: offset,
        excludeDeviceId: syncInfo?.lastSync != null ? deviceId : null,
      );

      await result.fold((l) async => emit(SyncManagerState.failed(l)),
          (r) async {
        hasMore = r.hasMore;
        offset += r.results.length;
        // Apply changes to local db
        final items = r.results;

        if (items.isEmpty) return;

        final foundedCount = await db.txn(() async {
          final foundCollections = await db.clipCollections
              .filter()
              .anyOf(items, (q, _) => q.serverIdEqualTo(_.serverId))
              .findAll();

          for (var found in foundCollections) {
            final index =
                items.indexWhere((item) => item.serverId == found.serverId);
            if (index != -1) {
              items[index] = items[index].copyWith(
                lastSynced: found.lastSynced,
              )..applyId(found);
            }
          }
          return foundCollections.length;
        });

        added += r.results.length - foundedCount;
        updated += foundedCount;

        await db.writeTxn(() async {
          await db.clipCollections.putAll(items);
        });

        if (!partlySynced && !silent) {
          emit(const SyncManagerState.partlySynced(collections: true));
          partlySynced = true;
        }
      });

      if (result.isLeft()) break;
    }

    final deleted = await syncDeletedClipCollections(syncInfo);

    if (added > 0 || updated > 0 || deleted > 0) {
      emit(
        SyncManagerState.collectionSynced(
          silent: silent,
          added: added,
          deleted: deleted,
          updated: updated,
        ),
      );
      return true;
    }
    return false;
  }

  Future<int> syncDeletedClipboardItems(SyncStatus? syncInfo) async {
    if (syncInfo == null) return 0;
    // Fetch changes from server
    bool hasMore = true;
    int offset = 0;
    int deleted = 0;

    /// when the app can show the clips to the user.
    while (hasMore) {
      emit(const SyncManagerState.checking());
      final result = await syncRepo.getDeletedClipboardItems(
        limit: 1000,
        userId: auth.userId!,
        lastSynced: syncInfo.lastSync,
        offset: offset,
        excludeDeviceId: deviceId,
      );

      await result.fold((l) async => logger.e(l), (r) async {
        hasMore = r.hasMore;
        offset += r.results.length;
        // Apply changes to local db
        final items = r.results;

        if (items.isEmpty) return;

        final deletedCount = await db.writeTxn(
          () async {
            final deletedClips = await db.clipboardItems
                .filter()
                .anyOf(
                  items,
                  (q, _) => q.serverIdEqualTo(_.serverId),
                )
                .findAll();

            // Clean up deleted clips (files if any)
            await Future.wait(deletedClips.map((e) => e.cleanUp()));

            await db.clipboardItems
                .deleteAll(deletedClips.map((e) => e.id).toList());

            return deletedClips.length;
          },
        );

        deleted += deletedCount;
      });

      if (result.isLeft()) break;
    }

    logger.i("Deleted clipboard items count: $deleted");
    return deleted;
  }

  Future<bool> syncClipboardItems(
    SyncStatus? lastSync, {
    bool silent = false,
  }) async {
    // Fetch changes from server
    bool hasMore = true;
    int offset = 0;
    int added = 0;
    int updated = 0;

    /// when the app can show the clips to the user.
    bool partlySynced = false;
    while (hasMore) {
      emit(const SyncManagerState.checking());
      final result = await syncRepo.getLatestClipboardItems(
        limit: 1000,
        userId: auth.userId!,
        lastSynced: getLastSyncedTime(lastSync?.lastSync),
        offset: offset,
        excludeDeviceId: lastSync?.lastSync != null ? deviceId : null,
      );

      await result.fold((l) async => emit(SyncManagerState.failed(l)),
          (r) async {
        hasMore = r.hasMore;
        offset += r.results.length;
        // Apply changes to local db
        final items = r.results;

        if (items.isEmpty) return;

        final foundedCount = await db.txn(() async {
          final foundCollections = await db.clipboardItems
              .filter()
              .anyOf(items, (q, _) => q.serverIdEqualTo(_.serverId))
              .findAll();

          for (var found in foundCollections) {
            final index =
                items.indexWhere((item) => item.serverId == found.serverId);
            if (index != -1) {
              items[index] = items[index].copyWith(
                lastSynced: found.lastSynced,
                localPath: found.localPath,
              )..applyId(found);
            }
          }
          return foundCollections.length;
        });

        added += r.results.length - foundedCount;
        updated += foundedCount;

        await db.writeTxn(() async {
          await db.clipboardItems.putAll(items);
        });

        if (!silent && !partlySynced) {
          emit(const SyncManagerState.partlySynced(clipboard: true));
          partlySynced = true;
        }
      });

      if (result.isLeft()) break;
    }

    final deleted = await syncDeletedClipboardItems(lastSync);

    if (added > 0 || updated > 0 || deleted > 0) {
      emit(SyncManagerState.clipboardSynced(
        silent: silent,
        added: added,
        deleted: deleted,
        updated: updated,
      ));
      return true;
    }
    return false;
  }

  Future<Failure?> syncChanges({
    bool clipboard = true,
    bool collections = true,
    bool repairRelations = true,
    bool silent = false,
    bool force = false,
    bool auto = false,
  }) async {
    if (!auto && lastManualSyncTS != null) {
      final diff = now().difference(lastManualSyncTS!).inSeconds;
      if (diff < 3) {
        emit(const SyncManagerState.failed(frequentSyncing));
        return frequentSyncing;
      }
    }
    if (syncing || syncHours == null) return null;
    if (auth.state is! AuthenticatedAuthState) return null;
    syncing = true;
    try {
      final syncInfo = await getSyncInfo();
      final needRebuilding = syncInfo == null;
      emit(SyncManagerState.checking(
        needDbRebuilding: needRebuilding,
      ));

      final results = await Future.wait([
        if (clipboard) syncClipboardItems(syncInfo, silent: silent),
        if (collections)
          syncClipCollections(force ? null : syncInfo, silent: silent),
      ]);

      if (repairRelations) {
        await repairLocalClipboardAndCollectionRelations();
      }

      final hasUpdate = results.any((element) => element);
      await updateSyncTime(refreshLocalCache: !silent, hasUpdate: hasUpdate);
      if (!auto) {
        lastManualSyncTS = now();
      }
    } finally {
      syncing = false;
    }
    return null;
  }

  Future<void> updateSyncTime({
    bool refreshLocalCache = false,
    bool hasUpdate = false,
  }) async {
    final lastSync0 = await getSyncInfo();
    final firstBuild = lastSync0 == null;
    final syncTime = now();
    if (!hasUpdate) {
      emit(SyncManagerState.synced(
        lastSynced: lastSync0?.lastSync ?? syncTime,
        refreshLocalCache: refreshLocalCache,
        firstBuild: firstBuild,
      ));
    } else {
      final updatedSyncStatus =
          (lastSync0 ?? SyncStatus()).copyWith(lastSync: syncTime);
      updatedSyncStatus.id = _syncId;
      await db.writeTxn(() async => await db.syncStatus.put(updatedSyncStatus));
      emit(SyncManagerState.synced(
        lastSynced: syncTime,
        refreshLocalCache: refreshLocalCache,
        firstBuild: firstBuild,
      ));
    }
  }
}
