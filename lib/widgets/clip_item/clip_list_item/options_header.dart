import 'package:clipboard/widgets/clip_item/leading_option.dart';
import 'package:clipboard/widgets/clip_item/primary_clip_action_button.dart';
import 'package:clipboard/widgets/clip_item/secondary_clip_action_button.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:flutter/material.dart';

class ClipListItemOptionHeader extends StatelessWidget {
  final ClipboardItem item;
  final bool hasFocusForPaste;
  final bool hovered;
  final bool selected;
  final bool selectionActive;

  const ClipListItemOptionHeader({
    super.key,
    required this.item,
    required this.hasFocusForPaste,
    required this.hovered,
    required this.selectionActive,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: LeadingClipboardOption(
                item: item,
                createdPadding: const EdgeInsets.symmetric(
                  vertical: padding4,
                  horizontal: padding10,
                ),
                padding: EdgeInsets.zero,
                created: item.created,
                hovered: hovered || selectionActive,
                selected: selected,
                layout: AppLayout.list,
              ),
            ),
          ),
          if (!selectionActive)
            SecondaryClipActionButton(
              item: item,
              hasFocusForPaste: hasFocusForPaste,
              layout: AppLayout.list,
            ),
          if (!selectionActive)
            PrimaryClipActionButton(
              item: item,
              hasFocusForPaste: hasFocusForPaste,
              layout: AppLayout.list,
            ),
          // width4,
        ],
      ),
    );
  }
}
