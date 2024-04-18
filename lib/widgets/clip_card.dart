import 'package:clipboard/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/widgets/clip_cards/clip_card_options_header.dart';
import 'package:clipboard/widgets/clip_cards/clip_card_sync_status_footer.dart';
import 'package:clipboard/widgets/clip_cards/file_clip_card.dart';
import 'package:clipboard/widgets/clip_cards/media_clip_card.dart';
import 'package:clipboard/widgets/clip_cards/text_clip_card.dart';
import 'package:clipboard/widgets/clip_cards/url_clip_card.dart';
import 'package:clipboard/widgets/dialogs/confirm_dialog.dart';
import 'package:clipboard/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ClipCard extends StatelessWidget {
  final ClipboardItem item;
  const ClipCard({
    super.key,
    required this.item,
  });

  Widget getPreview() {
    return switch (item.type) {
      ClipItemType.text => TextPreview(item: item),
      ClipItemType.media => MediaPreview(item: item),
      ClipItemType.url => UrlPreview(item: item),
      ClipItemType.file => FilePreview(item: item),
    };
  }

  Future<void> deleteItem(BuildContext context) async {
    final confirmation = await const ConfirmDialog(
            title: "Delete Item", message: "Are you sure to delete this item?")
        .open(context);

    if (!confirmation) return;

    // ignore: use_build_context_synchronously
    await context.read<CloudPersistanceCubit>().delete(item);
  }

  Future<void> launchUrl() async {
    if (item.url != null && Uri.tryParse(item.url!) != null) {
      await launchUrlString(item.url!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ClipCardOptionsHeader(item: item),
          Expanded(
            child: Menu(
              items: [
                MenuItem(
                  icon: Icons.copy,
                  text: 'Copy to clipboard',
                  onPressed: () => copyToClipboard(context, item),
                ),
                if (item.type == ClipItemType.url)
                  MenuItem(
                    icon: Icons.open_in_new,
                    text: 'Open in browser',
                    onPressed: launchUrl,
                  ),
                if (item.type == ClipItemType.file ||
                    item.type == ClipItemType.media && item.inCache)
                  MenuItem(
                    icon: Icons.save_as_outlined,
                    text: 'Save to files',
                    onPressed: () {},
                  ),
                const MenuItem(type: MenuItemType.divider),
                MenuItem(
                  icon: Icons.delete_outline,
                  text: 'Delete',
                  onPressed: () => deleteItem(context),
                ),
              ],
              child: getPreview(),
            ),
          ),
          ClipCardSyncStatusFooter(item: item),
        ],
      ),
    );
  }
}
