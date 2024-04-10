part of 'offline_persistance_cubit.dart';

@freezed
sealed class OfflinePersistanceState with _$OfflinePersistanceState {
  const factory OfflinePersistanceState.initial() = OfflinePersistanceInitial;
  const factory OfflinePersistanceState.creatingItem(ClipboardItem item) =
      OfflinePersistanceCreating;
  const factory OfflinePersistanceState.updatingItem(ClipboardItem item) =
      OfflinePersistanceUpdating;
  const factory OfflinePersistanceState.saved(ClipboardItem item,
      {@Default(false) bool created}) = OfflinePersistanceSaved;
  const factory OfflinePersistanceState.error(Failure failure) =
      OfflinePersistanceError;
}
