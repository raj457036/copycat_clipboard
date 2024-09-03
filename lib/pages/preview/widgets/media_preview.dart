import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:copycat_base/constants/strings/asset_constants.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:image/image.dart' as img;
import 'package:universal_io/io.dart';

class MediaClipPreviewCard extends StatelessWidget {
  final ClipboardItem item;
  final bool isMobile;
  const MediaClipPreviewCard({
    super.key,
    required this.item,
    required this.isMobile,
  });

  ImageProvider? getPreview() {
    if (item.localPath != null) {
      if (item.fileMimeType!.contains("svg")) {
        return Svg(
          item.localPath!,
          source: SvgSource.file,
        );
      }
      return FileImage(File(item.localPath!));
    }
    if (item.imgBlurHash == null) {
      return const AssetImage(AssetConstants.placeholderImage);
    }
    try {
      final image_ = BlurHash.decode(item.imgBlurHash!).toImage(35, 20);
      final bin = Uint8List.fromList(img.encodeJpg(image_));
      return MemoryImage(bin);
    } catch (e) {
      return const AssetImage(AssetConstants.placeholderImage);
    }
  }

  void open() async {
    openFile(item);
  }

  Widget? getPrimaryView(BuildContext context) {
    if (item.fileMimeType != null) {
      if (item.fileMimeType!.startsWith("image")) {
        return const Align(
          alignment: Alignment(-.98, -.98),
          child: Icon(
            Icons.image,
            color: Colors.white,
          ),
        );
      }
      if (item.fileMimeType!.startsWith("video")) {
        if (item.inCache) {
          return Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.play_arrow_rounded),
              onPressed: open,
              label: Text(context.locale.open),
            ),
          );
        }
        return const Align(
          alignment: Alignment(-.98, -.98),
          child: Icon(
            Icons.video_file,
            color: Colors.white,
          ),
        );
      }
      if (item.fileMimeType!.startsWith("audio")) {
        return const Align(
          alignment: Alignment(-.98, -.98),
          child: Icon(
            Icons.audiotrack,
            color: Colors.white,
          ),
        );
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final preview = getPreview();
    return Card.filled(
      margin: isMobile
          ? const EdgeInsets.only(
              left: padding16,
              right: padding16,
              top: padding16,
            )
          : EdgeInsets.zero,
      shape: isMobile
          ? null
          : const RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(12),
              ),
            ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: preview != null
              ? DecorationImage(
                  image: preview,
                  fit: BoxFit.contain,
                )
              : null,
          borderRadius: isMobile
              ? radius12
              : const BorderRadius.horizontal(
                  left: Radius.circular(12),
                ),
        ),
        child: getPrimaryView(context),
      ),
    );
  }
}
