part of 'drive_setup_cubit.dart';

@freezed
class DriveSetupState with _$DriveSetupState {
  const factory DriveSetupState.unknown({
    @Default(false) bool waiting,
  }) = DriveSetupUnknown;
  const factory DriveSetupState.fetching() = DriveSetupFetching;
  const factory DriveSetupState.verifyingCode({
    required String code,
    required List<String> scopes,
  }) = DriveSetupVerifyingCode;
  const factory DriveSetupState.refreshingToken() = DriveSetupRefreshingToken;
  const factory DriveSetupState.setupDone({
    required DriveAccessToken token,
  }) = DriveSetupDone;
  const factory DriveSetupState.setupError({
    required Failure failure,
  }) = DriveSetupError;
}
