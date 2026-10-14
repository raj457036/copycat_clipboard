import 'package:clipboard/base/constants/widget_styles.dart';
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/pages/preview/view/clip_preview_config.dart';
import 'package:clipboard/pages/preview/widgets/preview.dart';
import 'package:flutter/material.dart';

class ClipPreviewFullscreenPage extends StatelessWidget {
  final ClipboardItem item;

  const ClipPreviewFullscreenPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final preview = item.isImage
        ? Hero(
            tag: "Clip--${item.id}",
            child: ClipPreview(item: item),
          )
        : ClipPreview(item: item);
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: padding2),
        child: ClipPreviewConfig(child: preview),
      ),
    );
  }
}
