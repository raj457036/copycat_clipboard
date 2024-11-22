import 'dart:async';

import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/common/logging.dart';
import 'package:copycat_base/constants/strings/strings.dart';
import 'package:copycat_base/data/services/clipboard_service.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as p;
import 'package:share_handler/share_handler.dart';
import "package:universal_io/io.dart";

class ShareListener extends StatefulWidget {
  final Widget child;
  const ShareListener({
    super.key,
    required this.child,
  });

  static Widget fromPlatform({required Widget child}) {
    if (isMobilePlatform) {
      return ShareListener(child: child);
    }
    return child;
  }

  @override
  State<ShareListener> createState() => _ShareListenerState();
}

class _ShareListenerState extends State<ShareListener> {
  StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  Future<void> initPlatformState() async {
    final handler = ShareHandlerPlatform.instance;
    final media = await handler.getInitialSharedMedia();
    if (media != null) {
      logger.i("Received initial shared media!");
      await putMediaToClipboard(media);
      await handler.resetInitialSharedMedia();
      if (Platform.isAndroid && mounted) {
        showTextSnackbar(
          // ignore: use_build_context_synchronously
          "✅ ${context.locale.done}",
          closePrevious: true,
          duration: 15,
          isProgress: true,
          action: SnackBarAction(
            // ignore: use_build_context_synchronously
            label: context.locale.backToApp,
            onPressed: () {
              SystemNavigator.pop(animated: true);
            },
          ),
        );
      }
    }

    subscription = handler.sharedMediaStream.listen((SharedMedia media) async {
      logger.i("Received shared media: $media");

      try {
        if (mounted) {
          showTextSnackbar(
            context.locale.pastingTheSharedContent,
            isLoading: true,
            duration: 10,
          );
        }
        await putMediaToClipboard(media);
        closeSnackbar();
        if (Platform.isAndroid) {
          if (mounted) {
            showTextSnackbar(
              "✅ ${context.locale.done}",
              closePrevious: true,
              duration: 15,
              isProgress: true,
              action: SnackBarAction(
                // ignore: use_build_context_synchronously
                label: context.locale.backToApp,
                onPressed: () {
                  SystemNavigator.pop(animated: true);
                },
              ),
            );
          }
        }
      } catch (e) {
        // ignore: use_build_context_synchronously
        if (mounted) {
          showTextSnackbar("❌ ${context.locale.failed}", closePrevious: true);
        }
      }
      // closeSnackbar();
    }, onError: (error) {
      if (mounted) {
        showFailureSnackbar(Failure.fromException(error));
      }
    });
  }

  Future<ClipItem?> getFileClipItem(String path, String category) async {
    final ext = p.extension(path).replaceFirst(".", "");
    final fileName = p.basenameWithoutExtension(path);
    final (file, mimeType, size) = await writeToClipboardCacheFile(
      folder: category,
      ext: ext,
      fileName: fileName,
      file: File(path),
    );
    if (file != null) {
      ClipItem? clip;
      if (category == "medias") {
        clip = ClipItem.imageFile(
          file: file,
          mimeType: mimeType ?? "application/octet-stream",
          fileName: fileName,
          fileSize: size,
        );
      } else {
        clip = ClipItem.file(
          file: file,
          mimeType: mimeType ?? "application/octet-stream",
          fileName: fileName,
          fileSize: size,
        );
      }
      return clip;
    }
    return null;
  }

  Future<void> putMediaToClipboard(SharedMedia media) async {
    final clips = <ClipItem>[];

    if (media.content != null && media.content!.isNotEmpty) {
      final uri = Uri.tryParse(media.content!);
      final schema = uri?.scheme;
      final isSupported = supportedUriSchemas.contains(schema);

      if (isSupported && uri != null) {
        final clip = ClipItem.uri(
          uri: uri,
        );
        clips.add(clip);
      } else {
        final (category, text) = getTextCategory(media.content!);
        final clip = ClipItem.text(text: text, textCategory: category);
        clips.add(clip);
      }
    }
    if (media.attachments != null) {
      for (final attachment in media.attachments!) {
        if (attachment == null) continue;
        final category =
            attachment.type == SharedAttachmentType.file ? "files" : "medias";
        final clip = await getFileClipItem(attachment.path, category);
        if (clip == null) continue;
        clips.add(clip);
      }
    }
    if (media.imageFilePath != null) {
      final clip = await getFileClipItem(media.imageFilePath!, "medias");
      if (clip != null) clips.add(clip);
    }

    if (mounted) {
      await context
          .read<OfflinePersistenceCubit>()
          .onClips(clips, manualPaste: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
