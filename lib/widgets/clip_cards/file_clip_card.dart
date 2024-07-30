import 'package:clipboard/utils/utility.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class FileClipCard extends StatelessWidget {
  final ClipboardItem item;

  const FileClipCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;

    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(padding8),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Center(
            child: Text.rich(
              TextSpan(text: item.fileName?.sub(end: 10), children: [
                if (item.fileMimeType != null)
                  TextSpan(
                    text: "\n(${item.fileMimeType})",
                    style: textTheme.labelMedium?.copyWith(
                      color: colors.onTertiaryContainer,
                    ),
                  ),
                if (item.fileSize != null)
                  TextSpan(
                    text: "\n${formatBytes(item.fileSize!)}",
                    style: textTheme.labelSmall?.copyWith(
                      color: colors.onTertiaryContainer,
                    ),
                  )
              ]),
              overflow: TextOverflow.fade,
              maxLines: 5,
              textAlign: TextAlign.center,
              style: textTheme.titleMedium?.copyWith(
                color: colors.onTertiaryContainer,
                height: 1.8,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
