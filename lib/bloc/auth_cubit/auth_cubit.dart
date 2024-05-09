import 'package:bloc/bloc.dart';
import 'package:clipboard/common/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  SupabaseClient sbClient;

  AuthCubit(
    this.sbClient,
  ) : super(const AuthState.unknown());

  String? get userId => state.whenOrNull(authenticated: (_, user) => user.id);

  Session? get session => sbClient.auth.currentSession;

  checkForAuthentication() {
    if (session != null) {
      authenticated(
        session!,
        session!.user,
      );
    } else {
      unauthenticated(authFailure);
    }
  }

  void authenticated(Session session, User user) {
    emit(AuthState.authenticated(
      session: session,
      user: user,
    ));
  }

  void unauthenticated(Failure failure) {
    emit(AuthState.unauthenticated(failure));
  }

  Future<void> logout([SignOutScope? scope]) async {
    emit(const AuthState.authenticating());

    await sbClient.auth.signOut(scope: scope ?? SignOutScope.local);

    emit(const AuthState.unauthenticated());
  }
}
