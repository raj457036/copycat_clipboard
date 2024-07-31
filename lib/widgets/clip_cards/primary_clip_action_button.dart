import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/clipboard_actions.dart';
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
    if (hasFocusForPaste) {
      return Padding(
        padding: const EdgeInsets.all(padding8),
        child: Icon(
          Icons.paste,
          color: colors.outline,
        ),
      );
    }
    return IconButton(
      icon: const Icon(Icons.copy),
      onPressed: () => copyToClipboard(context, item),
      tooltip: context.locale.copy,
      style: IconButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
