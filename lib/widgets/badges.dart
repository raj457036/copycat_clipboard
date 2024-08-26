import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class ProBadge extends StatelessWidget {
  final bool noTooltip;
  const ProBadge({super.key, this.noTooltip = false});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    final chip = Chip(
      shape: const RoundedRectangleBorder(
        borderRadius: radius12,
        side: BorderSide(color: Colors.transparent),
      ),
      label: const Text("PRO"),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const EdgeInsets.symmetric(horizontal: padding10),
      backgroundColor: colors.primaryContainer,
      labelStyle: textTheme.labelSmall?.copyWith(
        color: colors.onPrimaryContainer,
        fontWeight: FontWeight.bold,
      ),
      labelPadding: const EdgeInsets.fromLTRB(2, -6, 2, -6),
    );

    if (noTooltip) return chip;
    return Tooltip(
      message: "This feature is available for Pro users only.",
      child: chip,
    );
  }
}
