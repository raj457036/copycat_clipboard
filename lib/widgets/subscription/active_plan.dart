import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/db/subscription/subscription.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivePlanAction extends StatelessWidget {
  final bool compact;
  const ActivePlanAction({
    super.key,
    this.compact = false,
  });

  void action() {
    showTextSnackbar(
      "CopyCat is in Beta Version. "
      "Subscription with more features will be available soon.",
    );
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
          label = "Active Plan • $label";
        }
        return ElevatedButton.icon(
          onPressed: action,
          icon: const Icon(Icons.monetization_on_rounded),
          label: Text(label),
        );
      },
    );
  }
}
