import 'package:clipboard/widgets/clip_item/clip_create_time.dart';
import 'package:clipboard/widgets/clip_item/primary_clip_action_button.dart';
import 'package:clipboard/widgets/clip_item/secondary_clip_action_button.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:flutter/material.dart';

class ClipListItemOptionHeader extends StatelessWidget {
  final ClipboardItem item;
  final bool hasFocusForPaste;
  const ClipListItemOptionHeader({
    super.key,
    required this.item,
    required this.hasFocusForPaste,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: padding8, horizontal: padding10),
          child: ClipCreateTime(
            created: item.created,
            padding: EdgeInsets.zero,
          ),
        ),
        const Spacer(),
        SecondaryClipActionButton(
          item: item,
          hasFocusForPaste: hasFocusForPaste,
          layout: AppLayout.list,
        ),
        PrimaryClipActionButton(
          item: item,
          hasFocusForPaste: hasFocusForPaste,
          layout: AppLayout.list,
        ),
        width6,
      ],
    );
  }
}
