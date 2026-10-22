import 'package:clipboard/base/domain/model/auth_user/auth_user.dart';
import 'package:clipboard/base/domain/repositories/auth.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final sb.SupabaseClient client;
  static const _sessionRefreshBuffer = Duration(minutes: 2);

  AuthRepositoryImpl({required this.client});

  @override
  Stream<AuthSessionChange> get authStateChanges =>
      client.auth.onAuthStateChange.map((authState) {
        if (authState.event != sb.AuthChangeEvent.signedOut) {
          return AuthSessionChange.updated;
        }
        logger.w(
          "Supabase signedOut "
          "(reason: ${authState.signOutReason?.name ?? 'unknown'}).",
        );
        return AuthSessionChange.signedOut;
      });

  @override
  String? get userId => client.auth.currentUser?.id;

  @override
  FailureOr<(String?, AuthUser?)> validateAuthCode(String code) async {
    try {
      final exchange = await client.auth.exchangeCodeForSession(code);

      switch (exchange.redirectType) {
        case "passwordRecovery":
          return Right((
            "passwordRecovery",
            exchange.session.user.toAuthUser(),
          ));
        case _:
          logger.w("Exchange not supported. ${exchange.redirectType}");
      }
      return const Right((null, null));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<void> logout() async {
    try {
      await client.auth.signOut(scope: sb.SignOutScope.local);
      return const Right(null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<AuthUser> updateUserInfo(Map<String, dynamic> data) async {
    try {
      final result = await client.auth.updateUser(
        sb.UserAttributes(data: data),
      );
      if (result.user == null) {
        throw Exception();
      }

      return Right(result.user!.toAuthUser());
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  AuthUser? get currentUser => client.auth.currentUser?.toAuthUser();

  @override
  String? get accessToken => client.auth.currentSession?.accessToken;

  @override
  bool get needsSessionRefresh {
    final session = client.auth.currentSession;
    if (session == null) return true;

    final expiresAt = session.expiresAt;
    if (expiresAt == null) return false;

    final expiry = DateTime.fromMillisecondsSinceEpoch(expiresAt * 1000);
    final refreshBefore = DateTime.now().add(_sessionRefreshBuffer);
    return !expiry.isAfter(refreshBefore);
  }

  @override
  FailureOr<void> refreshSession() async {
    try {
      await client.auth.refreshSession();
      return const Right(null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
