import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:clipboard/constants/strings/asset_constants.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import "package:universal_io/io.dart";

class MediaPreview extends StatelessWidget {
  final ClipboardItem item;

  const MediaPreview({super.key, required this.item});

  ImageProvider getPreview() {
    if (item.localPath != null) {
      return FileImage(File(item.localPath!));
    }
    if (item.imgBlurHash == null) {
      return const AssetImage(AssetConstants.placeholderImage);
    }
    try {
      final image_ = BlurHash.decode(item.imgBlurHash!).toImage(35, 20);
      final bin = Uint8List.fromList(img.encodeJpg(image_, quality: 80));
      return MemoryImage(bin);
    } catch (e) {
      return const AssetImage(AssetConstants.placeholderImage);
    }
  }

  Icon getIcon() {
    if (item.fileMimeType != null) {
      if (item.fileMimeType!.startsWith("image")) {
        return const Icon(Icons.image);
      }
      if (item.fileMimeType!.startsWith("video")) {
        return const Icon(Icons.ondemand_video_rounded);
      }
      if (item.fileMimeType!.startsWith("audio")) {
        return const Icon(Icons.audiotrack);
      }
    }
    return const Icon(Icons.image);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Material(
      color: colors.surfaceVariant,
      borderRadius: radius8,
      child: InkWell(
        borderRadius: radius8,
        // onTap: () {},
        child: ClipRRect(
          borderRadius: radius8,
          child: SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: getPreview(),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: const Alignment(0.95, 0.95),
                child: getIcon(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
