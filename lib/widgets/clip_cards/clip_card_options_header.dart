import 'package:clipboard/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/datetime_extension.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> copyToClipboard(
  BuildContext context,
  ClipboardItem item, {
  bool saveFile = false,
}) async {
  try {
    final result =
        await context.read<OfflinePersistanceCubit>().copyToClipboard(
              item,
              saveFile: saveFile,
            );
    if (result) {
      showTextSnackbar("Copied");
    } else {
      showTextSnackbar(
        "⚠️ Copy failed or cancelled",
      );
    }
  } catch (e) {
    showTextSnackbar("⭕️ Failed to copy. Something went wrong!");
  }
}

Future<void> shareClipboardItem(
    BuildContext context, ClipboardItem item) async {
  context
      .read<OfflinePersistanceCubit>()
      .shareClipboardItem(item)
      .then((value) {
    showTextSnackbar(
      "📝 Successfully shared",
    );
  }).catchError((_) {
    showTextSnackbar("❌ Failed to share");
  });
}

Future<void> downloadFile(
  BuildContext context,
  ClipboardItem item,
) async {
  context.read<CloudPersistanceCubit>().download(item);
}

class ClipCardOptionsHeader extends StatelessWidget {
  final ClipboardItem item;

  const ClipCardOptionsHeader({
    super.key,
    required this.item,
  });

  Widget getType() {
    switch (item.type) {
      case ClipItemType.text:
        return const Icon(Icons.abc_outlined, size: 20);
      case ClipItemType.media:
        return const Icon(Icons.image_outlined, size: 20);
      case ClipItemType.url:
        return const Icon(Icons.http_rounded, size: 20);
      case ClipItemType.file:
        return const Icon(Icons.description, size: 20);
    }
  }

  Future<void> launchUrl() async {
    if (item.url != null && Uri.tryParse(item.url!) != null) {
      await launchUrlString(item.url!);
    }
  }

  String getTitle() {
    if (item.title != null) return item.title!;
    switch (item.type) {
      case ClipItemType.text:
        switch (item.textCategory) {
          case TextCategory.color:
            return "Color";
          case TextCategory.email:
            return "Email";
          case TextCategory.phone:
            return "Phone";
          default:
            return "Text";
        }
      case ClipItemType.media:
        return "Media";
      case ClipItemType.url:
        return "URL";
      case ClipItemType.file:
        return "File";
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    final created = item.created.isToday()
        ? item.created.ago(context.locale.localeName)
        : dateFormatter.format(item.created.toLocal());
    return SizedBox.fromSize(
      size: const Size.fromHeight(42),
      child: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Row(
          children: [
            width8,
            Expanded(
              child: Text(
                created,
                style: textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: colors.outline,
                ),
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
            ),
            width8,
            if (width > 100 && item.type == ClipItemType.url)
              IconButton(
                onPressed: launchUrl,
                icon: const Icon(
                  Icons.open_in_new,
                ),
                tooltip: "Open in browser",
                style: IconButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                ),
              ),
            if (item.needDownload)
              IconButton(
                icon: item.downloading
                    ? SizedBox.square(
                        dimension: 20,
                        child: CircularProgressIndicator(
                          value: item.downloadProgress,
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(Icons.download_for_offline_outlined),
                onPressed:
                    item.downloading ? null : () => downloadFile(context, item),
                tooltip:
                    item.downloading ? "Downloading" : "Download for offline",
                style: IconButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                    ),
                  ),
                ),
              )
            else
              IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () => copyToClipboard(context, item),
                tooltip: "Copy",
                style: IconButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                    ),
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}
