import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/routes/routes.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/common/logging.dart';
import 'package:copycat_base/constants/strings/strings.dart';
import 'package:copycat_base/domain/model/auth_user/auth_user.dart';
import 'package:copycat_base/domain/repositories/auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tiny_storage/tiny_storage.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repo;
  final TinyStorage localCache;

  AuthCubit(
    this.repo,
    this.localCache,
  ) : super(const AuthState.unknown());

  /// validate the code and return a suitable page path
  Future<String?> validateAuthCode(String code) async {
    final result = await repo.validateAuthCode(code);

    result.fold(
      (failure) {},
      (right) {
        final (type, user) = right;
        if (user == null) return null;
        switch (type) {
          case "passwordRecovery":
            authenticated(user, repo.accessToken!);
            return RouteConstants.resetPassword;
          case _:
            logger.w("Exchange not supported. $type");
        }
        return null;
      },
    );
    return null;
  }

  bool get isLocalAuth => state is LocalAuthenticatedAuthState;
  String? get userId => repo.userId;

  checkForAuthentication() {
    if (checkLocalSignin()) return;
    if (repo.currentUser != null) {
      authenticated(repo.currentUser!, repo.accessToken!);
    } else {
      unauthenticated(authFailure);
    }
  }

  /// enc1 is always encrypted with enc2 key.
  Future<void> setupEncryption(String enc2KeyId, String enc1) async {
    await state.mapOrNull(authenticated: (authState) async {
      final result = await repo.updateUserInfo({
        "enc1": enc1,
        "enc2KeyId": enc2KeyId,
      });
      result.fold((l) {}, (user) {
        emit(authState.copyWith(user: user));
      });
    });
  }

  Future<void> setupAnalytics(AuthUser user) async {
    if (!isAnalyticsSupported) return;

    await analytics.setUserId(id: user.userId);
    await analytics.setUserProperty(
      name: "name",
      value: user.displayName,
    );
    await analytics.setUserProperty(
      name: "email",
      value: user.email,
    );
    await analytics.logAppOpen();
  }

  bool checkLocalSignin() {
    final result = localCache.get(klocalAuthKey);
    if (result == true) {
      emit(const AuthState.localAuthenticated());
      return true;
    }
    return false;
  }

  Future<void> localAuthenticated() async {
    localCache.set(klocalAuthKey, true);

    emit(const AuthState.localAuthenticated());
  }

  Future<void> authenticated(AuthUser user, String accessToken) async {
    setupAnalytics(user);

    emit(AuthState.authenticated(
      user: user,
      accessToken: accessToken,
    ));
  }

  void unauthenticated(Failure failure) {
    emit(AuthState.unauthenticated(failure));
  }

  Future<void> logout() async {
    emit(const AuthState.authenticating());
    localCache.set(klocalAuthKey, false);
    await repo.logout();
    emit(const AuthState.unauthenticated());
  }
}
