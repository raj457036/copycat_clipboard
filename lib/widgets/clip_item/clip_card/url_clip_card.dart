import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class UrlClipCard extends StatelessWidget {
  final AppLayout layout;
  final ClipboardItem item;

  const UrlClipCard({
    super.key,
    required this.item,
    required this.layout,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final child = Text(
      item.url!,
      overflow: TextOverflow.fade,
      style: textTheme.bodySmall,
    );
    return layout == AppLayout.grid
        ? SizedBox.expand(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(padding8),
                child: child,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(
                left: padding10, right: padding10, bottom: padding10),
            child: child,
          );
  }
}
