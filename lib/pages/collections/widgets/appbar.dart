import 'package:clipboard/widgets/subscription/active_plan.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';

class CollectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CollectionAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      title: Text(context.locale.collections),
      actions: [
        ActivePlanAction(compact: isMobile),
        width12,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
