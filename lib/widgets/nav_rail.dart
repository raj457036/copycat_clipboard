import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/routes/utils.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/attention_button.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:flutter/material.dart';

class LeftNavRail extends StatelessWidget {
  final Widget child;
  final Widget? floatingActionButton;
  final int navbarActiveIndex;

  const LeftNavRail({
    super.key,
    required this.child,
    required this.navbarActiveIndex,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (Breakpoints.isMobile(constraints.maxWidth)) {
          return child;
        }
        return Row(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: constraints.maxHeight,
                width: 82,
                child: NavigationRail(
                  destinations: [
                    NavigationRailDestination(
                      icon: Tooltip(
                        message: "$metaKey + D",
                        child: const Icon(Icons.paste_rounded),
                      ),
                      label: Text(
                        context.locale.clipboard,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Tooltip(
                        message: "$metaKey + F",
                        child: const Icon(Icons.content_paste_search_rounded),
                      ),
                      label: Text(
                        context.locale.search,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Tooltip(
                        message: "$metaKey + C",
                        child: const Icon(Icons.collections_bookmark),
                      ),
                      label: Text(
                        context.locale.collection,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Tooltip(
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
                    height: navbarActiveIndex == 1 ? 90 : 120,
                    child: floatingActionButton,
                  ),
                  labelType: NavigationRailLabelType.all,
                  groupAlignment: -.6,
                  elevation: 1,
                  selectedIndex: navbarActiveIndex,
                  onDestinationSelected: (idx) => onNavItemTapped(context, idx),
                ),
              ),
            ),
            Expanded(child: child),
          ],
        );
      },
    );
  }
}
