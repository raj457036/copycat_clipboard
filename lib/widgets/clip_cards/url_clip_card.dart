import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class UrlClipCard extends StatelessWidget {
  final ClipboardItem item;

  const UrlClipCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return SizedBox.expand(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(padding8),
          child: Text(
            item.url!,
            overflow: TextOverflow.fade,
            style: textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
