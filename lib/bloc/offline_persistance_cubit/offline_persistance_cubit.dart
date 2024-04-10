import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
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
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'offline_persistance_cubit.freezed.dart';
part 'offline_persistance_state.dart';

@lazySingleton
class OfflinePersistanceCubit extends Cubit<OfflinePersistanceState> {
  final AuthCubit auth;
  final ClipboardRepository repo;
  final ClipboardService clipboard;

  late StreamSubscription<List<Clip?>> copySub;

  OfflinePersistanceCubit(
    this.auth,
    @Named("offline") this.repo,
    this.clipboard,
  ) : super(const OfflinePersistanceState.initial()) {
    clipboard.start();
    copySub = clipboard.onCopy.listen(onClips);
  }

  Future<void> deleteTempFile(File file) async {
    try {
      await file.delete();
    } catch (e) {
      logger.shout(
        "Couldn't delete file from temp storage.",
        e,
      );
    }
  }

  Future<String> getPesistedPath(String root, File file) async {
    final docDir = await getApplicationDocumentsDirectory();
    final basename = p.basename(file.path);
    final dirPath = p.join(docDir.path, "offline", root);
    await createDirectoryIfNotExists(dirPath);
    final filePath = p.join(dirPath, basename);
    await file.copy(filePath);
    deleteTempFile(file);
    return filePath;
  }

  Future<ClipboardItem> _convertToClipboardItem(Clip clip) async {
    final session = await auth.getSession();
    final userId = session.userId;

    switch (clip.type) {
      case ClipItemType.text:
        return ClipboardItem.fromText(userId, clip.text!);
      case ClipItemType.image:
        {
          final path = await getPesistedPath("images", clip.file!);
          return ClipboardItem.fromFile(
            userId,
            path,
            fileName: clip.fileName,
            isImage: true,
          );
        }
      case ClipItemType.file:
        {
          final isTextFile = clip.text != null;
          final path = await getPesistedPath("files", clip.file!);

          if (isTextFile) {
            return ClipboardItem.fromFile(
              userId,
              path,
              preview: clip.text?.substring(0, 1023),
              fileName: clip.fileName,
            );
          } else {
            return ClipboardItem.fromFile(
              userId,
              path,
              fileName: clip.fileName,
            );
          }
        }
      case ClipItemType.url:
        return ClipboardItem.fromURL(userId, clip.url!);
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
          (l) => OfflinePersistanceState.error(l),
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
          (l) => OfflinePersistanceState.error(l),
          (r) => OfflinePersistanceState.saved(
            r,
            synced: synced,
          ),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    copySub.cancel();
    clipboard.dispose();
    return super.close();
  }
}
