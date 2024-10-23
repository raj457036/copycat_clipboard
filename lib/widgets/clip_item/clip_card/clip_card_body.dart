import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:clipboard/widgets/clip_item/clip_card/clip_card_options_header.dart';
import 'package:clipboard/widgets/clip_item/clip_preview.dart';
import 'package:clipboard/widgets/clip_item/clip_sync_status_footer.dart';
import 'package:clipboard/widgets/local_user.dart';
import 'package:clipboard/widgets/menu.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/bloc/selected_clips_cubit/selected_clips_cubit.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:copycat_pro/widgets/drag_drop/drag_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_io/io.dart';

class ClipCardBodyContent extends StatelessWidget {
  final ClipboardItem item;
  final bool canPaste;
  final bool hovered;
  final bool selected;
  final bool selectionActive;
  const ClipCardBodyContent({
    super.key,
    required this.item,
    required this.canPaste,
    required this.selectionActive,
    this.hovered = false,
    this.selected = false,
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
          hovered: hovered,
          selected: selected,
          selectionActive: selectionActive,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (item.displayTitle != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: padding8,
                    vertical: padding2,
                  ),
                  child: Text(
                    item.displayTitle!,
                    style: textTheme.labelLarge,
                    maxLines: 2,
                  ),
                ),
              Expanded(
                child: ClipPreview(item: item, layout: AppLayout.grid),
              ),
            ],
          ),
        ),
        if (!selected)
          DisableForLocalUser(
            child: ClipSyncStatusFooter(item: item),
          ),
      ],
    );

    // NOTE: drag and drop doesn't work in android for now
    if (!Platform.isAndroid && !selected) {
      return DraggableItem(item: item, child: child);
    }
    return child;
  }
}

class ClipCardBody extends StatefulWidget {
  final ClipboardItem item;
  final bool focused;
  final bool canPaste;
  final bool selected;
  final bool selectionActive;
  const ClipCardBody({
    super.key,
    required this.item,
    required this.focused,
    required this.canPaste,
    required this.selected,
    required this.selectionActive,
  });

  @override
  State<ClipCardBody> createState() => _ClipCardBodyState();
}

class _ClipCardBodyState extends State<ClipCardBody> {
  bool focused = false;
  bool hovered = false;

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
    persitCubit.persist([item_]);
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

  void focus() => !focused ? setState(() => focused = true) : null;
  void unfocus() => focused ? setState(() => focused = false) : null;

  void onFocusChange(bool value) {
    if (value) {
      Scrollable.ensureVisible(
        context,
        alignment: 0.5,
        duration: Durations.medium1,
      );
      focus();
    } else {
      unfocus();
    }
  }

  void onHover(bool isHovered) {
    if (isHovered == hovered) return;
    setState(() {
      hovered = isHovered;
    });
  }

  void toggleSelect(BuildContext context) {
    final cubit = context.read<SelectedClipsCubit>();
    if (widget.selected) {
      cubit.unselect(widget.item);
      return;
    }
    cubit.select(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final selectedShape = focused || widget.selected
        ? RoundedRectangleBorder(
            side: BorderSide(
              color: colors.primary,
              width: 2.5,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
            borderRadius: radius12,
          )
        : null;

    final cardContent = ClipCardBodyContent(
      canPaste: widget.canPaste,
      item: widget.item,
      hovered: hovered,
      selected: widget.selected,
      selectionActive: widget.selectionActive,
    );

    return Card.outlined(
      margin: EdgeInsets.zero,
      elevation: focused ? 2 : 0,
      shape: selectedShape,
      child: InkWell(
        onHover: onHover,
        focusColor: colors.surface,
        onTap: !widget.selectionActive
            ? () => performPrimaryAction(context)
            : () => toggleSelect(context),
        // onLongPress: () => menu.openOptionDialog(context),
        onSecondaryTapDown: !widget.selectionActive
            ? (detail) async {
                final menu = Menu.of(context);
                if (isMobilePlatform) {
                  menu.openOptionDialog(context);
                  return;
                }
                final position = detail.globalPosition;
                menu.openPopupMenu(context, position);
              }
            : null,
        onFocusChange: onFocusChange,
        autofocus: widget.focused,
        borderRadius: radius12,
        child: cardContent,
      ),
    );
  }
}
