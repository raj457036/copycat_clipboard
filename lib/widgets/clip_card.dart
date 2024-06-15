import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:clipboard/widgets/clip_cards/clip_card_options_header.dart';
import 'package:clipboard/widgets/clip_cards/clip_card_sync_status_footer.dart';
import 'package:clipboard/widgets/clip_cards/encrypted_card.dart';
import 'package:clipboard/widgets/clip_cards/file_clip_card.dart';
import 'package:clipboard/widgets/clip_cards/media_clip_card.dart';
import 'package:clipboard/widgets/clip_cards/text_clip_card.dart';
import 'package:clipboard/widgets/clip_cards/url_clip_card.dart';
import 'package:clipboard/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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

  Future<void> preview(BuildContext context) async {
    context.pushNamed(
      RouteConstants.preview,
      pathParameters: {
        "id": item.id.toString(),
      },
    );
  }

  Future<void> downloadFile(
    BuildContext context,
  ) async {
    context.read<CloudPersistanceCubit>().download(item);
  }

  Future<void> decryptItem(BuildContext context) async {
    final persitCubit = context.read<OfflinePersistanceCubit>();
    final appConfig = context.read<AppConfigCubit>();
    if (!appConfig.isE2EESetupDone) {
      showFailureSnackbar(
        const Failure(
          message: "E2EE not setup yet.",
          code: "e2ee-no-setup",
        ),
      );
      return;
    }

    final item_ = await item.decrypt();
    persitCubit.persist(item_);
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
          text: context.locale.previewEdit,
          onPressed: () => preview(context),
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
        if (deleteAllowed) const MenuItem(type: MenuItemType.divider),
        if (deleteAllowed)
          MenuItem(
            icon: Icons.delete_outline,
            text: context.locale.delete,
            onPressed: () => deleteItem(context, item),
          ),
        ...customMenuItems,
      ],
      child: Card.outlined(
        elevation: .5,
        margin: EdgeInsets.zero,
        child: InkWell(
          borderRadius: radius12,
          onTap: item.encrypted
              ? () => decryptItem(context)
              : () => preview(context),
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
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: radius8,
                        ),
                        child: item.encrypted
                            ? const EncryptedClipItem()
                            : getPreview(),
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
