import 'package:clipboard/common/logging.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarPage extends StatefulWidget {
  final Widget child;
  final int navbarActiveIndex;
  final int drawerActiveIndex;

  const BottomNavigationBarPage({
    super.key,
    required this.child,
    this.navbarActiveIndex = 0,
    this.drawerActiveIndex = 0,
  });

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
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

  Widget? getFloatingActionButton() {
    if (widget.navbarActiveIndex == 0) {
      return FloatingActionButton.extended(
        onPressed: () {},
        tooltip: 'Paste',
        icon: const Icon(Icons.paste_rounded),
        label: const Text("Paste"),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        logger.info("DID POP: $didPop");
      },
      child: Scaffold(
        body: widget.child,
        floatingActionButton: getFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: BottomNavigationBar(
          useLegacyColorScheme: false,
          currentIndex: widget.navbarActiveIndex,
          onTap: _onNavItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.paste),
              label: "Clipboard",
              tooltip: "Clipboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: "Folders",
              tooltip: "Folders",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
              tooltip: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
