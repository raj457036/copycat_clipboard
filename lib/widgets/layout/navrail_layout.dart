import 'package:clipboard/widgets/layout/navrail.dart';
import 'package:flutter/material.dart';

class NavrailLayout extends StatelessWidget {
  final Widget? floatingActionButton;
  final int navbarActiveIndex;
  final Widget child;

  const NavrailLayout({
    super.key,
    required this.navbarActiveIndex,
    required this.child,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NavLayoutNavrail(
          navbarActiveIndex: navbarActiveIndex,
          floatingActionButton: floatingActionButton,
        ),
        Expanded(child: child),
      ],
    );
  }
}
