import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/color_extension.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final Color? color;
  final String? title;
  final String description;

  const InfoCard(
      {super.key, this.title, this.color, required this.description});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final textTheme = context.textTheme;
    return Card.filled(
      color: color?.lighter(50, isDark),
      margin: const EdgeInsets.symmetric(vertical: padding10),
      child: Padding(
        padding: const EdgeInsets.all(padding12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? context.locale.attentionNeeded,
              style: textTheme.titleMedium,
            ),
            height12,
            Text(description),
          ],
        ),
      ),
    );
  }
}
