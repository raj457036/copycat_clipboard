import 'package:clipboard/widgets/clip_item/clip_card/clip_card_body.dart';
import 'package:clipboard/widgets/clip_item/clip_menu_provider.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:flutter/material.dart';

class ClipCard extends StatelessWidget {
  final bool autoFocus;
  final bool canPaste;
  final ClipboardItem item;

  const ClipCard({
    super.key,
    required this.item,
    this.autoFocus = true,
    this.canPaste = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipMenuProvider(
      item: item,
      child: ClipCardBody(
        item: item,
        focused: autoFocus,
        canPaste: canPaste,
      ),
    );
  }
}
