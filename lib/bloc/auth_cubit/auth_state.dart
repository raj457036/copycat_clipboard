part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unknown() = UnknownAuthState;
  const factory AuthState.authenticated({
    required Session session,
  }) = AuthenticatedAuthState;
  const factory AuthState.authenticating() = AuthenticatingAuthState;
  const factory AuthState.unauthenticated([Failure? failure]) =
      UnauthenticatedAuthState;
  const factory AuthState.offlineAuthMode() = OfflineAuthState;
}