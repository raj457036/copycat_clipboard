import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class SettingHeader extends StatelessWidget {
  final IconData? icon;
  final String name;
  final String? tooltip;
  const SettingHeader({
    super.key,
    required this.name,
    this.icon,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    Widget label = Text(
      name,
      style: textTheme.titleSmall?.copyWith(
        color: colors.outline,
      ),
    );

    if (icon != null) {
      label = Row(
        children: [
          Icon(icon, color: colors.outline),
          width8,
          label,
        ],
      );
    }

    Widget child = Padding(
      padding: const EdgeInsets.only(
        left: padding16,
      ),
      child: label,
    );

    if (tooltip != null) {
      child = Tooltip(
        message: tooltip,
        child: child,
      );
    }

    return child;
  }
}
