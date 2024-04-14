import 'package:bloc/bloc.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/utils/network_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final NetworkStatus network;
  SupabaseClient sbClient;

  AuthCubit(
    this.sbClient,
    this.network,
  ) : super(const AuthState.unknown());

  String? get userId =>
      state.whenOrNull(authenticated: (session) => session.user.id);

  Session? getSession() {
    return sbClient.auth.currentSession;
  }

  checkForAuthentication() {
    final cs = getSession();
    if (cs != null) {
      authenticated(cs);
    } else {
      unauthenticated(notLoggedInFailure);
    }
  }

  void authenticated(Session session) {
    emit(AuthState.authenticated(session: session));
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
