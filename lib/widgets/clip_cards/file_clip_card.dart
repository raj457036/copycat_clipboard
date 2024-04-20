import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/material.dart';

class FilePreview extends StatelessWidget {
  final ClipboardItem item;

  const FilePreview({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;

    return Material(
      color: colors.tertiaryContainer,
      borderRadius: radius8,
      child: InkWell(
        borderRadius: radius8,
        onTap: () {},
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(padding8),
            child: FittedBox(
              child: Center(
                child: item.fileName != null
                    ? Text.rich(
                        TextSpan(text: item.fileName, children: [
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
                            color: colors.onTertiaryContainer, height: 1.8),
                      )
                    : const Icon(Icons.folder_open),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
