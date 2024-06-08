import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/material.dart';

class TextClipPreviewCard extends StatelessWidget {
  final ClipboardItem item;
  final bool isMobile;
  const TextClipPreviewCard({
    super.key,
    required this.item,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    Color? fg;
    final bg = hexToColor(item);
    if (bg != null) {
      fg = getFg(bg);
    }

    return Card.filled(
      color: bg,
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
          padding: const EdgeInsets.only(
            left: padding16,
            right: padding16,
            top: padding16,
            bottom: padding38,
          ),
          child: SelectableText(
            item.text ?? context.locale.nothingHere,
            style: TextStyle(color: fg),
          ),
        ),
      ),
    );
  }
}
