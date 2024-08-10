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
    return Card(
      margin: margin ??
          const EdgeInsets.only(
            top: padding12,
            right: padding12,
          ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      child: child,
    );
  }
}
