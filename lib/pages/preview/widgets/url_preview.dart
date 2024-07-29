import 'package:clipboard/l10n/l10n.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:flutter/material.dart';

class URLClipPreviewCard extends StatelessWidget {
  final ClipboardItem item;
  final bool isMobile;
  const URLClipPreviewCard({
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
          padding: const EdgeInsets.only(
            left: padding16,
            right: padding16,
            top: padding16,
            bottom: padding38 * 2.5,
          ),
          child: SelectableText(
            item.url ?? context.locale.nothingHere,
          ),
        ),
      ),
    );
  }
}
