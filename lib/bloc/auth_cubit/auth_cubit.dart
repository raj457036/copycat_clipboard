import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/data/repositories/subscription.dart';
import 'package:clipboard/db/subscription/subscription.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  SupabaseClient sbClient;
  SubscriptionRepository subRepo;

  AuthCubit(
    this.sbClient,
    this.subRepo,
  ) : super(const AuthState.unknown());

  /// validate the code and return a suitable page path
  Future<String?> validateAuthCode(String code) async {
    final exchange = await sbClient.auth.exchangeCodeForSession(code);

    switch (exchange.redirectType) {
      case "passwordRecovery":
        authenticated(exchange.session, exchange.session.user);
        return RouteConstants.resetPassword;
      case _:
        logger.w("Exchange not supported. ${exchange.redirectType}");
    }
    return null;
  }

  String? get userId =>
      state.whenOrNull(authenticated: (_, user, __) => user.id);

  Session? get session => sbClient.auth.currentSession;

  Subscription? get subscription =>
      state.whenOrNull(authenticated: (_, __, sub) => sub);

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

  Future<void> fetchSubscription() async {
    if (session != null) {
      await authenticated(session!, session!.user);
    }
  }

  Future<void> authenticated(Session session, User user) async {
    final subResult = await subRepo.get();

    final sub = subResult.fold(
      (l) {
        logger.e(l);
      },
      (r) => r,
    );

    emit(AuthState.authenticated(
      session: session,
      user: user,
      subscription: sub,
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
