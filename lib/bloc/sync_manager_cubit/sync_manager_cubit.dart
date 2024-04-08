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

  SyncManagerCubit(
    this.db,
    this.auth,
    this.syncRepo,
    this.network,
  ) : super(const SyncManagerState.unknown());

  Future<void> syncChanges() async {
    final lastSync = await db.syncStatus.where().findFirst();
    emit(const SyncManagerState.checking());

    if (!network.isConnected) {
      emit(const SyncManagerState.failed(noInternetConnectionFailure));
      return;
    }

    // Fetch changes from server
    bool hasMore = true;
    int offset = 0;
    while (hasMore) {
      final result = await syncRepo.getLatestItems(
        userId: auth.userId!,
        lastSynced: lastSync?.lastSync,
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
          final result = await db.clipboardItems
              .filter()
              .serverIdEqualTo(item.serverId)
              .findFirst();
          if (result == null) {
            items[i] = item.copyWith(lastSynced: DateTime.now());
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
    await updateSyncTime(lastSync);
  }

  Future<void> updateSyncTime([SyncStatus? lastSync]) async {
    final lastSync0 = lastSync ?? await db.syncStatus.where().findFirst();
    final syncTime = DateTime.now();
    final updatedSyncStatus = (lastSync0 ?? SyncStatus()
          ..id = 1)
        .copyWith(lastSync: syncTime);
    await db.writeTxn(() async => await db.syncStatus.put(updatedSyncStatus));
    emit(SyncManagerState.synced(lastSynced: syncTime));
  }
}
