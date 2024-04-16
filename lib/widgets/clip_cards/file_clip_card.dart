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

    return Material(
      color: colors.surfaceVariant,
      borderRadius: item.isSynced ? radiusBottom12 : null,
      child: InkWell(
        borderRadius: item.isSynced ? radiusBottom12 : null,
        onTap: () {},
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(padding8),
            child: item.fileName != null
                ? Text(
                    item.fileName!,
                    overflow: TextOverflow.fade,
                    maxLines: 10,
                  )
                : const Icon(Icons.folder_open),
          ),
        ),
      ),
    );
  }
}
