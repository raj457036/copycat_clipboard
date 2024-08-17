import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/network_observer.dart';
import 'package:clipboard/widgets/titlebar.dart';
import 'package:copycat_base/common/logging.dart';
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
    Widget child = NetworkObserver(child: widget.child);
    if (isDesktopPlatform) child = TitlebarView(child: child);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        logger.i("DID POP: $didPop");
      },
      child: child,
    );
  }
}
