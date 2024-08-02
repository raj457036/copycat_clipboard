import 'package:clipboard/widgets/dialogs/subscription_info.dart';
import 'package:clipboard/widgets/local_user.dart';
import 'package:clipboard/widgets/subscription/subscription_provider.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ActivePlanAction extends StatelessWidget {
  final bool compact;
  const ActivePlanAction({
    super.key,
    this.compact = false,
  });

  Future<void> action(
    BuildContext context, {
    bool entitlementGrantMode = false,
  }) async {
    SubscriptionInfoDialog(entitlementGrantMode: entitlementGrantMode)
        .open(context);
  }

  @override
  Widget build(BuildContext context) {
    return DisableForLocalUser(
      child: SubscriptionBuilder(
        builder: (context, subscription) {
          String label = subscription?.planName ?? "Free";
          if (!compact) {
            label = context.locale.currentPlanLabel(label);
          }
          return ElevatedButton.icon(
            onPressed: () => action(context),
            onLongPress: () => action(context, entitlementGrantMode: true),
            icon: const Icon(Icons.loyalty_rounded),
            label: Text(label),
          );
        },
      ),
    );
  }
}
