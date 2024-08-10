import 'package:clipboard/routes/utils.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/attention_button.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/constants/strings/asset_constants.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class NavrailLayout extends StatelessWidget {
  final Widget? floatingActionButton;
  final int navbarActiveIndex;
  final Widget child;
  const NavrailLayout({
    super.key,
    required this.navbarActiveIndex,
    required this.child,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final labelStyle =
        textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold);
    final width = MediaQuery.of(context).size.width;

    final isMobileView = Breakpoints.isMobile(width);
    if (isMobileView) {
      return child;
    }

    return Row(
      children: [
        SizedBox(
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
                height: 150,
                child: floatingActionButton != null
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            AssetConstants.catImage,
                            fit: BoxFit.cover,
                            width: 40,
                            height: 40,
                            alignment: Alignment.topCenter,
                          ),
                          floatingActionButton!,
                        ],
                      )
                    : null,
              ),
              labelType: NavigationRailLabelType.all,
              groupAlignment: -.5,
              selectedIndex: navbarActiveIndex,
              onDestinationSelected: (idx) => onNavItemTapped(context, idx),
            ),
          ),
        ),
        Expanded(child: child),
      ],
    );
  }
}
