import 'package:clipboard/widgets/badges.dart';
import 'package:copycat_base/constants/strings/route_constants.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_pro/widgets/subscription/subscription_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExcludeCustomRules extends StatelessWidget {
  final bool enabled;
  const ExcludeCustomRules({
    super.key,
    this.enabled = true,
  });

  Future<void> navigateTo(BuildContext context) async {
    context.goNamed(RouteConstants.customExclusionRules);
  }

  @override
  Widget build(BuildContext context) {
    return SubscriptionBuilder(builder: (context, subscription) {
      final hasAccess =
          subscription != null && subscription.customExclusionRules;
      return ListTile(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Custom Rules"),
            width8,
            ProBadge(),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
          ),
        ),
        subtitle: const Text(
          "Exclude by app, title, url or regex pattern",
        ),
        enabled: enabled,
        trailing: const Icon(Icons.keyboard_arrow_right_rounded),
        onTap: hasAccess && enabled ? () => navigateTo(context) : null,
      );
    });
  }
}
