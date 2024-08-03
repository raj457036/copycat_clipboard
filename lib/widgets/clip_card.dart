import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:clipboard/widgets/clip_cards/clip_card_options_header.dart';
import 'package:clipboard/widgets/clip_cards/clip_card_sync_status_footer.dart';
import 'package:clipboard/widgets/clip_cards/encrypted_card.dart';
import 'package:clipboard/widgets/clip_cards/text_clip_card.dart';
import 'package:clipboard/widgets/clip_cards/url_clip_card.dart';
import 'package:clipboard/widgets/local_user.dart';
import 'package:clipboard/widgets/menu.dart';
import 'package:clipboard/widgets/window_focus_manager.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_base/widgets/clip_cards/file_clip_card.dart';
import 'package:copycat_base/widgets/clip_cards/media_clip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClipCard extends StatelessWidget {
  final bool autoFocus;
  final bool canPaste;
  final ClipboardItem item;
  final bool deleteAllowed;
  final List<MenuItem> customMenuItems;
  final void Function()? onFocus;
  const ClipCard({
    super.key,
    required this.item,
    this.onFocus,
    this.autoFocus = true,
    this.canPaste = false,
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

  Future<void> downloadFile(
    BuildContext context,
  ) async {
    await context.read<CloudPersistanceCubit>().download(item);
  }

  Future<void> decryptItem(BuildContext context) async {
    final persitCubit = context.read<OfflinePersistanceCubit>();
    final appConfig = context.read<AppConfigCubit>();
    if (!appConfig.isE2EESetupDone) {
      showFailureSnackbar(
        Failure(
          message: context.locale.e2eeNotSetup,
          code: "e2ee-no-setup",
        ),
      );
      return;
    }

    final item_ = await item.decrypt();
    persitCubit.persist(item_);
  }

  Future<void> pasteOnLastWindow(BuildContext context) async {
    final focusManager = WindowFocusManager.of(context);
    focusManager?.toggleAndPaste(item);
  }

  Future<void> performPrimaryAction(
    BuildContext context,
    bool hasFocusForPaste,
  ) async {
    if (item.encrypted) {
      decryptItem(context);
    } else if (item.needDownload) {
      downloadFile(context);
    } else if (hasFocusForPaste) {
      pasteOnLastWindow(context);
    } else {
      copyToClipboard(context, item);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Menu(
      items: [
        if (!item.inCache)
          MenuItem(
            icon: Icons.download_for_offline_outlined,
            text: context.locale.downloadForOffline,
            onPressed: () => downloadFile(context),
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
        if (deleteAllowed) const MenuItem(type: MenuItemType.divider),
        if (deleteAllowed)
          MenuItem(
            icon: Icons.delete_outline,
            text: context.locale.delete,
            onPressed: () => deleteItem(context, item),
          ),
        ...customMenuItems,
      ],
      child: BlocSelector<AppConfigCubit, AppConfigState, bool>(
        selector: (state) {
          return state.config.lastFocusedWindowId != null &&
              state.config.smartPaste;
        },
        builder: (context, hasFocusForPaste) {
          return Card.outlined(
            child: InkWell(
              onFocusChange: (value) {
                if (value) {
                  Scrollable.ensureVisible(
                    context,
                    alignment: 0.5,
                    duration: Durations.medium1,
                  );
                }
              },
              autofocus: hasFocusForPaste && autoFocus,
              borderRadius: radius12,
              onTap: () => performPrimaryAction(context, hasFocusForPaste),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipCardOptionsHeader(
                    item: item,
                    hasFocusForPaste: hasFocusForPaste,
                  ),
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
                          child: Card.outlined(
                            color: Colors.transparent,
                            margin: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: item.encrypted
                                ? const EncryptedClipItem()
                                : getPreview(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DisableForLocalUser(
                    child: ClipCardSyncStatusFooter(item: item),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
