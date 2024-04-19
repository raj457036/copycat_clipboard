import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/datetime_extension.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> copyToClipboard(
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
    showTextSnackbar("📝 Copied to clipboard");
  }).catchError((_) {
    showTextSnackbar("❌ Failed to copy to clipboard");
  });
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
    final textTheme = context.textTheme;
    return SizedBox.fromSize(
      size: const Size.fromHeight(44),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: padding6,
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          final width = constraints.maxWidth;
          return Row(
            children: [
              CircleAvatar(
                maxRadius: 16,
                child: getType(),
              ),
              width8,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getTitle(),
                      style: textTheme.titleSmall,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                    Text(
                      dateTimeFormatter.format(item.created.toLocal()),
                      style: textTheme.labelSmall,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    )
                  ],
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
                ),
              if (width > 100 && !item.needDownload)
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () => copyToClipboard(context, item),
                  tooltip: "Copy to clipboard",
                ),
            ],
          );
        }),
      ),
    );
  }
}
