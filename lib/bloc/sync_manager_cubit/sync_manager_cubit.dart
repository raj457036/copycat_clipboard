import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/data/repositories/sync_clipboard.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/db/sync_status/syncstatus.dart';
import 'package:clipboard/utils/network_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

part 'sync_manager_cubit.freezed.dart';
part 'sync_manager_state.dart';

@singleton
class SyncManagerCubit extends Cubit<SyncManagerState> {
  final Isar db;
  final AuthCubit auth;
  final SyncClipboardRepository syncRepo;
  final NetworkStatus network;
  final int _syncId = 1;

  SyncManagerCubit(
    this.db,
    this.auth,
    this.syncRepo,
    this.network,
  ) : super(const SyncManagerState.unknown());

  Future<SyncStatus?> getSyncInfo() async {
    final lastSync = await db.syncStatus.get(_syncId);
    return lastSync;
  }

  Future<void> syncChanges() async {
    emit(const SyncManagerState.checking());
    final lastSync = await getSyncInfo();

    if (!await network.isConnected) {
      emit(const SyncManagerState.failed(noInternetConnectionFailure));
      return;
    }

    // Fetch changes from server
    bool hasMore = true;
    int offset = 0;
    while (hasMore) {
      final result = await syncRepo.getLatestItems(
        userId: auth.userId!,
        lastSynced: lastSync?.lastSync?.toUtc(),
        offset: offset,
      );

      await result.fold((l) async => emit(SyncManagerState.failed(l)),
          (r) async {
        hasMore = r.hasMore;
        offset = r.results.length;
        // Apply changes to local db
        final items = r.results;

        for (var i = 0; i < items.length; i++) {
          final item = items[i];
          final result = await db.txn(() async => await db.clipboardItems
              .filter()
              .serverIdEqualTo(item.serverId)
              .findFirst());
          if (result == null) {
            items[i] = item.copyWith(lastSynced: DateTime.now().toUtc());
          } else {
            items[i] = item.copyWith(
              lastSynced: result.lastSynced,
              localPath: result.localPath,
            );
            items[i].id = result.id;
          }
        }

        await db.writeTxn(() async => await db.clipboardItems.putAll(items));
      });

      if (result.isLeft()) return;
    }

    // Fetch unsynced changes from local db
    // Sync local changes with server
    // ? Has to be done manually!
    await updateSyncTime(refreshLocalCache: true);
  }

  Future<void> updateSyncTime({bool refreshLocalCache = false}) async {
    final lastSync0 = await getSyncInfo();
    final syncTime = DateTime.now().toUtc();
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
