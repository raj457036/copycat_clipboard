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
import 'package:url_launcher/url_launcher_string.dart';

const _borderRadius = BorderRadius.vertical(
  bottom: Radius.circular(12),
);

class TextPreview extends StatelessWidget {
  final ClipboardItem item;

  const TextPreview({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Material(
      color: colors.surfaceVariant,
      borderRadius: item.isSynced ? _borderRadius : null,
      child: InkWell(
        borderRadius: item.isSynced ? _borderRadius : null,
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
    // context.read<GdriveSyncCubit>().uploadFile(item);
    return Material(
      color: colors.surfaceVariant,
      borderRadius: item.isSynced ? _borderRadius : null,
      child: InkWell(
        borderRadius: item.isSynced ? _borderRadius : null,
        onTap: () {},
        child: ClipRRect(
          borderRadius: item.isSynced ? _borderRadius : BorderRadius.zero,
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
      color: colors.surfaceVariant,
      borderRadius: item.isSynced ? _borderRadius : null,
      child: InkWell(
        borderRadius: item.isSynced ? _borderRadius : null,
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
      color: colors.surfaceVariant,
      borderRadius: item.isSynced ? _borderRadius : null,
      child: InkWell(
        borderRadius: item.isSynced ? _borderRadius : null,
        onTap: () {},
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(padding8),
            child: Text(
              item.value ?? item.title,
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
  ClipboardItem item, {
  bool copyFileContent = false,
}) async {
  final result = await context
      .read<ClipboardCubit>()
      .copyToClipboard(item, copyFileContent);

  if (result) {
    // ignore: use_build_context_synchronously
    context.showTextSnackbar("📝 Copied to clipboard");
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

  Future<void> launchUrl() async {
    if (item.value != null && Uri.tryParse(item.value!) != null) {
      await launchUrlString(item.value!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = context.breakpoints.isMobile;
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
                  style: context.textTheme.labelMedium,
                ),
              ],
            ),
            const Spacer(),
            if (!isMobile && item.type == ClipItemType.url)
              IconButton(
                onPressed: launchUrl,
                icon: const Icon(
                  Icons.open_in_new,
                ),
                tooltip: "Open in browser",
              ),
            if (item.fileExtension == ".txt")
              MenuAnchor(
                menuChildren: [
                  MenuItemButton(
                    leadingIcon: const Icon(Icons.copy_all_rounded),
                    child: const Text("Copy text file"),
                    onPressed: () => _copyToClipboard(context, item),
                  ),
                  MenuItemButton(
                    leadingIcon: const Icon(Icons.text_snippet_rounded),
                    child: const Text("Copy text content"),
                    onPressed: () =>
                        _copyToClipboard(context, item, copyFileContent: true),
                  ),
                ],
                child: const Icon(Icons.copy),
                builder: (BuildContext context, MenuController controller,
                    Widget? child) {
                  return IconButton(
                    onPressed: () {
                      if (controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                    },
                    icon: const Icon(Icons.copy),
                  );
                },
              )
            else
              IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () => _copyToClipboard(context, item),
                tooltip: "Copy to clipboard",
              ),
          ],
        ),
      ),
    );
  }
}

class ClipSyncStatus extends StatelessWidget {
  final ClipboardItem item;

  const ClipSyncStatus({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    if (item.lastSynced != null) {
      return const SizedBox.shrink();
    }
    final colors = context.colors;
    return SizedBox.fromSize(
      size: const Size.fromHeight(35),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.errorContainer,
          borderRadius: _borderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.all(padding8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.sync_problem_rounded,
                size: 18,
              ),
              width6,
              Text(
                "Local",
                style: context.textTheme.labelMedium,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Sync Now",
                  style: context.textTheme.labelMedium
                      ?.copyWith(color: colors.error),
                ),
              ),
            ],
          ),
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

  Future<void> launchUrl() async {
    if (item.value != null && Uri.tryParse(item.value!) != null) {
      await launchUrlString(item.value!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                if (item.type == ClipItemType.url)
                  MenuItem(
                    icon: Icons.open_in_new,
                    text: 'Open in browser',
                    onPressed: launchUrl,
                  ),
                if (item.type == ClipItemType.file ||
                    item.type == ClipItemType.image)
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
          if (item.lastSynced == null) const Divider(height: 0),
          ClipSyncStatus(item: item),
        ],
      ),
    );
  }
}
