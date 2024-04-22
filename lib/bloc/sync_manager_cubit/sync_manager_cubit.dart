import 'dart:async';

import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/data/repositories/sync_clipboard.dart';
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

  Future<void> reset() async {
    await db.writeTxn(() => db.syncStatus.clear());
    emit(const SyncManagerState.unknown());
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

    /// when the app can show the clips to the user.
    bool partlySynced = false;
    while (hasMore) {
      emit(const SyncManagerState.checking());
      final result = await syncRepo.getLatestItems(
        userId: auth.userId!,
        lastSynced: lastSync?.lastSync,
        offset: offset,
      );

      await result.fold((l) async => emit(SyncManagerState.failed(l)),
          (r) async {
        hasMore = r.hasMore;
        offset += r.results.length;
        // Apply changes to local db
        final items = r.results;

        for (var i = 0; i < items.length; i++) {
          final item = items[i];
          final result = await db.txn(() async => await db.clipboardItems
              .filter()
              .serverIdEqualTo(item.serverId)
              .findFirst());
          if (result == null) {
            items[i] = item.copyWith(lastSynced: now());
          } else {
            items[i] = item.copyWith(
              lastSynced: result.lastSynced,
              localPath: result.localPath,
            )..applyId(result);
          }
        }

        await db.writeTxn(() async => await db.clipboardItems.putAll(items));

        if (!partlySynced) {
          emit(const SyncManagerState.partlySynced());
          partlySynced = true;
        }
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
    final syncTime = now();
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
