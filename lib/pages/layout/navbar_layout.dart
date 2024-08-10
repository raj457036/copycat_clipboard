import 'package:clipboard/pages/layout/widgets/bottom_navbar.dart';
import 'package:clipboard/pages/layout/widgets/navrail_layout.dart';
import 'package:clipboard/routes/utils.dart';
import 'package:clipboard/widgets/network_observer.dart';
import 'package:copycat_base/common/logging.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:flutter/material.dart';

class NavBarPage extends StatefulWidget {
  final Widget child;
  final int navbarActiveIndex;
  final int drawerActiveIndex;
  final int depth;

  const NavBarPage({
    super.key,
    required this.child,
    this.navbarActiveIndex = 0,
    this.drawerActiveIndex = 0,
    this.depth = 0,
  });

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final smallScreen = Breakpoints.isMobile(width);
    final floatingActions = getFloatingActionButton(
      context,
      widget.navbarActiveIndex,
      isMobile: smallScreen,
    );
    final scaffold = NetworkObserver(
      child: Scaffold(
        body: NavrailLayout(
          navbarActiveIndex: widget.navbarActiveIndex,
          floatingActionButton: floatingActions,
          child: widget.child,
        ),
        floatingActionButton:
            smallScreen && widget.depth == 1 ? floatingActions : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: smallScreen && widget.depth == 1
            ? BottomNavBar(navbarActiveIndex: widget.navbarActiveIndex)
            : null,
      ),
    );
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        logger.i("DID POP: $didPop");
      },
      child: scaffold,
    );
  }
}
