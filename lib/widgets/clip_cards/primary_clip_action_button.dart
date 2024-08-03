import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class PrimaryClipActionButton extends StatelessWidget {
  final bool hasFocusForPaste;
  final ClipboardItem item;
  const PrimaryClipActionButton({
    super.key,
    this.hasFocusForPaste = false,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    if (item.encrypted) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(padding8),
      child: Icon(
        hasFocusForPaste ? Icons.paste : Icons.copy,
        color: colors.outline,
      ),
    );
  }
}
