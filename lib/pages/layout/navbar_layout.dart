import 'package:clipboard/common/logging.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
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
      default:
    }
  }

  Widget? getFloatingActionButton() {
    if (widget.navbarActiveIndex == 0) {
      return FloatingActionButton(
        onPressed: () {},
        tooltip: 'Paste',
        heroTag: "paste-fab",
        child: const Icon(Icons.paste_rounded),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final smallScreen = width <= 700;
    final scaffold = Scaffold(
      body: widget.child,
      floatingActionButton: smallScreen ? getFloatingActionButton() : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: smallScreen
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
                  icon: Icon(Icons.search),
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
      final navRail = NavigationRail(
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.grid_on),
            label: Text("Clipboard"),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.search),
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
        leading: getFloatingActionButton(),
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
