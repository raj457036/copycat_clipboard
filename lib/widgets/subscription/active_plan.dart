import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/db/subscription/subscription.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/widgets/dialogs/subscription_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivePlanAction extends StatelessWidget {
  final bool compact;
  const ActivePlanAction({
    super.key,
    this.compact = false,
  });

  Future<void> action(BuildContext context) async {
    const SubscriptionInfoDialog().open(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthCubit, AuthState, Subscription?>(
      selector: (state) {
        return switch (state) {
          AuthenticatedAuthState(:final user, :final subscription) =>
            subscription ?? Subscription.free(user.id),
          _ => null,
        };
      },
      builder: (context, state) {
        if (state == null) return const SizedBox.shrink();
        String label = state.planName;
        if (!compact) {
          label = context.locale.currentPlanLabel(label);
        }
        return ElevatedButton.icon(
          onPressed: () => action(context),
          icon: const Icon(Icons.loyalty_rounded),
          label: Text(label),
        );
      },
    );
  }
}
