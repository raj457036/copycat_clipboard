import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/db/subscription/subscription.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef SubscriptionWidgetBuilder = Widget Function(
    BuildContext context, Subscription? subscription);

class SubscriptionBuilder extends StatelessWidget {
  final SubscriptionWidgetBuilder builder;

  const SubscriptionBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthCubit, AuthState, Subscription?>(
      selector: (state) {
        return state.mapOrNull(
          authenticated: (state) =>
              state.subscription ?? Subscription.free(state.user.id),
        );
      },
      builder: builder,
    );
  }
}
