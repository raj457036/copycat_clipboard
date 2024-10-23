import 'package:clipboard/widgets/subscription/active_plan.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';

class CollectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CollectionAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Text(context.locale.collections),
      actions: const [
        ActivePlanAction(),
        width12,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
