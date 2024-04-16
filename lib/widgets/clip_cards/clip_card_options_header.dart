import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/enums/clip_type.dart';
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
              CircleAvatar(
                maxRadius: 16,
                child: getType(),
              ),
              const Spacer(),
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
