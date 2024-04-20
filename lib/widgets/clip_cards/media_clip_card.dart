import 'dart:io';
import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

class MediaPreview extends StatelessWidget {
  final ClipboardItem item;

  const MediaPreview({super.key, required this.item});

  ImageProvider getPreview() {
    if (item.localPath != null) {
      return FileImage(File(item.localPath!));
    }
    final image_ = BlurHash.decode(item.imgBlurHash!).toImage(35, 20);
    final bin = Uint8List.fromList(img.encodeJpg(image_));
    return MemoryImage(bin);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Material(
      color: colors.surfaceVariant,
      borderRadius: radius8,
      child: InkWell(
        borderRadius: radius8,
        onTap: () {},
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
            ),
          ),
        ),
      ),
    );
  }
}
