part of 'offline_persistance_cubit.dart';

@freezed
class OfflinePersistanceState with _$OfflinePersistanceState {
  const factory OfflinePersistanceState.initial() = OfflinePersistanceInitial;
  const factory OfflinePersistanceState.creatingItem(ClipboardItem item) =
      OfflinePersistanceCreating;
  const factory OfflinePersistanceState.updatingItem(ClipboardItem item) =
      OfflinePersistanceUpdating;
  const factory OfflinePersistanceState.deletingItem(ClipboardItem item) =
      OfflinePersistanceDeleting;
  const factory OfflinePersistanceState.deletedItem(ClipboardItem item) =
      OfflinePersistanceDeleted;
  const factory OfflinePersistanceState.saved(
    ClipboardItem item, {
    @Default(false) bool created,
    @Default(false) bool synced,
  }) = OfflinePersistanceSaved;
  const factory OfflinePersistanceState.decrypting() =
      OfflinePersistanceDecryptingState;
  const factory OfflinePersistanceState.decrypted() =
      OfflinePersistanceDecryptedState;
  const factory OfflinePersistanceState.error(Failure failure,
      [ClipboardItem? item]) = OfflinePersistanceError;
}
