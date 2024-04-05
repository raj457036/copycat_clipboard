import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/widgets/dialogs/confirm_dialog.dart';
import 'package:clipboard/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextPreview extends StatelessWidget {
  final ClipboardItem item;

  const TextPreview({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(12),
        ),
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
    return Material(
      color: Colors.white,
      child: InkWell(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(12),
        ),
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

class ClipOptions extends StatelessWidget {
  final ClipboardItem item;

  const ClipOptions({
    super.key,
    required this.item,
  });

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
                  item.type.name.toUpperCase(),
                  style: context.textTheme.titleSmall,
                ),
                Text(
                  item.modified.ago,
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
            const Spacer(),
            // IconButton(
            //   icon: const Icon(Icons.arrow_outward_rounded),
            //   tooltip: "Open link",
            //   onPressed: () {},
            // ),
            // IconButton(
            //   icon: const Icon(Icons.download_rounded),
            //   tooltip: "Download",
            //   onPressed: () {},
            // ),
            IconButton(
              icon: const Icon(Icons.copy),
              tooltip: "Copy to clipboard",
              onPressed: () async {
                context
                  ..read<ClipboardCubit>().copyToClipboard(item)
                  ..showTextSnackbar("Copied to clipboard");
              },
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
      _ => const Placeholder(),
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
          Expanded(
            child: Menu(
              items: [
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
            size: const Size.fromHeight(56),
            child: ClipOptions(item: item),
          )
        ],
      ),
    );
  }
}
