import 'package:clipboard/widgets/layout/bottom_navbar.dart';
import 'package:clipboard/widgets/layout/dynamic_floating_actions.dart';
import 'package:clipboard/widgets/layout/navrail_layout.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final int activeIndex;
  final PreferredSizeWidget? appBar;
  final Drawer? endDrawer;
  final Widget body;

  const CustomScaffold({
    super.key,
    required this.activeIndex,
    required this.body,
    this.appBar,
    this.endDrawer,
  });

  @override
  Widget build(BuildContext context) {
    final width = context.mq.size.width;
    final smallScreen = Breakpoints.isMobile(width);
    final floatingActions = DynamicFloatingActions(
      activeIndex: activeIndex,
      reversed: smallScreen,
      showCopyCatLogo: (activeIndex == 0 || activeIndex == 2) && !smallScreen,
    );

    Widget scaffoldBody = body;
    Widget? floatingActionButton;
    Widget? bottomNavBar;

    if (smallScreen) {
      bottomNavBar = BottomNavBar(navbarActiveIndex: activeIndex);
      floatingActionButton = floatingActions;
    }

    Widget scaffold = Scaffold(
      appBar: appBar,
      endDrawer: endDrawer,
      body: scaffoldBody,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: bottomNavBar,
    );

    if (!smallScreen) {
      scaffold = NavrailLayout(
        navbarActiveIndex: activeIndex,
        floatingActionButton: floatingActions,
        child: scaffold,
      );
    }

    return scaffold;
  }
}
