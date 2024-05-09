import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:flutter/material.dart';

class PreviewOptions extends StatelessWidget {
  final ClipboardItem item;
  final MainAxisAlignment? alignment;
  const PreviewOptions({
    super.key,
    required this.item,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    final canOpen =
        (item.type == ClipItemType.file || item.type == ClipItemType.media) &&
            item.inCache;
    return Card(
      child: ButtonBar(
        alignment: alignment,
        children: [
          if (item.needDownload)
            IconButton.outlined(
              onPressed: item.downloading
                  ? null
                  : () {
                      downloadFile(context, item);
                      Navigator.pop(context);
                    },
              tooltip:
                  item.downloading ? "Downloading" : "Download for offline",
              icon: const Icon(Icons.download_for_offline_outlined),
            ),
          if (item.inCache)
            IconButton.outlined(
              onPressed: () => copyToClipboard(context, item),
              tooltip: "Copy to clipboard",
              icon: const Icon(Icons.copy),
            ),
          if (item.inCache)
            IconButton.outlined(
              icon: const Icon(Icons.ios_share),
              tooltip: 'Share',
              onPressed: () => shareClipboardItem(context, item),
            ),
          if (item.type == ClipItemType.url)
            IconButton.outlined(
              icon: const Icon(Icons.open_in_new),
              tooltip: 'Open in browser',
              onPressed: () => launchUrl(item),
            ),
          if (canOpen)
            IconButton.outlined(
              icon: const Icon(Icons.open_in_new),
              tooltip: 'Open',
              onPressed: () => openFile(item),
            ),
          if (canOpen)
            IconButton.outlined(
              icon: const Icon(Icons.save_alt_rounded),
              tooltip: 'Export',
              onPressed: () => copyToClipboard(context, item, saveFile: true),
            ),
          IconButton.outlined(
            onPressed: () async {
              final done = await deleteItem(context, item);
              // ignore: use_build_context_synchronously
              if (done) Navigator.pop(context);
            },
            tooltip: "Delete",
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
    );
  }
}
