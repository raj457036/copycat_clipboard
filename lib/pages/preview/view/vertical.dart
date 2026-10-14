import 'package:animate_do/animate_do.dart';
import 'package:clipboard/base/constants/widget_styles.dart';
import 'package:clipboard/di/di.dart' show sl;
import 'package:clipboard/pages/preview/view/clip_preview_config.dart';
import 'package:clipboard/pages/preview/view/fullscreen_preview.dart';
import 'package:clipboard/pages/preview/widgets/clip_inspector.dart';
import 'package:clipboard/pages/preview/widgets/preview.dart';
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/base/l10n/l10n.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';

class ClipItemPreviewVerticalView extends StatelessWidget {
  final ClipboardItem item;
  const ClipItemPreviewVerticalView({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: context.isMobile || context.isTablet,
        centerTitle: false,
        title: Text(
          item.displayTitle ?? context.locale.preview__inspector__title,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Stack(
            children: [
              LimitedBox(
                maxHeight: 450,
                child: ClipPreviewConfig(
                  shape: const RoundedRectangleBorder(borderRadius: radius16),
                  child: item.isImage
                      ? Hero(
                          tag: "Clip--${item.id}",
                          child: ClipPreview(item: item),
                        )
                      : ClipPreview(item: item),
                ),
              ),
              Positioned(
                right: 8,
                bottom: 8,
                child: ZoomIn(
                  delay: Durations.short2,
                  child: IconButton.filled(
                    icon: const Icon(Icons.fullscreen_rounded),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ClipPreviewFullscreenPage(item: item),
                      ),
                    ),
                    tooltip: "Fullscreen",
                  ),
                ),
              ),
            ],
          ),
          height16,
          ClipInspector(
            item: item,
            includePagePadding: false,
            showHeader: false,
            currentDeviceId: sl<String>(instanceName: "device_id"),
          ),
        ],
      ),
    );
  }
}
