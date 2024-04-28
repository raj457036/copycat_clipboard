import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:clipboard/constants/strings/asset_constants.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import "package:universal_io/io.dart";

class MediaClipCard extends StatelessWidget {
  final ClipboardItem item;

  const MediaClipCard({super.key, required this.item});

  ImageProvider getPreview() {
    if (item.fileMimeType!.startsWith("image")) {
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
    return const AssetImage(AssetConstants.placeholderImage);
  }

  Widget getIcon() {
    if (item.fileMimeType != null) {
      if (item.fileMimeType!.startsWith("image")) {
        return const Icon(
          Icons.image,
          color: Colors.white,
        );
      }
      if (item.fileMimeType!.startsWith("video")) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              item.fileMimeType!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            width8,
            const Icon(
              Icons.ondemand_video_rounded,
              color: Colors.white,
            ),
            width2,
          ],
        );
        // return const Icon(
        //   Icons.ondemand_video_rounded,
        //   color: Colors.white,
        // );
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
    return ClipRRect(
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
    );
  }
}
