import 'package:clipboard/constants/numbers/breakpoints.dart';
import 'package:clipboard/routes/utils.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

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
    final metaKey = Platform.isMacOS ? "⌘" : "control";
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
                child: NavigationRail(
                  destinations: [
                    const NavigationRailDestination(
                      icon: Icon(Icons.paste_rounded),
                      label: Text("Clipboard"),
                    ),
                    NavigationRailDestination(
                      icon: Tooltip(
                        message: "Shortcut: $metaKey + F",
                        child: const Icon(Icons.content_paste_search_rounded),
                      ),
                      label: const Text("Search"),
                    ),
                    const NavigationRailDestination(
                      icon: Icon(Icons.collections_bookmark),
                      label: Text("Collection"),
                    ),
                    const NavigationRailDestination(
                      icon: Icon(Icons.settings),
                      label: Text("Settings"),
                    ),
                  ],
                  leading: floatingActionButton,
                  labelType: NavigationRailLabelType.all,
                  groupAlignment: 0,
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
