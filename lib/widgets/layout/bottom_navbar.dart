import 'package:clipboard/routes/utils.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int navbarActiveIndex;
  const BottomNavBar({
    super.key,
    required this.navbarActiveIndex,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 330) return const SizedBox.shrink();
        return NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle:
                textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold).msp,
            height: 45,
          ),
          child: NavigationBar(
            selectedIndex: navbarActiveIndex,
            onDestinationSelected: (idx) => onNavItemTapped(context, idx),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.paste_outlined),
                selectedIcon: const Icon(Icons.paste_rounded),
                label: context.locale.clipboard.sub(end: 15),
                tooltip: context.locale.clipboard,
              ),
              NavigationDestination(
                icon: const Icon(Icons.collections_bookmark_outlined),
                selectedIcon: const Icon(Icons.collections_bookmark_rounded),
                label: context.locale.collections,
                tooltip: context.locale.collections,
              ),
              NavigationDestination(
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings_rounded),
                label: context.locale.settings.sub(start: 0, end: 8),
                tooltip: context.locale.settings,
              ),
            ],
          ),
        );
      },
    );
  }
}
