import 'dart:io';
import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:clipboard/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  Future<void> _download(BuildContext context) async {
    context.read<CloudPersistanceCubit>().download(item);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isMobile = MediaQuery.of(context).size.width < 480;
    return Material(
      color: colors.surfaceVariant,
      borderRadius: item.isSynced ? radiusBottom12 : null,
      child: InkWell(
        borderRadius: item.isSynced ? radiusBottom12 : null,
        onTap: () {},
        child: ClipRRect(
          borderRadius: item.isSynced ? radiusBottom12 : BorderRadius.zero,
          child: SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: getPreview(),
                  fit: BoxFit.contain,
                ),
              ),
              child: item.needDownload
                  ? ColoredBox(
                      color: colors.primaryContainer.withOpacity(0.5),
                      child: Center(
                        child: isMobile
                            ? IconButton.filled(
                                onPressed: item.isSyncing
                                    ? null
                                    : () => _download(context),
                                icon: const Icon(
                                    Icons.download_for_offline_outlined),
                                tooltip: "Download",
                              )
                            : ElevatedButton.icon(
                                onPressed: item.isSyncing
                                    ? null
                                    : () => _download(context),
                                icon: const Icon(
                                    Icons.download_for_offline_outlined),
                                label: const Text("Download"),
                              ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
