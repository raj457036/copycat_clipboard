import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:copycat_base/constants/strings/asset_constants.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:flutter/material.dart';
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

  ImageProvider getPreview() {
    if (item.localPath != null) {
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

  Icon getIcon() {
    if (item.fileMimeType != null) {
      if (item.fileMimeType!.startsWith("image")) {
        return const Icon(
          Icons.image,
          color: Colors.white,
        );
      }
      if (item.fileMimeType!.startsWith("video")) {
        return const Icon(
          Icons.ondemand_video_rounded,
          color: Colors.white,
        );
      }
      if (item.fileMimeType!.startsWith("audio")) {
        return const Icon(
          Icons.audiotrack,
          color: Colors.white,
        );
      }
    }
    return const Icon(
      Icons.image,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
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
          image: DecorationImage(
            image: getPreview(),
            fit: BoxFit.contain,
          ),
          borderRadius: isMobile
              ? radius12
              : const BorderRadius.horizontal(
                  left: Radius.circular(12),
                ),
        ),
        child: Align(
          alignment: const Alignment(0.95, 0.95),
          child: getIcon(),
        ),
      ),
    );
  }
}
