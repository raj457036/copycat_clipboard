// ignore_for_file: use_build_context_synchronously

import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:clipboard/widgets/clip_cards/primary_clip_action_button.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/datetime_extension.dart';
import 'package:flutter/material.dart';

class ClipCardOptionsHeader extends StatelessWidget {
  final bool hasFocusForPaste;
  final ClipboardItem item;

  const ClipCardOptionsHeader({
    super.key,
    this.hasFocusForPaste = false,
    required this.item,
  });

  Widget getType() {
    switch (item.type) {
      case ClipItemType.text:
        return const Icon(Icons.abc_outlined, size: 20);
      case ClipItemType.media:
        return const Icon(Icons.image_outlined, size: 20);
      case ClipItemType.url:
        return const Icon(Icons.http_rounded, size: 20);
      case ClipItemType.file:
        return const Icon(Icons.description, size: 20);
    }
  }

  String getTitle() {
    if (item.title != null) return item.title!;
    switch (item.type) {
      case ClipItemType.text:
        switch (item.textCategory) {
          case TextCategory.color:
            return "Color";
          case TextCategory.email:
            return "Email";
          case TextCategory.phone:
            return "Phone";
          default:
            return "Text";
        }
      case ClipItemType.media:
        return "Media";
      case ClipItemType.url:
        return "URL";
      case ClipItemType.file:
        return "File";
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    final created = item.created.isToday()
        ? item.created.ago(context.locale.localeName)
        : dateFormatter(context.locale.localeName)
            .format(item.created.toLocal());
    return SizedBox.fromSize(
      size: const Size.fromHeight(42),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          return Row(
            children: [
              width12,
              Expanded(
                child: Text(
                  created,
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: colors.outline,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
              ),
              width8,
              if (width > 100 && item.type == ClipItemType.url)
                Focus(
                  canRequestFocus: !hasFocusForPaste,
                  skipTraversal: hasFocusForPaste,
                  descendantsAreTraversable: !hasFocusForPaste,
                  descendantsAreFocusable: !hasFocusForPaste,
                  child: IconButton(
                    onPressed: () => launchUrl(item),
                    icon: const Icon(
                      Icons.open_in_new,
                    ),
                    tooltip: context.locale.openInBrowser,
                    style: IconButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                    ),
                  ),
                ),
              if (width > 100 && item.textCategory == TextCategory.phone)
                Focus(
                  canRequestFocus: !hasFocusForPaste,
                  skipTraversal: hasFocusForPaste,
                  descendantsAreTraversable: !hasFocusForPaste,
                  descendantsAreFocusable: !hasFocusForPaste,
                  child: IconButton(
                    onPressed: () => launchPhone(item),
                    icon: const Icon(
                      Icons.call,
                    ),
                    tooltip: context.locale.makePhoneCall,
                    style: IconButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                    ),
                  ),
                ),
              if (item.needDownload)
                IconButton(
                  icon: item.downloading
                      ? SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(
                            value: item.downloadProgress,
                            strokeWidth: 2,
                          ),
                        )
                      : Icon(
                          Icons.download_for_offline_outlined,
                          color: colors.onSurfaceVariant,
                        ),
                  onPressed: hasFocusForPaste || item.downloading
                      ? null
                      : () => downloadFile(context, item),
                  tooltip: item.downloading
                      ? context.locale.downloading
                      : context.locale.downloadForOffline,
                  style: IconButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                      ),
                    ),
                  ),
                )
              else
                PrimaryClipActionButton(
                  item: item,
                  hasFocusForPaste: hasFocusForPaste,
                ),
            ],
          );
        },
      ),
    );
  }
}
