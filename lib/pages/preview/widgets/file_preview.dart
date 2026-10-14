import 'package:clipboard/base/constants/widget_styles.dart';
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/base/l10n/l10n.dart';
import 'package:clipboard/pages/preview/view/clip_preview_config.dart';
import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/file_thumbnail.dart';
import 'package:flutter/material.dart';

class FileClipPreviewCard extends StatelessWidget {
  final ClipboardItem item;
  const FileClipPreviewCard({super.key, required this.item});

  void open() async {
    openFile(item);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    final config = ClipPreviewConfig.of(context);
    final canShowThumbnail =
        item.inCache &&
        item.localPath != null &&
        item.fileMimeType?.trim().isNotEmpty == true;

    return Card.filled(
      margin: EdgeInsets.zero,
      shape: config?.shape,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(padding16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: padding12,
            children: [
              if (canShowThumbnail)
                FileThumbnail(
                  item: item,
                  widgetSize: 350,
                  modifier: "full_view",
                  contextMenuBuilder: isDesktopPlatform
                      ? textSelectionToolbarButtonItems
                      : null,
                ),
              Text.rich(
                TextSpan(
                  text: item.fileName,
                  children: [
                    if (item.fileMimeType != null)
                      TextSpan(
                        text: "\n(${item.fileMimeType})",
                        style: textTheme.labelMedium?.copyWith(
                          color: colors.onTertiaryContainer,
                        ),
                      ),
                    if (item.fileSize != null)
                      TextSpan(
                        text: "\n${formatBytes(item.fileSize!)}",
                        style: textTheme.labelSmall?.copyWith(
                          color: colors.onTertiaryContainer,
                        ),
                      ),
                  ],
                ),
                overflow: TextOverflow.fade,
                maxLines: 5,
                textAlign: TextAlign.center,
                style: textTheme.titleMedium?.copyWith(
                  color: colors.onTertiaryContainer,
                  height: 1.8,
                ),
              ),
              if (item.inCache) height12,
              if (item.inCache)
                ElevatedButton.icon(
                  icon: const Icon(Icons.open_in_new),
                  onPressed: open,
                  label: Text(context.locale.preview__card__file__open),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
