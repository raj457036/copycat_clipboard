import 'package:clipboard/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/snackbar.dart';
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
import 'package:go_router/go_router.dart';
import 'package:open_filex/open_filex.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ClipCard extends StatelessWidget {
  final ClipboardItem item;
  final bool deleteAllowed;
  final List<MenuItem> customMenuItems;
  const ClipCard({
    super.key,
    required this.item,
    this.deleteAllowed = true,
    this.customMenuItems = const [],
  });

  Widget getPreview() {
    return switch (item.type) {
      ClipItemType.text => TextClipCard(item: item),
      ClipItemType.media => MediaClipCard(item: item),
      ClipItemType.url => UrlClipCard(item: item),
      ClipItemType.file => FileClipCard(item: item),
    };
  }

  Future<void> deleteItem(BuildContext context) async {
    final confirmation = await const ConfirmDialog(
      title: "Delete Item",
      message: "Are you sure to delete this item?",
    ).open(context);

    if (!confirmation) return;

    // ignore: use_build_context_synchronously
    await context.read<CloudPersistanceCubit>().delete(item);
  }

  Future<void> launchUrl() async {
    if (item.url != null && Uri.tryParse(item.url!) != null) {
      await launchUrlString(item.url!);
    }
  }

  Future<void> preview(BuildContext context) async {
    context.pushNamed(
      RouteConstants.preview,
      pathParameters: {
        "id": item.id.toString(),
      },
    );
  }

  Future<void> openFile() async {
    if (item.localPath != null) {
      final result = await OpenFilex.open(item.localPath!);

      switch (result.type) {
        case ResultType.error:
        case ResultType.noAppToOpen:
          showTextSnackbar("No application knows how to open this file.");
          break;
        case ResultType.permissionDenied:
          showTextSnackbar("You don't have permission to open this file.");
          break;
        case _:
      }
    }
  }

  Future<void> downloadFile(
    BuildContext context,
  ) async {
    context.read<CloudPersistanceCubit>().download(item);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Menu(
      items: [
        if (!item.inCache)
          MenuItem(
            icon: Icons.download_for_offline_outlined,
            text: 'Download for offline',
            onPressed: () => downloadFile(context),
          ),
        if (item.inCache)
          MenuItem(
            icon: Icons.copy,
            text: 'Copy to clipboard',
            onPressed: () => copyToClipboard(context, item),
          ),
        if (item.inCache)
          MenuItem(
            icon: Icons.ios_share,
            text: 'Share',
            onPressed: () => shareClipboardItem(context, item),
          ),
        MenuItem(
          icon: Icons.edit_note_rounded,
          text: 'Preview & Edit',
          onPressed: () => preview(context),
        ),
        if (item.type == ClipItemType.url)
          MenuItem(
            icon: Icons.open_in_new,
            text: 'Open in browser',
            onPressed: launchUrl,
          ),
        if ((item.type == ClipItemType.file ||
                item.type == ClipItemType.media) &&
            item.inCache)
          MenuItem(
            icon: Icons.save_alt_rounded,
            text: 'Export',
            onPressed: () => copyToClipboard(context, item, saveFile: true),
          ),
        if ((item.type == ClipItemType.file ||
                item.type == ClipItemType.media) &&
            item.inCache)
          MenuItem(
            icon: Icons.open_in_new,
            text: "Open",
            onPressed: openFile,
          ),
        if (deleteAllowed) const MenuItem(type: MenuItemType.divider),
        if (deleteAllowed)
          MenuItem(
            icon: Icons.delete_outline,
            text: 'Delete',
            onPressed: () => deleteItem(context),
          ),
        ...customMenuItems,
      ],
      child: Card.outlined(
        margin: EdgeInsets.zero,
        child: InkWell(
          borderRadius: radius8,
          onTap: () => preview(context),
          child: Column(
            children: [
              ClipCardOptionsHeader(item: item),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (item.title != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: padding8,
                          vertical: padding2,
                        ),
                        child: Text(
                          item.title!,
                          style: textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    Expanded(
                      child: Card.filled(
                        shape: const RoundedRectangleBorder(
                          borderRadius: radius8,
                        ),
                        child: getPreview(),
                      ),
                    ),
                  ],
                ),
              ),
              ClipCardSyncStatusFooter(item: item),
            ],
          ),
        ),
      ),
    );
  }
}
