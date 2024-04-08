import 'dart:io';

import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/widgets/dialogs/confirm_dialog.dart';
import 'package:clipboard/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _borderRadius = BorderRadius.vertical(
  top: Radius.circular(12),
);

class TextPreview extends StatelessWidget {
  final ClipboardItem item;

  const TextPreview({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Material(
      // borderRadius: _borderRadius,
      color: colors.surfaceVariant,
      child: InkWell(
        // borderRadius: _borderRadius,
        onTap: () {},
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(padding8),
            child: Text(
              item.value!,
              overflow: TextOverflow.fade,
              maxLines: 10,
            ),
          ),
        ),
      ),
    );
  }
}

class ImagePreview extends StatelessWidget {
  final ClipboardItem item;

  const ImagePreview({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Material(
      borderRadius: _borderRadius,
      color: colors.surfaceVariant,
      child: InkWell(
        borderRadius: _borderRadius,
        onTap: () {},
        child: ClipRRect(
          borderRadius: _borderRadius,
          child: SizedBox.expand(
            child: Image(
              image: FileImage(File(item.localPath!)),
              gaplessPlayback: true,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class UrlPreview extends StatelessWidget {
  final ClipboardItem item;

  const UrlPreview({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Material(
      borderRadius: _borderRadius,
      color: colors.surfaceVariant,
      child: InkWell(
        borderRadius: _borderRadius,
        onTap: () {},
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(padding8),
            child: Text(
              item.value!,
              overflow: TextOverflow.fade,
              maxLines: 10,
            ),
          ),
        ),
      ),
    );
  }
}

class FilePreview extends StatelessWidget {
  final ClipboardItem item;

  const FilePreview({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Material(
      borderRadius: _borderRadius,
      color: colors.surfaceVariant,
      child: InkWell(
        borderRadius: _borderRadius,
        onTap: () {},
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(padding8),
            child: Text(
              item.title,
              overflow: TextOverflow.fade,
              maxLines: 10,
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _copyToClipboard(
  BuildContext context,
  ClipboardItem item,
) async {
  final result = await context.read<ClipboardCubit>().copyToClipboard(item);

  if (result) {
    // ignore: use_build_context_synchronously
    context.showTextSnackbar("👍 Copied to clipboard");
  } else {
    // ignore: use_build_context_synchronously
    context.showTextSnackbar("❌ Failed to copy to clipboard");
  }
}

class ClipOptions extends StatelessWidget {
  final ClipboardItem item;

  const ClipOptions({
    super.key,
    required this.item,
  });

  String getType() {
    switch (item.type) {
      case ClipItemType.text:
        return 'Text';
      case ClipItemType.image:
        return 'Image ( ${item.fileExtension} )';
      case ClipItemType.url:
        return 'URL';
      case ClipItemType.file:
        return 'File ( ${item.fileExtension} )';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(padding8),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  getType(),
                  style: context.textTheme.titleSmall,
                ),
                Text(
                  item.modified.ago(context.locale.localeName),
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.copy),
              tooltip: "Copy to clipboard",
              onPressed: () => _copyToClipboard(context, item),
            ),
          ],
        ),
      ),
    );
  }
}

class ClipCardFooter extends StatelessWidget {
  final ClipboardItem item;

  const ClipCardFooter({
    super.key,
    required this.item,
  });

  String getType() {
    switch (item.type) {
      case ClipItemType.text:
        return 'Text';
      case ClipItemType.image:
        return 'Image ( ${item.fileExtension} )';
      case ClipItemType.url:
        return 'URL';
      case ClipItemType.file:
        return 'File ( ${item.fileExtension} )';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(padding8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              getType(),
              style: context.textTheme.titleSmall,
            ),
            Text(
              item.modified.ago(context.locale.localeName),
              style: context.textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}

class ClipCard extends StatelessWidget {
  final ClipboardItem item;
  const ClipCard({
    super.key,
    required this.item,
  });

  Widget getPreview() {
    return switch (item.type) {
      ClipItemType.text => TextPreview(item: item),
      ClipItemType.image => ImagePreview(item: item),
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
    await context.read<ClipboardCubit>().deleteItem(item);
  }

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Column(
        children: [
          SizedBox.fromSize(
            size: const Size.fromHeight(56),
            child: ClipOptions(item: item),
          ),
          const Divider(height: 0),
          Expanded(
            child: Menu(
              items: [
                MenuItem(
                  icon: Icons.copy,
                  text: 'Copy to clipboard',
                  onPressed: () => _copyToClipboard(context, item),
                ),
                MenuItem(
                  icon: Icons.visibility_outlined,
                  text: 'Preview',
                  onPressed: () {},
                ),
                MenuItem(
                  icon: Icons.share_outlined,
                  text: 'Share',
                  onPressed: () {},
                ),
                MenuItem(
                  icon: Icons.link_outlined,
                  text: 'Get link',
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
          const Divider(height: 0),
          SizedBox.fromSize(
            size: const Size.fromHeight(35),
            child: ClipCardFooter(item: item),
          )
        ],
      ),
    );
  }
}
