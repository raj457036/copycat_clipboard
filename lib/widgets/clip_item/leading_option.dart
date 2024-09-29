import 'package:clipboard/widgets/clip_item/clip_create_time.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:flutter/material.dart';

class LeadingClipboardOption extends StatelessWidget {
  final DateTime created;
  final bool hovered;
  final EdgeInsets? createdPadding;

  const LeadingClipboardOption({
    super.key,
    this.hovered = false,
    this.createdPadding,
    required this.created,
  });

  @override
  Widget build(BuildContext context) {
    if (hovered) {
      return Padding(
        padding: const EdgeInsets.only(left: padding4),
        child: SizedBox.square(
          dimension: 32,
          child: IconButton(
            style: IconButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            tooltip: "Select",
            onPressed: () {},
            icon: const Icon(Icons.circle_outlined),
          ),
        ),
      );
    }
    return ClipCreateTime(created: created, padding: createdPadding);
  }
}
