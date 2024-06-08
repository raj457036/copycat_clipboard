import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/pages/preview/widgets/clip_detail_form.dart';
import 'package:clipboard/pages/preview/widgets/file_preview.dart';
import 'package:clipboard/pages/preview/widgets/media_preview.dart';
import 'package:clipboard/pages/preview/widgets/preview_options.dart';
import 'package:clipboard/pages/preview/widgets/text_preview.dart';
import 'package:clipboard/pages/preview/widgets/url_preview.dart';
import 'package:flutter/material.dart';

Widget previewWidget({required ClipboardItem item, required bool isMobile}) {
  switch (item.type) {
    case ClipItemType.text:
      return TextClipPreviewCard(item: item, isMobile: isMobile);
    case ClipItemType.media:
      return MediaClipPreviewCard(item: item, isMobile: isMobile);
    case ClipItemType.url:
      return URLClipPreviewCard(item: item, isMobile: isMobile);
    case ClipItemType.file:
      return FileClipPreviewCard(item: item, isMobile: isMobile);
  }
}

class ClipboardItemDesktopPreviewPageContent extends StatelessWidget {
  final ClipboardItem item;
  const ClipboardItemDesktopPreviewPageContent({
    super.key,
    required this.item,
  });
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(
        width: 950,
        height: 600,
      ),
      child: ClipRRect(
        borderRadius: radius12,
        child: Scaffold(
          extendBody: true,
          body: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox.expand(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: previewWidget(item: item, isMobile: false),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 5,
                        right: 5,
                        child: PreviewOptions(
                          item: item,
                          alignment: MainAxisAlignment.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(padding16),
                  child: ClipDetailForm(item: item, isMobile: false),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClipboardItemMobilePreviewPageContent extends StatelessWidget {
  final ClipboardItem item;
  const ClipboardItemMobilePreviewPageContent({
    super.key,
    required this.item,
  });
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints.loose(
            const Size.fromHeight(350),
          ),
          child: Stack(
            children: [
              previewWidget(item: item, isMobile: true),
              Positioned(
                left: 20,
                right: 20,
                bottom: 5,
                child: PreviewOptions(
                  item: item,
                  alignment: MainAxisAlignment.center,
                ),
              ),
            ],
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints.loose(
            const Size.fromHeight(450),
          ),
          child: Padding(
            padding: const EdgeInsets.all(padding16),
            child: ClipDetailForm(item: item, isMobile: true),
          ),
        ),
      ],
    );
  }
}

class ClipboardItemPreviewPage extends StatelessWidget {
  final bool isDialog;
  final ClipboardItem item;
  const ClipboardItemPreviewPage({
    super.key,
    required this.item,
    this.isDialog = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isDialog) {
      return ClipboardItemDesktopPreviewPageContent(item: item);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.preview),
      ),
      body: ClipboardItemMobilePreviewPageContent(item: item),
    );
  }
}
