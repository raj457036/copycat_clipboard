part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unknown() = UnknownAuthState;
  const factory AuthState.authenticated({
    required AuthUser user,
    required String accessToken,
  }) = AuthenticatedAuthState;
  const factory AuthState.localAuthenticated() = LocalAuthenticatedAuthState;
  const factory AuthState.authenticating() = AuthenticatingAuthState;
  const factory AuthState.unauthenticated([Failure? failure]) =
      UnauthenticatedAuthState;
}
