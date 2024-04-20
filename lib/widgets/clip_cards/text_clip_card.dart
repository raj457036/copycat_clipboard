import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/utils/common_extension.dart';
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
    final body = InkWell(
      borderRadius: radius8,
      onTap: () {},
      child: SizedBox.expand(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(padding8),
            child: child,
          ),
        ),
      ),
    );
    if (bg != null) {
      return Material(
        color: bg,
        borderRadius: radius8,
        child: body,
      );
    }
    return body;
  }
}

class TextPreview extends StatelessWidget {
  final ClipboardItem item;

  const TextPreview({
    super.key,
    required this.item,
  });

  Color? hexToColor() {
    if (item.textCategory != TextCategory.color) return null;
    String hex = item.text!.replaceAll('#', '');

    if (hex.length == 3) {
      // Expand shorthand format (e.g., #abc to #aabbcc)
      hex = '${hex[0]}${hex[0]}${hex[1]}${hex[1]}${hex[2]}${hex[2]}FF';
    } else if (hex.length == 6) {
      // Add alpha value if not specified
      hex = 'FF$hex';
    } else if (hex.length != 8) {
      // Check for valid length
      return null;
    }

    return Color(int.parse(hex, radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;

    Color? fg;
    final bg = hexToColor();
    if (bg != null) {
      fg = bg.computeLuminance() < 0.35 ? Colors.white54 : Colors.black54;
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
            // maxLines: 10,
            style: textTheme.bodySmall,
          ),
        );
    }
  }
}
