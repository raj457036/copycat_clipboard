part of 'cloud_persistance_cubit.dart';

@freezed
class CloudPersistanceState with _$CloudPersistanceState {
  const factory CloudPersistanceState.initial() = CloudPersistanceInitial;
  const factory CloudPersistanceState.creatingItem(ClipboardItem item) =
      CloudPersistanceCreating;
  const factory CloudPersistanceState.updatingItem(ClipboardItem item) =
      CloudPersistanceUpdating;
  const factory CloudPersistanceState.uploadingFile(ClipboardItem item) =
      CloudPersistanceUploadingFile;
  const factory CloudPersistanceState.downloadingFile(ClipboardItem item) =
      CloudPersistanceDownloadingFile;
  const factory CloudPersistanceState.saved(ClipboardItem item,
      {@Default(false) bool created}) = CloudPersistanceSaved;
  const factory CloudPersistanceState.error(Failure failure) =
      CloudPersistanceError;
}
