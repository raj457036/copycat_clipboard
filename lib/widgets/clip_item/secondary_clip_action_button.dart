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
    final isGrid = layout == AppLayout.grid;
    final iconSize = isGrid ? 24.0 : 18.0;
    final action = switch (item.type) {
      ClipItemType.url => IconButton(
          onPressed: () => launchUrl(item),
          icon: const Icon(Icons.open_in_new),
          iconSize: iconSize,
          tooltip: context.locale.openInBrowser,
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
        ),
      ClipItemType.text => switch (item.textCategory) {
          TextCategory.phone => IconButton(
              onPressed: () => launchPhone(item),
              icon: const Icon(Icons.call),
              iconSize: iconSize,
              tooltip: context.locale.makePhoneCall,
              style: IconButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
            ),
          _ => const SizedBox.shrink()
        },
      _ => null
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
