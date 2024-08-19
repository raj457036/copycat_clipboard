import 'package:clipboard/widgets/dialogs/subscription_info.dart';
import 'package:clipboard/widgets/local_user.dart';
import 'package:copycat_pro/widgets/subscription/subscription_provider.dart';
import 'package:flutter/material.dart';

class ActivePlanAction extends StatelessWidget {
  const ActivePlanAction({super.key});

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
