import 'package:clipboard/utils/utility.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class TextPreviewBody extends StatelessWidget {
  final Color? bg;
  final Widget child;
  final AppLayout layout;

  const TextPreviewBody({
    super.key,
    required this.child,
    this.bg,
    required this.layout,
  });

  @override
  Widget build(BuildContext context) {
    final body = Padding(
      padding: layout == AppLayout.grid
          ? const EdgeInsets.all(padding8)
          : const EdgeInsets.only(
              left: padding10,
              right: padding10,
              bottom: padding10,
            ),
      child: child,
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
  final AppLayout layout;
  final ClipboardItem item;

  const TextClipCard({
    super.key,
    required this.layout,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;

    switch (item.textCategory) {
      case TextCategory.color:
        Color? fg;
        final bg = hexToColor(item);
        if (bg != null) {
          fg = getFg(bg);
        }
        return SizedBox.expand(
          child: TextPreviewBody(
            bg: bg,
            layout: layout,
            child: Center(
              child: Text(
                item.text!,
                style: textTheme.titleMedium?.copyWith(
                  color: fg,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      case TextCategory.email:
      case TextCategory.phone:
        return TextPreviewBody(
          bg: colors.secondaryContainer,
          layout: layout,
          child: Text(
            item.text!,
            style: textTheme.titleMedium,
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
        );
      default:
        return TextPreviewBody(
          layout: layout,
          child: Text(
            item.text!,
            overflow: TextOverflow.fade,
            style: textTheme.bodySmall,
          ),
        );
    }
  }
}
