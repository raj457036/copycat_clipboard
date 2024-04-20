import 'package:clipboard/common/logging.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/widgets/sync_status.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        context.goNamed(RouteConstants.search);
        break;
      // case 2:
      //   context.goNamed(RouteConstants.journal);
      //   break;
      case 2:
        break;
      case 3:
        context.goNamed(RouteConstants.settings);
        break;
      default:
    }
  }

  Widget? getFloatingActionButton({bool isMobile = false}) {
    if (widget.navbarActiveIndex == 0) {
      final actions = [
        FloatingActionButton(
          onPressed: () {},
          tooltip: 'Paste',
          heroTag: "paste-fab",
          child: const Icon(Icons.content_paste_go_rounded),
        ),
        height8,
        const SyncStatusButton()
      ];
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: isMobile ? actions.reversed.toList() : actions,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final smallScreen = width <= 576;
    final scaffold = Scaffold(
      body: widget.child,
      floatingActionButton:
          smallScreen ? getFloatingActionButton(isMobile: smallScreen) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: smallScreen
          ? NavigationBar(
              selectedIndex: widget.navbarActiveIndex,
              onDestinationSelected: _onNavItemTapped,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.paste_rounded),
                  label: "Clipboard",
                  tooltip: "Clipboard",
                ),
                NavigationDestination(
                  icon: Icon(Icons.content_paste_search_rounded),
                  label: "Search",
                  tooltip: "Search Clipboard",
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

    if (smallScreen) {
      child = scaffold;
    } else {
      final floatingButton = getFloatingActionButton();
      final navRail = NavigationRail(
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.paste_rounded),
            label: Text("Clipboard"),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.content_paste_search_rounded),
            label: Text("Search"),
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
        leading: floatingButton,
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
        logger.i("DID POP: $didPop");
      },
      child: child,
    );
  }
}
