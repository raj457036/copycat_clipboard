import 'dart:async';

import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/data/repositories/clip_collection.dart';
import 'package:clipboard/data/repositories/sync_clipboard.dart';
import 'package:clipboard/db/clip_collection/clipcollection.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/db/sync_status/syncstatus.dart';
import 'package:clipboard/utils/network_status.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

part 'sync_manager_cubit.freezed.dart';
part 'sync_manager_state.dart';

Future<void> syncChanges(BuildContext context) async {
  showTextSnackbar("Syncing...", isLoading: true, closePrevious: true);
  await context.read<SyncManagerCubit>().syncChanges();
  showTextSnackbar("✅ Changes are synced", closePrevious: true);
}

@singleton
class SyncManagerCubit extends Cubit<SyncManagerState> {
  final Isar db;
  final AuthCubit auth;
  final SyncRepository syncRepo;
  final ClipCollectionRepository clipCollectionRepository;
  final NetworkStatus network;
  final int _syncId = 1;
  final String deviceId;

  bool syncing = false;
  Timer? autoSyncTimer;

  SyncManagerCubit(
    this.db,
    this.auth,
    this.syncRepo,
    this.network,
    this.clipCollectionRepository,
    @Named("device_id") this.deviceId,
  ) : super(const SyncManagerState.unknown());

  void setupAutoSync(Duration duration) {
    autoSyncTimer?.cancel();

    if (duration == Duration.zero) {
      return;
    }

    autoSyncTimer =
        Timer.periodic(duration, (timer) => syncChanges(silent: true));
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

        for (var i = 0; i < items.length; i++) {
          final item = items[i];
          final result = await db.txn(
            () async => await db.clipCollections
                .filter()
                .serverIdEqualTo(item.serverId)
                .findFirst(),
          );
          if (result != null) {
            await clipCollectionRepository.delete(result);
            deleted++;
          }
        }
      });

      if (result.isLeft()) break;
    }
    logger.i("Deleted clip collection count: $deleted");
    return deleted;
  }

  Future<bool> syncClipCollections(
    SyncStatus? lastSync, {
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
        lastSynced: lastSync?.lastSync,
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

        for (var i = 0; i < items.length; i++) {
          final item = items[i];
          final result = await db.txn(() async => await db.clipCollections
              .filter()
              .serverIdEqualTo(item.serverId)
              .findFirst());
          if (result == null) {
            items[i] = item.copyWith(lastSynced: now());
            added++;
          } else {
            items[i] = item.copyWith(
              lastSynced: result.lastSynced,
            )..applyId(result);
            updated++;
          }
        }

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

    final deleted = await syncDeletedClipCollections(lastSync);

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

  Future<int> syncDeletedClipboardItems(SyncStatus? lastSync) async {
    if (lastSync == null) return 0;
    // Fetch changes from server
    bool hasMore = true;
    int offset = 0;
    int deleted = 0;

    /// when the app can show the clips to the user.
    while (hasMore) {
      emit(const SyncManagerState.checking());
      final result = await syncRepo.getDeletedClipboardItems(
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
        final deletedIds = <int>[];

        if (items.isEmpty) return;

        for (var i = 0; i < items.length; i++) {
          final item = items[i];
          final result = await db.txn(
            () async => await db.clipboardItems
                .filter()
                .serverIdEqualTo(item.serverId)
                .findFirst(),
          );
          if (result != null) {
            deletedIds.add(result.id);
            deleted++;
          }
        }

        await db.writeTxn(() async {
          await db.clipboardItems.deleteAll(deletedIds);
        });
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
        userId: auth.userId!,
        lastSynced: lastSync?.lastSync,
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

        for (var i = 0; i < items.length; i++) {
          final item = items[i];
          final result = await db.txn(() async => await db.clipboardItems
              .filter()
              .serverIdEqualTo(item.serverId)
              .findFirst());
          if (result == null) {
            items[i] = item.copyWith(lastSynced: now());
            added++;
          } else {
            items[i] = item.copyWith(
              lastSynced: result.lastSynced,
              localPath: result.localPath,
            )..applyId(result);
            updated++;
          }
        }

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

  Future<void> syncChanges({
    bool clipboard = true,
    bool collections = true,
    bool repairRelations = true,
    bool silent = false,
  }) async {
    if (syncing) return;
    syncing = true;
    try {
      emit(const SyncManagerState.checking());
      final lastSync = await getSyncInfo();

      if (!await network.isConnected) {
        emit(const SyncManagerState.failed(noInternetConnectionFailure));
        return;
      }

      final results = await Future.wait([
        if (clipboard) syncClipboardItems(lastSync, silent: silent),
        if (collections) syncClipCollections(lastSync, silent: silent),
      ]);

      if (repairRelations) {
        await repairLocalClipboardAndCollectionRelations();
      }

      final hasUpdate = results.any((element) => element);
      await updateSyncTime(refreshLocalCache: !silent, hasUpdate: hasUpdate);
    } finally {
      syncing = false;
    }
  }

  Future<void> updateSyncTime({
    bool refreshLocalCache = false,
    bool hasUpdate = false,
  }) async {
    final lastSync0 = await getSyncInfo();
    final syncTime = now();
    if (!hasUpdate) {
      emit(SyncManagerState.synced(
        lastSynced: lastSync0?.lastSync ?? syncTime,
        refreshLocalCache: refreshLocalCache,
      ));
    } else {
      final updatedSyncStatus =
          (lastSync0 ?? SyncStatus()).copyWith(lastSync: syncTime);
      updatedSyncStatus.id = _syncId;
      await db.writeTxn(() async => await db.syncStatus.put(updatedSyncStatus));
      emit(SyncManagerState.synced(
        lastSynced: syncTime,
        refreshLocalCache: refreshLocalCache,
      ));
    }
  }
}
