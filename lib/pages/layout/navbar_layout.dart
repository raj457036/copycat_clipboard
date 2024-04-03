import 'package:clipboard/common/logging.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _desktopLayout = '''
nav content
nav content
''';

const _phoneLayout = '''
content content
nav nav
''';

class NavBarPage extends StatefulWidget {
  final Widget child;
  final int navbarActiveIndex;
  final int drawerActiveIndex;

  const NavBarPage({
    super.key,
    required this.child,
    this.navbarActiveIndex = 0,
    this.drawerActiveIndex = 0,
  });

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  void _onNavItemTapped(int index) {
    switch (index) {
      case 0:
        context.goNamed(RouteConstants.home);
        break;
      case 1:
        break;
      // case 2:
      //   context.goNamed(RouteConstants.journal);
      //   break;
      case 2:
        break;
      default:
    }
  }

  Widget? getFloatingActionButton({bool isMobile = true}) {
    if (widget.navbarActiveIndex == 0) {
      if (isMobile) {
        return FloatingActionButton(
          onPressed: () {},
          tooltip: 'Paste',
          child: const Icon(Icons.paste_rounded),
        );
      } else {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {},
              tooltip: 'Search',
              child: const Icon(Icons.search),
            ),
            height16,
            FloatingActionButton.small(
              onPressed: () {},
              tooltip: 'Paste',
              child: const Icon(Icons.paste_rounded),
            ),
          ],
        );
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = context.breakpoints.isMobile;
    final scaffold = Scaffold(
      body: widget.child,
      floatingActionButton: isMobile ? getFloatingActionButton() : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: isMobile
          ? NavigationBar(
              selectedIndex: widget.navbarActiveIndex,
              onDestinationSelected: _onNavItemTapped,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.grid_on),
                  label: "Clipboard",
                  tooltip: "Clipboard",
                ),
                NavigationDestination(
                  icon: Icon(Icons.workspaces_rounded),
                  label: "Workspaces",
                  tooltip: "Workspaces",
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings),
                  label: "Settings",
                  tooltip: "Settings",
                ),
              ],
            )
          : null,
    );

    late Widget child;

    if (isMobile) {
      child = scaffold;
    } else {
      final navRail = NavigationRail(
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.grid_on),
            label: Text("Clipboard"),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.workspaces_rounded),
            label: Text("Workspaces"),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.settings),
            label: Text("Settings"),
          ),
        ],
        leading: getFloatingActionButton(isMobile: false),
        labelType: NavigationRailLabelType.all,
        groupAlignment: 0,
        selectedIndex: widget.navbarActiveIndex,
        onDestinationSelected: _onNavItemTapped,
      );

      child = Row(
        children: [
          navRail,
          Expanded(child: scaffold),
        ],
      );
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        logger.info("DID POP: $didPop");
      },
      child: child,
    );
  }
}
