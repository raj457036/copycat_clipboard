import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/data/repositories/clipboard.dart';
import 'package:clipboard/data/services/google_services.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/utils/blur_hash.dart';
import 'package:clipboard/utils/network_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import "package:universal_io/io.dart";

part 'cloud_persistance_cubit.freezed.dart';
part 'cloud_persistance_state.dart';

@lazySingleton
class CloudPersistanceCubit extends Cubit<CloudPersistanceState> {
  final NetworkStatus network;
  final AuthCubit auth;
  final DriveSetupCubit driveCubit;
  final ClipboardRepository repo;
  final DriveService drive;
  final AppConfigCubit appConfig;

  CloudPersistanceCubit(
    this.network,
    this.auth,
    this.driveCubit,
    this.appConfig,
    @Named("cloud") this.repo,
    @Named("google_drive") this.drive,
  ) : super(const CloudPersistanceState.initial());

  Future<void> persist(ClipboardItem item) async {
    emit(const CloudPersistanceState.initial());
    if (!appConfig.isSyncEnabled) {
      if (item.userIntent) {
        emit(
          CloudPersistanceState.error(
            const Failure(
              message: "Sync is not enabled",
              code: "sync-not-enabled",
            ),
            item,
          ),
        );
      }
      return;
    }
    if (!await network.isConnected) {
      emit(
        CloudPersistanceState.error(
          noInternetConnectionFailure,
          item.syncDone(noInternetConnectionFailure),
        ),
      );
      return;
    }
    final userId = auth.userId;
    if (userId == null) return;
    item = item.assignUserId(userId);
    if (item.serverId != null) {
      emit(CloudPersistanceState.updatingItem(item));

      final result = await repo.update(item);
      emit(
        result.fold(
          (l) => CloudPersistanceState.error(l, item.syncDone(l)),
          (r) => CloudPersistanceState.saved(r.syncDone()),
        ),
      );
    } else {
      switch (item.type) {
        case ClipItemType.text || ClipItemType.url:
          await _create(item.assignUserId(userId));
        case ClipItemType.media || ClipItemType.file:
          if (!appConfig.isFileSyncEnabled) {
            emit(
              CloudPersistanceState.error(
                const Failure(
                  message: "File and Media Sync is not enabled",
                  code: "file-sync-not-enabled",
                ),
                item,
              ),
            );
            return;
          }
          await _uploadAndCreate(item.assignUserId(userId));
      }
    }
    return;
  }

  Future<void> _create(ClipboardItem item) async {
    emit(CloudPersistanceState.creatingItem(item));
    final result = await repo.create(item);
    emit(
      result.fold(
        (l) => CloudPersistanceState.error(l, item.syncDone(l)),
        (r) => CloudPersistanceState.saved(
          r.syncDone(),
          created: true,
        ),
      ),
    );
  }

  Future<String?> _getBlurHashIfNeeded(ClipboardItem item) async {
    if (item.fileMimeType == null ||
        !item.fileMimeType!.startsWith("image/") ||
        item.imgBlurHash != null ||
        item.localPath == null) return null;

    final blurHash = await getBlurHash(item.localPath!);
    return blurHash;
  }

  Future<void> _uploadAndCreate(ClipboardItem item) async {
    if (!appConfig.canUploadFile(item.fileSize!) && !item.userIntent) {
      logger.i("Auto upload is disabled for files over the limit.");
      emit(
        CloudPersistanceState.error(
          const Failure(
            message: "Auto upload is disabled for files over the limit.",
            code: "auto-upload-restriction",
          ),
          item,
        ),
      );
      return;
    }

    emit(
      CloudPersistanceState.uploadingFile(
        item.copyWith(uploading: true)..applyId(item),
      ),
    );
    final session = auth.session;

    if (session == null) {
      emit(
        CloudPersistanceState.error(
          authFailure,
          item.syncDone(authFailure),
        ),
      );
      return;
    }

    final accessToken = await driveCubit.accessToken;

    if (accessToken == null) {
      emit(CloudPersistanceState.error(
        driveFailure,
        item.syncDone(driveFailure),
      ));
      return;
    }

    drive.accessToken = accessToken;

    final results = await Future.wait([
      drive.upload(
        item.assignUserId(session.user.id),
        onProgress: (uploaded, total) {
          emit(
            CloudPersistanceState.uploadingFile(
              item.copyWith(
                uploading: true,
                uploadProgress: uploaded / total,
              )..applyId(item),
            ),
          );
        },
      ),
      _getBlurHashIfNeeded(item)
    ]);

    ClipboardItem updatedItem = results[0] as ClipboardItem;
    final blurhash = results[1] as String?;

    if (blurhash != null) {
      updatedItem = updatedItem.copyWith(imgBlurHash: blurhash)
        ..applyId(updatedItem);
    }

    if (updatedItem.driveFileId != null) {
      await _create(updatedItem);
    }
  }

  Future<void> delete(ClipboardItem item) async {
    emit(CloudPersistanceState.deletingItem(item));
    drive.cancelOperation(item);
    if (item.driveFileId != null) {
      final accessToken = await driveCubit.accessToken;

      if (accessToken == null) {
        emit(CloudPersistanceState.error(
          driveFailure,
          item.syncDone(driveFailure),
        ));
        return;
      }

      drive.accessToken = accessToken;
      await drive.delete(item);

      item = item.copyWith(driveFileId: null)..applyId(item);
    }

    if (item.serverId == null) {
      emit(
        CloudPersistanceState.deletedItem(
          item.copyWith(lastSynced: null)..applyId(item),
        ),
      );
      return;
    }

    if (!await network.isConnected) {
      emit(
        CloudPersistanceState.error(
          noInternetConnectionFailure,
          item.syncDone(noInternetConnectionFailure),
        ),
      );
      return;
    }

    final result = await repo.delete(item);

    result.fold(
      (l) => emit(CloudPersistanceState.error(l, item)),
      (r) => emit(
        CloudPersistanceState.deletedItem(
          item.copyWith(
            serverId: null,
            lastSynced: null,
          )..applyId(item),
        ),
      ),
    );
  }

  Future<void> download(ClipboardItem item) async {
    if (item.localPath != null) {
      final exists = await File(item.localPath!).exists();
      if (exists) return;
    }

    emit(
      CloudPersistanceState.downloadingFile(
        item.copyWith(downloading: true)..applyId(item),
      ),
    );
    final session = auth.session;

    if (session == null) {
      emit(CloudPersistanceState.error(
        authFailure,
        item.syncDone(authFailure),
      ));
      return;
    }

    final accessToken = await driveCubit.accessToken;

    if (accessToken == null) {
      emit(CloudPersistanceState.error(
        driveFailure,
        item.syncDone(driveFailure),
      ));
      return;
    }

    drive.accessToken = accessToken;
    final updatedItem = await drive.download(
      item.assignUserId(session.user.id),
    );
    await persist(updatedItem);
  }
}
