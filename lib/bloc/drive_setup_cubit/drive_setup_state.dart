part of 'drive_setup_cubit.dart';

@freezed
class DriveSetupState with _$DriveSetupState {
  const factory DriveSetupState.unknown() = DriveSetupUnknown;
  const factory DriveSetupState.verifyingCode({
    required String code,
    required List<String> scopes,
  }) = DriveSetupVerifyingCode;
  const factory DriveSetupState.refreshingToken() = DriveSetupRefreshingToken;
  const factory DriveSetupState.setupDone({
    required String accessToken,
    required DateTime expiry,
  }) = DriveSetupDone;
  const factory DriveSetupState.setupError({
    required Failure failure,
  }) = DriveSetupError;
}
