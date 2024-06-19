import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/widgets/dialogs/subscription_info.dart';
import 'package:clipboard/widgets/subscription/subscription_provider.dart';
import 'package:flutter/material.dart';

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
    return SubscriptionBuilder(
      builder: (context, subscription) {
        String label = subscription.planName;
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
