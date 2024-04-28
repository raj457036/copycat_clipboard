import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:flutter/material.dart';

class FileClipPreviewCard extends StatelessWidget {
  final ClipboardItem item;
  final bool isMobile;
  const FileClipPreviewCard({
    super.key,
    required this.item,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: isMobile
          ? const EdgeInsets.only(
              left: padding16,
              right: padding16,
              top: padding16,
            )
          : EdgeInsets.zero,
      shape: isMobile
          ? null
          : const RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(12),
              ),
            ),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(padding16),
          child: SelectableText(item.fileName ?? "Nothing here"),
        ),
      ),
    );
  }
}
