import 'dart:io';
import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:clipboard/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:clipboard/widgets/dialogs/confirm_dialog.dart';
import 'package:clipboard/widgets/menu.dart';
import 'package:clipboard/widgets/syncing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/image.dart' as img;
import 'package:url_launcher/url_launcher_string.dart';

Future<void> _copyToClipboard(
  BuildContext context,
  ClipboardItem item, {
  bool copyFileContent = false,
}) async {
  context
      .read<OfflinePersistanceCubit>()
      .copyToClipboard(
        item,
        fileContent: copyFileContent,
      )
      .then((value) {
    showToastMessage(context, "📝 Copied to clipboard");
  }).catchError((_) {
    showToastMessage(context, "❌ Failed to copy to clipboard");
  });
}

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
              item.text!,
              overflow: TextOverflow.fade,
              maxLines: 10,
            ),
          ),
        ),
      ),
    );
  }
}

class MediaPreview extends StatelessWidget {
  final ClipboardItem item;

  const MediaPreview({super.key, required this.item});

  ImageProvider getPreview() {
    if (item.localPath != null) {
      return FileImage(File(item.localPath!));
    }
    final image_ = BlurHash.decode(item.imgBlurHash!).toImage(35, 20);
    final bin = Uint8List.fromList(img.encodeJpg(image_));
    return MemoryImage(bin);
  }

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
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: getPreview(),
                  fit: BoxFit.contain,
                ),
              ),
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
              item.url!,
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
            child: item.fileName != null
                ? Text(
                    item.fileName!,
                    overflow: TextOverflow.fade,
                    maxLines: 10,
                  )
                : const Icon(Icons.folder_open),
          ),
        ),
      ),
    );
  }
}

class ClipOptions extends StatelessWidget {
  final ClipboardItem item;

  const ClipOptions({
    super.key,
    required this.item,
  });

  Widget getType() {
    switch (item.type) {
      case ClipItemType.text:
        return const Icon(Icons.abc_outlined);
      case ClipItemType.media:
        return const Icon(Icons.image_outlined);
      case ClipItemType.url:
        return const Icon(Icons.http_rounded);
      case ClipItemType.file:
        return const Icon(Icons.description);
    }
  }

  Future<void> launchUrl() async {
    if (item.url != null && Uri.tryParse(item.url!) != null) {
      await launchUrlString(item.url!);
    }
  }

  Future<void> _download(BuildContext context) async {
    context.read<CloudPersistanceCubit>().download(item);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(48),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: padding6,
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          final width = constraints.maxWidth;
          return Row(
            children: [
              getType(),
              Text("${item.id}"),
              const Spacer(),
              if (width > 100 && item.type == ClipItemType.url)
                IconButton(
                  onPressed: launchUrl,
                  icon: const Icon(
                    Icons.open_in_new,
                  ),
                  tooltip: "Open in browser",
                ),
              if (item.needDownload)
                IconButton(
                  icon: item.isSyncing
                      ? const AnimatedSyncingIcon()
                      : const Icon(Icons.download_for_offline_outlined),
                  onPressed: item.isSyncing ? null : () => _download(context),
                  tooltip: "Download needed",
                ),
              if (width > 100)
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () => _copyToClipboard(context, item),
                  tooltip: "Copy to clipboard",
                ),
            ],
          );
        }),
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
          color: Colors.amber.shade300,
          borderRadius: _borderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.all(padding8),
          child: LayoutBuilder(builder: (context, constraints) {
            final width = constraints.maxWidth;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.sync_problem_rounded,
                  size: 18,
                ),
                width6,
                if (width > 150)
                  Text(
                    "Local",
                    style: context.textTheme.labelMedium,
                  ),
                const Spacer(),
                TextButton(
                  onPressed: item.isSyncing
                      ? null
                      : () {
                          context.read<CloudPersistanceCubit>().persist(item);
                        },
                  child: Text(
                    item.isSyncing ? "Syncing" : "Sync Now",
                    style: context.textTheme.labelMedium
                        ?.copyWith(color: colors.error),
                  ),
                ),
              ],
            );
          }),
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
    await context.read<ClipboardCubit>().deleteItem(item);
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
          ClipOptions(item: item),
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
          if (item.lastSynced == null) const Divider(height: 0),
          ClipSyncStatus(item: item),
        ],
      ),
    );
  }
}
