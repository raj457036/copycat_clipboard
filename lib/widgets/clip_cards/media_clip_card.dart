import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:copycat_base/constants/strings/asset_constants.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import "package:universal_io/io.dart";

class MediaClipCard extends StatelessWidget {
  final ClipboardItem item;

  const MediaClipCard({super.key, required this.item});

  Image getPreview() {
    if (item.fileMimeType!.startsWith("image")) {
      if (item.localPath != null) {
        return Image(
          image: ResizeImage(
            FileImage(File(item.localPath!)),
            width: 480,
            policy: ResizeImagePolicy.fit,
          ),
          gaplessPlayback: true,
          fit: BoxFit.cover,
        );
      }
      if (item.imgBlurHash == null) {
        return Image.asset(
          AssetConstants.placeholderImage,
          fit: BoxFit.cover,
        );
      }
      try {
        final image_ = BlurHash.decode(item.imgBlurHash!).toImage(35, 20);
        final bin = Uint8List.fromList(img.encodeJpg(image_));
        return Image.memory(
          bin,
          gaplessPlayback: true,
          fit: BoxFit.cover,
        );
      } catch (e) {
        return Image.asset(
          AssetConstants.placeholderImage,
          fit: BoxFit.cover,
        );
      }
    }
    return Image.asset(
      AssetConstants.placeholderImage,
      fit: BoxFit.cover,
    );
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
      borderRadius: radiusBottom12,
      child: SizedBox.expand(
          child: Stack(
        children: [
          Positioned.fill(child: getPreview()),
          Align(
            alignment: const Alignment(0.95, 0.95),
            child: getIcon(),
          ),
        ],
      )

          // DecoratedBox(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: getPreview(),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          //   child:
          // ),
          ),
    );
  }
}
