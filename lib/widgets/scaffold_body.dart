import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:flutter/material.dart';

class ScaffoldBody extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  const ScaffoldBody({
    super.key,
    required this.child,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    if (isMobile) {
      return child;
    }

    final margin_ = margin ??
        const EdgeInsets.only(
          top: padding12,
          right: padding12,
        );
    return Card(
      margin: margin_,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      child: child,
    );
  }
}
