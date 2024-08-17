import 'package:clipboard/widgets/copycat_logo.dart';
import 'package:clipboard/widgets/subscription/active_plan.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    return AppBar(
      title: Stack(
        clipBehavior: Clip.none,
        children: [
          const Positioned(
            top: -13,
            child: RotatedBox(
              quarterTurns: 2,
              child: CopyCatLogo(dimension: 50),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 53),
            child: Text(context.locale.appName),
          ),
        ],
      ),
      titleTextStyle: textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      actions: [
        ActivePlanAction(compact: isMobile),
        width12,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
