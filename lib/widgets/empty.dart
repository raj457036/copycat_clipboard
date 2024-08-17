import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class EmptyNote extends StatelessWidget {
  final String note;
  const EmptyNote({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.emoji_nature_rounded,
            size: 40,
            color: colors.outline,
          ),
          height8,
          Text(
            note,
            style: textTheme.bodyLarge?.copyWith(
              color: colors.outline,
            ),
          ),
        ],
      ),
    );
  }
}
