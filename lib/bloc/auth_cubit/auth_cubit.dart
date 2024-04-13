import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';
import 'package:clipboard/common/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:injectable/injectable.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final Account account;

  DateTime? _lastSessionFetched;
  Session? _session;

  AuthCubit(
    this.account,
  ) : super(const AuthState.unknown());

  String? get userId =>
      state.whenOrNull(authenticated: (session) => session.userId);

  Future<Session> getSession() async {
    final now = DateTime.now();
    if (_session != null &&
        _lastSessionFetched != null &&
        now.difference(_lastSessionFetched!).inMinutes < 55) {
      return _session!;
    }
    _session = await account.getSession(sessionId: "current");
    _lastSessionFetched = DateTime.now();
    return _session!;
  }

  Future<void> fetchSession() async {
    emit(const AuthState.authenticating());
    try {
      final session = await getSession();
      emit(AuthState.authenticated(session: session));
    } catch (e) {
      emit(const AuthState.unauthenticated());
      return;
    }
  }

  Future<void> createNewSession() async {
    emit(const AuthState.authenticating());

    try {
      await account.createOAuth2Session(
        provider: 'google',
        scopes: [
          DriveApi.driveFileScope,
          DriveApi.driveAppdataScope,
        ],
      );
      await fetchSession();
    } catch (e) {
      emit(AuthState.unauthenticated(Failure.fromException(e)));
      return;
    }
  }

  Future<void> logout() async {
    emit(const AuthState.authenticating());

    await account.deleteSession(sessionId: "current");

    emit(const AuthState.unauthenticated());
  }
}
