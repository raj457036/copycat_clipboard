import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SecondaryClipActionButton extends StatelessWidget {
  final bool hasFocusForPaste;
  final ClipboardItem item;
  final AppLayout layout;
  const SecondaryClipActionButton({
    super.key,
    required this.item,
    required this.hasFocusForPaste,
    this.layout = AppLayout.grid,
  });

  @override
  Widget build(BuildContext context) {
    const iconSize = 24.0;
    final action = switch (item.type) {
      ClipItemType.url => IconButton(
          onPressed: () => launchUrl(item),
          icon: const Icon(Icons.outbound_rounded),
          iconSize: iconSize,
          tooltip: context.locale.openInBrowser,
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
        ),
      ClipItemType.file || ClipItemType.media => item.inCache
          ? IconButton(
              onPressed: () => openFile(item),
              icon: const Icon(Icons.outbound_rounded),
              iconSize: iconSize,
              tooltip: context.locale.open,
              style: IconButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
            )
          : null,
      ClipItemType.text => switch (item.textCategory) {
          TextCategory.phone => IconButton(
              onPressed: () => launchPhone(item, message: true),
              icon: const Icon(Icons.outbound_rounded),
              iconSize: iconSize,
              tooltip: context.locale.open,
              style: IconButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
            ),
          TextCategory.email => IconButton(
              onPressed: () => launchEmail(item),
              icon: const Icon(Icons.outbound_rounded),
              iconSize: iconSize,
              tooltip: context.locale.email,
              style: IconButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
            ),
          _ => const SizedBox.shrink()
        },
    };

    if (action == null) return const SizedBox.shrink();
    return SizedBox.square(
      dimension: iconSize * 1.44,
      child: Focus(
        canRequestFocus: false,
        skipTraversal: true,
        descendantsAreFocusable: false,
        child: action,
      ),
    );
  }
}
