import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';

class TextPreview extends StatelessWidget {
  final ClipboardItem item;

  const TextPreview({super.key, required this.item});

  Color? hexToColor() {
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

    switch (item.textCategory) {
      case TextCategory.color:
        final bg = hexToColor() ?? colors.surfaceVariant;
        return Material(
          color: bg,
          borderRadius: item.isSynced ? radiusBottom12 : null,
          child: InkWell(
            borderRadius: item.isSynced ? radiusBottom12 : null,
            onTap: () {},
            child: SizedBox.expand(
              child: Center(
                child: Text(
                  item.text!,
                  style: textTheme.titleMedium?.copyWith(
                    color: bg.computeLuminance() < 0.35
                        ? Colors.white54
                        : Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        );
      case TextCategory.email:
      case TextCategory.phone:
        return Material(
          color: colors.secondaryContainer,
          borderRadius: item.isSynced ? radiusBottom12 : null,
          child: InkWell(
            borderRadius: item.isSynced ? radiusBottom12 : null,
            onTap: () {},
            child: SizedBox.expand(
              child: Center(
                child: Text(
                  item.text!,
                  style: textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
          ),
        );
      default:
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
                  item.text!,
                  overflow: TextOverflow.fade,
                  maxLines: 10,
                ),
              ),
            ),
          ),
        );
    }
  }
}
