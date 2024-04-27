import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:clipboard/widgets/sync_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      case 2:
        context.goNamed(RouteConstants.collections);
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
          onPressed: () async {
            showTextSnackbar("Pasting to clipboard",
                isLoading: true, closePrevious: true);
            await context.read<OfflinePersistanceCubit>().paste();
            showTextSnackbar("Paste success", closePrevious: true);
          },
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
    if (widget.navbarActiveIndex == 2) {
      return FloatingActionButton(
        onPressed: () {},
        tooltip: "Create a new collection",
        child: const Icon(Icons.library_add_rounded),
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
                  icon: Icon(Icons.collections_bookmark),
                  label: "Collections",
                  tooltip: "Collections",
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
            icon: Icon(Icons.collections_bookmark),
            label: Text("Collections"),
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
          LayoutBuilder(builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(child: navRail),
              ),
            );
          }),
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
