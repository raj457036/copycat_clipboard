import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/menu.dart';
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

    if (isMobilePlatform) {
      return IconButton(
        onPressed: () {
          final menu = Menu.of(context);
          menu.openOptionDialog(context);
        },
        icon: const Icon(Icons.more_vert_rounded),
        style: IconButton.styleFrom(
            shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
          ),
        )),
      );
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
