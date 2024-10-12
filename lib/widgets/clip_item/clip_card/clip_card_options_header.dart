// ignore_for_file: use_build_context_synchronously

import 'package:clipboard/widgets/clip_item/leading_option.dart';
import 'package:clipboard/widgets/clip_item/primary_clip_action_button.dart';
import 'package:clipboard/widgets/clip_item/secondary_clip_action_button.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:flutter/material.dart';

class ClipCardOptionsHeader extends StatelessWidget {
  final bool hasFocusForPaste;
  final ClipboardItem item;
  final bool hovered;
  final bool selected;
  final bool selectionActive;

  const ClipCardOptionsHeader({
    super.key,
    this.hasFocusForPaste = false,
    this.hovered = false,
    this.selected = false,
    required this.selectionActive,
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
    return SizedBox.fromSize(
      size: const Size.fromHeight(42),
      child: Row(
        children: [
          LeadingClipboardOption(
            clipId: item.id,
            created: item.created,
            hovered: hovered || selectionActive,
            selected: selected,
          ),
          const Spacer(),
          width8,
          if (!selectionActive)
            SecondaryClipActionButton(
              item: item,
              hasFocusForPaste: hasFocusForPaste,
            ),
          if (!selectionActive)
            PrimaryClipActionButton(
              item: item,
              hasFocusForPaste: hasFocusForPaste,
              layout: AppLayout.grid,
            ),
        ],
      ),
    );
  }
}
