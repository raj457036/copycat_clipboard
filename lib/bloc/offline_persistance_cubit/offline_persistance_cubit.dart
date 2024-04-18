import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/data/repositories/clipboard.dart';
import 'package:clipboard/data/services/clipboard_service.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'offline_persistance_cubit.freezed.dart';
part 'offline_persistance_state.dart';

@lazySingleton
class OfflinePersistanceCubit extends Cubit<OfflinePersistanceState> {
  final AuthCubit auth;
  final ClipboardRepository repo;
  final ClipboardService clipboard;
  final CopyToClipboard copy;

  bool _listening = false;

  late StreamSubscription<List<Clip?>> copySub;

  OfflinePersistanceCubit(
    this.auth,
    @Named("offline") this.repo,
    this.clipboard,
  )   : copy = CopyToClipboard(clipboard),
        super(const OfflinePersistanceState.initial());

  void startListners() {
    if (_listening) return;
    clipboard.start();
    copySub = clipboard.onCopy.listen(onClips);
    _listening = true;
  }

  void stopListners() {
    if (!_listening) return;
    clipboard.dispose();
    copySub.cancel();
    _listening = false;
  }

  Future<void> reset() async {
    await repo.deleteAll();
    await clearPersistedRootDir();
  }

  Future<bool> copyToClipboard(
    ClipboardItem item, {
    bool fileContent = false,
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
        if (fileContent) {
          final result = await copy.fileContent(
            File(item.localPath!),
            mimeType: item.fileMimeType,
          );
          if (result) copied = true;
        }
        copied = await copy.file(File(item.localPath!));
      default:
        copied = false;
    }

    if (copied) {
      persist(
        item.copyWith(
          copiedCount: item.copiedCount + 1,
          lastCopied: nowUTC(),
        )..applyId(item),
      );
    }

    return copied;
  }

  Future<ClipboardItem> _convertToClipboardItem(Clip clip) async {
    final userId = auth.userId;

    switch (clip.type) {
      case ClipItemType.text:
        return ClipboardItem.fromText(
          clip.text!,
          userId: userId,
        );
      case ClipItemType.media:
        {
          final path = await getPesistedPath("medias", clip.file!);
          return ClipboardItem.fromMedia(
            path,
            userId: userId,
            fileName: clip.fileName,
            fileMimeType: clip.fileMimeType,
            fileExtension: clip.fileExtension,
            fileSize:
                clip.fileSize != null ? clip.fileSize! ~/ 1024 : null, // in KB
            blurHash: clip.blurHash,
          );
        }
      case ClipItemType.file:
        {
          final path = await getPesistedPath("files", clip.file!);

          return ClipboardItem.fromFile(
            path,
            userId: userId,
            preview: clip.text?.substring(0, 1024),
            fileName: clip.fileName,
            fileMimeType: clip.fileMimeType,
            fileExtension: clip.fileExtension,
            fileSize:
                clip.fileSize != null ? clip.fileSize! ~/ 1024 : null, // in KB
          );
        }
      case ClipItemType.url:
        return ClipboardItem.fromURL(
          clip.uri!,
          userId: userId,
        );
    }
  }

  Future<void> onClips(List<Clip?> clips) async {
    if (clips.isEmpty) return;

    for (final clip in clips) {
      if (clip == null) continue;
      final item = await _convertToClipboardItem(clip);
      await persist(item);
    }
  }

  Future<void> persist(ClipboardItem item, {bool synced = false}) async {
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
