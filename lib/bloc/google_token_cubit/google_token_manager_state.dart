part of 'google_token_manager_cubit.dart';

@freezed
class GoogleTokenManagerState with _$GoogleTokenManagerState {
  const factory GoogleTokenManagerState.initial() =
      GoogleTokenManagerInitialState;

  const factory GoogleTokenManagerState.notAvailable() =
      GoogleTokenManagerNotAvailableState;

  const factory GoogleTokenManagerState.loading() =
      GoogleTokenManagerLoadingState;

  const factory GoogleTokenManagerState.loaded({
    required String token,
    required String refreshToken,
    required DateTime expiry,
  }) = GoogleTokenManagerLoadedState;

  const factory GoogleTokenManagerState.error(Failure failure) =
      GoogleTokenManagerErrorState;
}
