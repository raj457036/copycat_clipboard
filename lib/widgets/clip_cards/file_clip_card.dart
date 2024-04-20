import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/common_extension.dart';
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
            child: Center(
              child: item.fileName != null
                  ? Text(
                      "${item.fileName}\n(${item.fileMimeType})",
                      overflow: TextOverflow.fade,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: textTheme.titleMedium
                          ?.copyWith(color: colors.onTertiaryContainer),
                    )
                  : const Icon(Icons.folder_open),
            ),
          ),
        ),
      ),
    );
  }
}
