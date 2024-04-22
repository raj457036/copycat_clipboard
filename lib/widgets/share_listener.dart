import 'dart:io';

import 'package:clipboard/data/services/clipboard_service.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as p;
import 'package:share_handler/share_handler.dart';

class ShareListener extends StatefulWidget {
  final Widget child;
  const ShareListener({
    super.key,
    required this.child,
  });

  static Widget forPlatform({required Widget child}) {
    if (Platform.isAndroid || Platform.isIOS) {
      return ShareListener(child: child);
    }
    return child;
  }

  @override
  State<ShareListener> createState() => _ShareListenerState();
}

class _ShareListenerState extends State<ShareListener> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    final handler = ShareHandlerPlatform.instance;
    final media = await handler.getInitialSharedMedia();

    if (media != null) putMediaToClipboard(media);

    handler.sharedMediaStream.listen((SharedMedia media) {
      if (!mounted) return;
      putMediaToClipboard(media);
    });
    if (!mounted) return;
  }

  Future<List<ClipItem>> putMediaToClipboard(SharedMedia media) async {
    final clips = <ClipItem>[];

    if (media.content != null) {
      final (category, text) = getTextCategory(media.content!);
      final clip = ClipItem.text(text: text, textCategory: category);
      clips.add(clip);
    }
    if (media.imageFilePath != null) {
      final ext = p.extension(media.imageFilePath!).substring(1);
      final fileName = p.basenameWithoutExtension(media.imageFilePath!);
      final (file, mimeType, size) = await writeToClipboardCacheFile(
        folder: "medias",
        ext: ext,
        fileName: fileName,
        file: File(media.imageFilePath!),
      );
      if (file != null) {
        final clip = ClipItem.file(
          file: file,
          mimeType: mimeType ?? "application/octet-stream",
          fileName: fileName,
          fileSize: size,
        );
        clips.add(clip);
      }
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
