import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/clip_cards/clip_card_options_header.dart';
import 'package:clipboard/widgets/clip_cards/clip_card_sync_status_footer.dart';
import 'package:clipboard/widgets/clip_cards/encrypted_card.dart';
import 'package:clipboard/widgets/clip_cards/text_clip_card.dart';
import 'package:clipboard/widgets/clip_cards/url_clip_card.dart';
import 'package:clipboard/widgets/local_user.dart';
import 'package:clipboard/widgets/menu.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
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
import 'package:copycat_pro/widgets/drag_drop/drag_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_io/io.dart';

class ClipCardPreview extends StatelessWidget {
  final ClipboardItem item;
  const ClipCardPreview({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    if (item.encrypted) return const EncryptedClipItem();
    return switch (item.type) {
      ClipItemType.text => TextClipCard(item: item),
      ClipItemType.media => MediaClipCard(item: item),
      ClipItemType.url => UrlClipCard(item: item),
      ClipItemType.file => FileClipCard(item: item),
    };
  }
}

class ClipCardBodyContent extends StatelessWidget {
  final ClipboardItem item;
  final bool canPaste;
  const ClipCardBodyContent({
    super.key,
    required this.item,
    required this.canPaste,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final child = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipCardOptionsHeader(
          item: item,
          hasFocusForPaste: canPaste,
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
                child: Card.filled(
                  color: Colors.transparent,
                  margin: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: ClipCardPreview(item: item),
                ),
              ),
            ],
          ),
        ),
        DisableForLocalUser(
          child: ClipCardSyncStatusFooter(item: item),
        ),
      ],
    );

    // NOTE: drag and drop doesn't work in android for now
    if (!Platform.isAndroid) return DraggableItem(item: item, child: child);
    return child;
  }
}

class ClipCardBody extends StatefulWidget {
  final ClipboardItem item;
  final bool focused;
  final bool canPaste;
  const ClipCardBody({
    super.key,
    required this.item,
    required this.focused,
    required this.canPaste,
  });

  @override
  State<ClipCardBody> createState() => _ClipCardBodyState();
}

class _ClipCardBodyState extends State<ClipCardBody> {
  bool selected = false;

  @override
  void dispose() {
    super.dispose();
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

    final item_ = await widget.item.decrypt();
    persitCubit.persist(item_);
  }

  Future<void> performPrimaryAction(BuildContext context) async {
    if (widget.item.encrypted) {
      decryptItem(context);
    } else if (widget.item.needDownload) {
      downloadFile(context, widget.item);
    } else if (widget.canPaste) {
      pasteOnLastWindow(context, widget.item);
    } else {
      copyToClipboard(context, widget.item);
    }
  }

  void select() => !selected ? setState(() => selected = true) : null;
  void unselect() => selected ? setState(() => selected = false) : null;

  void onFocusChange(bool value) {
    if (value) {
      Scrollable.ensureVisible(
        context,
        alignment: 0.5,
        duration: Durations.medium1,
      );
      select();
      // final cubit = context.read<FocusedClipitemCubit>();
      // cubit.focused(item);
    } else {
      unselect();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final menu = Menu.of(context);

    final selectedShape = selected
        ? RoundedRectangleBorder(
            side: BorderSide(
              color: colors.primary,
              width: 2,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
            borderRadius: radius12,
          )
        : null;

    return Card.outlined(
      margin: EdgeInsets.zero,
      elevation: selected ? 2 : 0,
      shape: selectedShape,
      child: InkWell(
        focusColor: colors.surface,
        onTap: () => performPrimaryAction(context),
        onLongPress:
            Platform.isAndroid ? () => menu.openOptionDialog(context) : null,
        onSecondaryTapDown: (detail) async {
          if (isMobilePlatform) {
            menu.openOptionDialog(context);
            return;
          }
          final position = detail.globalPosition;
          menu.openPopupMenu(context, position);
        },
        onFocusChange: onFocusChange,
        autofocus: widget.focused,
        borderRadius: radius12,
        child: ClipCardBodyContent(
          canPaste: widget.canPaste,
          item: widget.item,
        ),
      ),
    );
  }
}
