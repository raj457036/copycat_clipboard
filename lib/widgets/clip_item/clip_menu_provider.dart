import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:clipboard/widgets/menu.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ClipMenuProvider extends StatelessWidget {
  final Widget child;
  final ClipboardItem item;
  const ClipMenuProvider({
    super.key,
    required this.item,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Menu(
      items: [
        MenuItem(
          icon: Icons.check_circle_outline_rounded,
          text: "Select",
          onPressed: () => selectClip(context, item),
        ),
        if (!item.inCache)
          MenuItem(
            icon: Icons.download_for_offline_outlined,
            text: context.locale.downloadForOffline,
            onPressed: () => downloadFile(context, item),
          ),
        if (item.inCache)
          MenuItem(
            icon: Icons.copy,
            text: context.locale.copyToClipboard,
            onPressed: () => copyToClipboard(context, item),
          ),
        if (item.inCache)
          MenuItem(
            icon: Icons.ios_share,
            text: context.locale.share,
            onPressed: () => shareClipboardItem(context, item),
          ),
        MenuItem(
          icon: Icons.edit_note_rounded,
          text: context.locale.previewEdit,
          onPressed: () => preview(context, item),
        ),
        if (item.type == ClipItemType.url)
          MenuItem(
            icon: Icons.open_in_new,
            text: context.locale.openInBrowser,
            onPressed: () => launchUrl(item),
          ),
        if ((item.type == ClipItemType.file ||
                item.type == ClipItemType.media) &&
            item.inCache)
          MenuItem(
            icon: Icons.save_alt_rounded,
            text: context.locale.export,
            onPressed: () => copyToClipboard(context, item, saveFile: true),
          ),
        if ((item.type == ClipItemType.file ||
                item.type == ClipItemType.media) &&
            item.inCache)
          MenuItem(
            icon: Icons.open_in_new,
            text: context.locale.open,
            onPressed: () => openFile(item),
          ),
        MenuItem(
          icon: Icons.collections_bookmark_outlined,
          text: context.locale.changeCollection,
          onPressed: () => changeCollection(context, [item]),
        ),
        const MenuItem(type: MenuItemType.divider),
        MenuItem(
          icon: Icons.delete_outline,
          text: context.locale.delete,
          onPressed: () => deleteClipboardItem(context, [item]),
        ),
      ],
      child: child,
    );
  }
}
