import 'package:clipboard/bloc/monetization_cubit/monetization_cubit.dart';
import 'package:copycat_base/db/subscription/subscription.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef SubscriptionWidgetBuilder = Widget Function(
  BuildContext context,
  Subscription? subscription,
);

class SubscriptionBuilder extends StatelessWidget {
  final bool autoDowngrade;
  final SubscriptionWidgetBuilder builder;

  const SubscriptionBuilder({
    super.key,
    required this.builder,
    this.autoDowngrade = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MonetizationCubit, MonetizationState, Subscription?>(
      selector: (state) {
        return state.whenOrNull(
          active: (info, subscription) {
            return subscription;
          },
        );
      },
      builder: builder,
    );
  }
}
