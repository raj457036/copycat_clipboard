import 'package:clipboard/widgets/dialogs/attention.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class AttentionButton extends StatelessWidget {
  const AttentionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton.filled(
          onPressed: () {
            const AttentionDialog().show(context);
          },
          tooltip: context.locale.learnAboutFeatures,
          padding: const EdgeInsets.all(padding10),
          icon: const Icon(Icons.diversity_2_rounded),
        ),
        Positioned(
          bottom: -13,
          left: -10,
          right: -10,
          child: Chip(
            shape: const RoundedRectangleBorder(
              borderRadius: radius12,
              side: BorderSide(color: Colors.transparent),
            ),
            label: Text(context.locale.learn),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const EdgeInsets.symmetric(horizontal: padding10),
            backgroundColor: colors.primaryContainer,
            labelStyle: textTheme.bodySmall?.copyWith(
              color: colors.primary,
              fontWeight: FontWeight.bold,
            ),
            labelPadding: const EdgeInsets.fromLTRB(2, -6, 2, -6),
          ),
        ),
      ],
    );
  }
}
