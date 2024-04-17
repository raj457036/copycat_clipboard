import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';

class SettingHeader extends StatelessWidget {
  final String name;
  const SettingHeader({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.only(
        left: padding16,
      ),
      child: Text(
        name,
        style: textTheme.titleSmall?.copyWith(
          color: colors.outline,
        ),
      ),
    );
  }
}
