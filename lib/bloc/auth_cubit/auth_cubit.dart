import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';
import 'package:clipboard/common/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final Account account;

  AuthCubit(this.account) : super(const AuthState.unknown());

  Future<void> fetchSession() async {
    emit(const AuthState.authenticating());

    try {
      final session = await account.getSession(sessionId: "current");
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
          "https://www.googleapis.com/auth/drive.file",
          "https://www.googleapis.com/auth/drive.appdata",
        ],
      );
      await fetchSession();
    } catch (e) {
      emit(const AuthState.unauthenticated());
      return;
    }
  }

  Future<void> logout() async {
    emit(const AuthState.authenticating());

    await account.deleteSession(sessionId: "current");

    emit(const AuthState.unauthenticated());
  }
}
