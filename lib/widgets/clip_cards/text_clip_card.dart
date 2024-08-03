import 'package:clipboard/utils/utility.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class TextPreviewBody extends StatelessWidget {
  final Color? bg;
  final Widget child;

  const TextPreviewBody({
    super.key,
    required this.child,
    this.bg,
  });

  @override
  Widget build(BuildContext context) {
    final body = SizedBox.expand(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(padding8),
          child: child,
        ),
      ),
    );
    if (bg != null) {
      return Material(
        type: MaterialType.card,
        color: bg,
        borderRadius: radiusBottom12,
        child: body,
      );
    }
    return body;
  }
}

class TextClipCard extends StatelessWidget {
  final ClipboardItem item;

  const TextClipCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;

    Color? fg;
    final bg = hexToColor(item);
    if (bg != null) {
      fg = getFg(bg);
    }

    switch (item.textCategory) {
      case TextCategory.color:
        return TextPreviewBody(
          bg: bg,
          child: Text(
            item.text!,
            style: textTheme.titleMedium?.copyWith(
              color: fg,
            ),
          ),
        );
      case TextCategory.email:
      case TextCategory.phone:
        return TextPreviewBody(
          bg: colors.secondaryContainer,
          child: Text(
            item.text!,
            style: textTheme.titleMedium,
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
        );
      default:
        return TextPreviewBody(
          child: Text(
            item.text!,
            overflow: TextOverflow.fade,
            style: textTheme.bodySmall,
          ),
        );
    }
  }
}
