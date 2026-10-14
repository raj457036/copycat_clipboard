import 'package:clipboard/base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/base/enums/clip_type.dart';
import 'package:clipboard/base/l10n/l10n.dart';
import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/widgets/can_paste_builder.dart';
import 'package:clipboard/widgets/clip_item/clip_transform_menu_items.dart';
import 'package:clipboard/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_io/io.dart';

class ClipMenuProvider extends StatefulWidget {
  final Widget child;
  final ClipboardItem item;
  const ClipMenuProvider({super.key, required this.item, required this.child});

  @override
  State<ClipMenuProvider> createState() => _ClipMenuProviderState();
}

class _ClipMenuProviderState extends State<ClipMenuProvider> {
  late ClipboardItem _resolvedItem;
  bool _resolving = false;
  List<MenuItem> _menuItems = const [];

  @override
  void initState() {
    super.initState();
    _resolvedItem = widget.item;
  }

  @override
  void didUpdateWidget(covariant ClipMenuProvider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.item != widget.item) {
      _resolvedItem = widget.item;
    }
  }

  Future<void> _ensureResolvedItem() async {
    if (_resolving) return;
    if (!_resolvedItem.previewOnly || _resolvedItem.id == null) return;

    _resolving = true;
    final targetId = _resolvedItem.id!;
    final full = await context.read<OfflinePersistenceCubit>().getItem(
      id: targetId,
    );
    _resolving = false;

    if (!mounted || full == null) return;
    if (_resolvedItem.id != targetId) return;

    setState(() {
      _resolvedItem = full;
    });
  }

  bool _isTextFile(ClipboardItem item) {
    if (item.type != ClipItemType.file) return false;
    return item.fileMimeType?.toLowerCase().startsWith('text/') ?? false;
  }

  Future<void> _copyOrPasteFileText(
    BuildContext context,
    ClipboardItem item,
    bool canPaste,
  ) async {
    final text = await _getFileText(item);
    if (text == null || text.trim().isEmpty) return;

    final tempItem = ClipboardItem.fromText(text);

    if (!context.mounted) return;
    if (canPaste) {
      await pasteOnLastWindow(context, tempItem);
    } else {
      await copyToClipboard(context, tempItem);
    }
  }

  Future<String?> _getFileText(ClipboardItem item) async {
    if (item.localPath != null) {
      final file = File(item.localPath!);
      if (await file.exists()) {
        try {
          return await file.readAsString();
        } catch (_) {}
      }
    }
    return item.text;
  }

  List<MenuItem> _buildMenuItems(BuildContext context, ClipboardItem item) {
    final transformItems = buildSmartTransformMenuItems(context, item);
    final canPaste = CanPasteScope.of(context);
    final textActionLabel = canPaste
        ? context.locale.app__paste_content
        : context.locale.app__copy_content;
    return [
      MenuItem(
        icon: Icons.check_circle_outline_rounded,
        text: context.locale.app__select,
        section: context.locale.app__clip_actions,
        onPressed: () => selectClip(context, item),
      ),
      if (!item.inCache && !item.encrypted)
        MenuItem(
          icon: Icons.download_for_offline_outlined,
          text: context.locale.app__download,
          section: context.locale.app__clip_actions,
          onPressed: () => downloadFile(context, item),
        ),
      if (item.inCache && !item.encrypted)
        MenuItem(
          icon: Icons.copy,
          text: context.mlocale.copyButtonLabel.title,
          section: context.locale.app__clip_actions,
          onPressed: () => copyToClipboard(context, item),
        ),
      if (_isTextFile(item) && item.inCache && !item.encrypted)
        MenuItem(
          icon: Icons.text_snippet_outlined,
          text: textActionLabel,
          section: context.locale.app__clip_actions,
          onPressed: () => _copyOrPasteFileText(context, item, canPaste),
        ),
      if (item.inCache && !item.encrypted)
        MenuItem(
          icon: Icons.ios_share,
          text: context.locale.app__share,
          section: context.locale.app__clip_actions,
          onPressed: () => shareClipboardItem(context, item),
        ),
      if (!item.encrypted)
        MenuItem(
          icon: Icons.edit_note_rounded,
          text: context.locale.app__preview,
          section: context.locale.app__clip_actions,
          onPressed: () => openClipPreview(context, item),
        ),
      if (item.type == ClipItemType.url && !item.encrypted)
        MenuItem(
          icon: Icons.open_in_new,
          text: context.locale.app__follow_link,
          onPressed: () => launchUrl(item),
        ),
      if ((item.type == ClipItemType.file || item.type == ClipItemType.media) &&
          item.inCache &&
          !item.encrypted)
        MenuItem(
          icon: Icons.save_alt_rounded,
          text: context.locale.app__export,
          section: context.locale.app__clip_actions,
          onPressed: () => copyToClipboard(context, item, saveFile: true),
        ),
      if ((item.type == ClipItemType.file || item.type == ClipItemType.media) &&
          item.inCache &&
          !item.encrypted)
        MenuItem(
          icon: Icons.open_in_new,
          text: context.locale.app__open_file,
          section: context.locale.app__clip_actions,
          onPressed: () => openFile(item),
        ),
      MenuItem(
        icon: Icons.collections_bookmark_outlined,
        text: context.locale.app__change_collection,
        section: context.locale.app__clip_actions,
        onPressed: () => changeCollection(context, [item]),
      ),
      if (!item.encrypted)
        MenuItem(
          icon: Icons.delete_outline,
          text: context.locale.app__delete,
          section: context.locale.app__clip_actions,
          onPressed: () => deleteClipboardItem(context, [item]),
        ),
      if (!item.encrypted) ...transformItems,
    ];
  }

  Future<void> _prepareMenuItems() async {
    await _ensureResolvedItem();
    if (!mounted) return;

    final menuItems = _buildMenuItems(context, _resolvedItem);
    setState(() {
      _menuItems = menuItems;
    });
  }

  void _clearMenuItems() {
    if (!mounted) return;
    if (_menuItems.isEmpty) return;
    setState(() {
      _menuItems = const [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Menu(
      onBeforeOpen: _prepareMenuItems,
      onAfterClose: _clearMenuItems,
      items: _menuItems,
      child: widget.child,
    );
  }
}
