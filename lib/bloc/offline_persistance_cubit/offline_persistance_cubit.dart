import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/data/repositories/clipboard.dart';
import 'package:clipboard/data/services/clipboard_service.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';
import "package:universal_io/io.dart";

part 'offline_persistance_cubit.freezed.dart';
part 'offline_persistance_state.dart';

ClipboardItem? _latestItem;

@lazySingleton
class OfflinePersistanceCubit extends Cubit<OfflinePersistanceState> {
  final AuthCubit auth;
  final ClipboardRepository repo;
  final ClipboardService clipboard;
  final CopyToClipboard copy;
  final AppConfigCubit appConfig;
  final String deviceId;

  bool _listening = false;

  StreamSubscription<List<ClipItem?>>? copySub;

  OfflinePersistanceCubit(
    this.auth,
    @Named("offline") this.repo,
    this.clipboard,
    this.appConfig,
    @Named("device_id") this.deviceId,
  )   : copy = CopyToClipboard(clipboard),
        super(const OfflinePersistanceState.initial());

  Future<ClipboardItem?> getItem({required int id}) async {
    final result = await repo.get(id: id);
    final item = result.fold((l) {
      logger.e(l);
      return null;
    }, (r) {
      return r;
    });
    return item;
  }

  onCaptureClipboard() {
    emit(const OfflinePersistanceState.initial());
    if (appConfig.isCopyingPaused) {
      logger.i("Copying is paused!");
      emit(
        const OfflinePersistanceState.error(
          Failure(
            message: "Copying is paused!",
            code: "copy-paused",
          ),
        ),
      );
      return;
    }
    clipboard.readClipboard();
  }

  Future<void> startListners() async {
    if (_listening) return;
    _latestItem = await _getLatestClipboardItem();
    clipboard.start(onCaptureClipboard);
    copySub = clipboard.onCopy?.listen(onClips);
    _listening = true;
  }

  void stopListners() {
    if (!_listening) return;
    clipboard.dispose();
    copySub?.cancel();
    copySub = null;
    _listening = false;
  }

  Future<ClipboardItem?> _getLatestClipboardItem() async {
    final result = await repo.getLatest();
    final item = result.fold((l) {
      logger.e(l);
      return null;
    }, (r) {
      return r;
    });
    return item;
  }

  Future<void> reset() async {
    await Future.wait([
      repo.deleteAll(),
      clearPersistedRootDir(),
    ]);
  }

  Future<void> paste() async {
    final clips = await clipboard.readClipboard(manual: true);
    if (clips != null) {
      await onClips(clips);
    }
  }

  Future<void> shareClipboardItem(ClipboardItem item) async {
    switch (item.type) {
      case ClipItemType.text:
        await Share.share(
          item.text!,
          subject: item.title,
        );
      case ClipItemType.url:
        await Share.shareUri(
          Uri.parse(item.url!),
        );
      case ClipItemType.media:
      case ClipItemType.file:
        if (item.localPath == null) return;
        await Share.shareXFiles(
          [XFile(item.localPath!)],
          subject: item.title,
          text: item.description,
        );
    }
  }

  Future<bool> copyToClipboard(
    ClipboardItem item, {
    bool saveFile = false,
  }) async {
    bool copied = false;
    switch (item.type) {
      case ClipItemType.text:
        copied = await copy.text(item.text ?? "");
      case ClipItemType.url:
        copied = await copy.url(Uri.tryParse(item.url ?? ""));
      case ClipItemType.media:
      case ClipItemType.file:
        if (item.localPath == null) return false;
        if (saveFile) {
          copied = await copy.saveFile(File(item.localPath!));
        } else {
          copied = await copy.fileContent(
            File(item.localPath!),
            mimeType: item.fileMimeType,
          );
        }
      default:
        copied = false;
    }

    if (copied) {
      persist(
        item.copyWith(
          copiedCount: item.copiedCount + 1,
          lastCopied: now(),
        )..applyId(item),
      );
    }

    return copied;
  }

  bool _foundDuplicate(ClipboardItem item) {
    if (_latestItem == null) {
      return false;
    }

    if (item.type == ClipItemType.text) {
      logger.i("Found Duplicate Text");
      return _latestItem!.text == item.text;
    }

    if (item.type == ClipItemType.url) {
      logger.i("Found Duplicate URL");
      return _latestItem!.url == item.url;
    }

    // other type not supported yet.
    return false;
  }

  Future<ClipboardItem> _convertToClipboardItem(ClipItem clip) async {
    final userId = auth.userId;

    switch (clip.type) {
      case ClipItemType.text:
        return ClipboardItem.fromText(
          clip.text!,
          userId: userId,
          category: clip.textCategory,
        );
      case ClipItemType.media:
        {
          final path = clip.file!.path;
          return ClipboardItem.fromMedia(
            path,
            userId: userId,
            fileName: clip.fileName,
            fileMimeType: clip.fileMimeType,
            fileExtension: clip.fileExtension,
            fileSize: clip.fileSize,
            blurHash: clip.blurHash,
          );
        }
      case ClipItemType.file:
        {
          final path = clip.file!.path;

          return ClipboardItem.fromFile(
            path,
            userId: userId,
            preview: clip.text?.substring(0, 1024),
            fileName: clip.fileName,
            fileMimeType: clip.fileMimeType,
            fileExtension: clip.fileExtension,
            fileSize: clip.fileSize,
          );
        }
      case ClipItemType.url:
        return ClipboardItem.fromURL(
          clip.uri!,
          userId: userId,
        );
    }
  }

  Future<void> onClips(
    List<ClipItem?> clips, {
    bool manualPaste = false,
  }) async {
    if (clips.isEmpty) return;

    for (final clip in clips) {
      if (clip == null) continue;

      if (!manualPaste &&
          clip.fileSize != null &&
          !appConfig.canCopyFile(clip.fileSize!)) {
        logger.i("Auto copy is disabled for files over the limit.");
        clip.cleanup();

        emit(
          const OfflinePersistanceState.error(
            Failure(
              message: "Auto copy is disabled for files over the limit",
              code: "auto-copy-restrictions",
            ),
          ),
        );
        return;
      }

      final item = await _convertToClipboardItem(clip);
      final isDuplicate = _foundDuplicate(item);

      _latestItem = item;

      if (manualPaste) {
        final userItem = item.copyWith(userIntent: manualPaste)..applyId(item);
        await persist(userItem);
        return;
      }

      if (isDuplicate) return;

      await persist(item);
    }
  }

  Future<void> persist(ClipboardItem item, {bool synced = false}) async {
    item = item.copyWith(deviceId: deviceId)..applyId(item);

    if (!item.isPersisted) {
      emit(OfflinePersistanceState.creatingItem(item));
      final created = await repo.create(item);

      emit(
        created.fold(
          (l) => OfflinePersistanceState.error(l, item),
          (r) => OfflinePersistanceState.saved(
            r,
            created: true,
            synced: synced,
          ),
        ),
      );
    } else {
      emit(OfflinePersistanceState.updatingItem(item));
      final updated = await repo.update(item);

      emit(
        updated.fold(
          (l) => OfflinePersistanceState.error(l, item),
          (r) => OfflinePersistanceState.saved(
            r,
            synced: synced,
          ),
        ),
      );
    }
  }

  Future<void> delete(ClipboardItem item) async {
    if (item.isSynced) return;
    emit(OfflinePersistanceState.deletingItem(item));
    await item.cleanUp();
    await repo.delete(item);
    emit(OfflinePersistanceState.deletedItem(item));
  }

  @override
  Future<void> close() {
    stopListners();
    return super.close();
  }
}
