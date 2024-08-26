import 'package:clipboard/routes/utils.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/attention_button.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class NavLayoutNavrail extends StatelessWidget {
  final Widget? floatingActionButton;
  final int navbarActiveIndex;

  const NavLayoutNavrail({
    super.key,
    this.floatingActionButton,
    required this.navbarActiveIndex,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final labelStyle =
        textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold);
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      descendantsAreFocusable: false,
      descendantsAreTraversable: false,
      child: SizedBox(
        width: 80,
        child: NavigationRailTheme(
          data: NavigationRailThemeData(
            selectedLabelTextStyle: labelStyle,
            unselectedLabelTextStyle: labelStyle,
            elevation: 0,
          ),
          child: NavigationRail(
            destinations: [
              NavigationRailDestination(
                padding: EdgeInsets.zero,
                icon: Tooltip(
                  message: "$metaKey + D",
                  child: const Icon(Icons.paste_outlined),
                ),
                selectedIcon: Tooltip(
                  message: "$metaKey + D",
                  child: const Icon(Icons.paste_rounded),
                ),
                label: Text(
                  context.locale.clipboard,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              NavigationRailDestination(
                padding: EdgeInsets.zero,
                icon: Tooltip(
                  message: "$metaKey + F",
                  child: const Icon(Icons.content_paste_search_outlined),
                ),
                selectedIcon: Tooltip(
                  message: "$metaKey + F",
                  child: const Icon(Icons.content_paste_search_rounded),
                ),
                label: Text(
                  context.locale.search,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              NavigationRailDestination(
                padding: EdgeInsets.zero,
                icon: Tooltip(
                  message: "$metaKey + C",
                  child: const Icon(Icons.collections_bookmark_outlined),
                ),
                selectedIcon: Tooltip(
                  message: "$metaKey + C",
                  child: const Icon(Icons.collections_bookmark_rounded),
                ),
                label: Text(
                  context.locale.collection,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              NavigationRailDestination(
                padding: EdgeInsets.zero,
                icon: Tooltip(
                  message: "$metaKey + X",
                  child: const Icon(Icons.settings_outlined),
                ),
                selectedIcon: Tooltip(
                  message: "$metaKey + X",
                  child: const Icon(Icons.settings),
                ),
                label: Text(
                  context.locale.settings,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
            trailing: const AttentionButton(),
            leading: SizedBox(
              height: 155,
              child: floatingActionButton,
            ),
            labelType: NavigationRailLabelType.all,
            groupAlignment: -.5,
            selectedIndex: navbarActiveIndex,
            onDestinationSelected: (idx) => onNavItemTapped(context, idx),
          ),
        ),
      ),
    );
  }
}
