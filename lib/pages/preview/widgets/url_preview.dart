import 'package:clipboard/base/constants/widget_styles.dart';
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/base/l10n/l10n.dart';
import 'package:clipboard/pages/preview/view/clip_preview_config.dart';
import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/widgets/link_preview/link_preview.dart';
import 'package:flutter/material.dart';

class URLClipPreviewCard extends StatelessWidget {
  final ClipboardItem item;
  const URLClipPreviewCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final config = ClipPreviewConfig.of(context);

    return Card.filled(
      margin: EdgeInsets.zero,
      shape: config?.shape,
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(padding16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12,
          children: [
            LimitedBox(
              maxHeight: 350,
              child: Card.outlined(
                shape: const RoundedRectangleBorder(borderRadius: radius12),
                clipBehavior: Clip.hardEdge,
                child: LinkPreview(
                  item: item,
                  onTap: () => launchUrl(item),
                  maxTitleLines: 3,
                  maxDescLines: 5,
                ),
              ),
            ),
            const Divider(),
            SelectableText(
              item.url ?? context.locale.preview__card__missing_text,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge,
              contextMenuBuilder: textSelectionToolbarButtonItems,
            ),
          ],
        ),
      ),
    );
  }
}
