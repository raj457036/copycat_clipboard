import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';

class UrlPreview extends StatelessWidget {
  final ClipboardItem item;

  const UrlPreview({super.key, required this.item});

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
            child: Text(
              item.url!,
              overflow: TextOverflow.fade,
              maxLines: 10,
            ),
          ),
        ),
      ),
    );
  }
}
