part of 'sync_manager_cubit.dart';

@freezed
class SyncManagerState with _$SyncManagerState {
  const factory SyncManagerState.unknown() = UnknownSyncState;
  const factory SyncManagerState.checking() = CheckingSyncState;
  const factory SyncManagerState.syncing({
    required int progress,
    required int total,
  }) = SyncingState;

  const factory SyncManagerState.synced({
    required DateTime lastSynced,
  }) = SyncedState;
}
