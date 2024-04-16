import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/google_token_cubit/google_token_manager_cubit.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/data/repositories/clipboard.dart';
import 'package:clipboard/data/services/google_services.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/utils/network_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'cloud_persistance_cubit.freezed.dart';
part 'cloud_persistance_state.dart';

@injectable
class CloudPersistanceCubit extends Cubit<CloudPersistanceState> {
  final NetworkStatus network;
  final AuthCubit auth;
  final GoogleTokenManagerCubit gToken;
  final ClipboardRepository repo;
  final DriveService drive;

  bool active = true;

  CloudPersistanceCubit(
    this.network,
    this.auth,
    this.gToken,
    @Named("cloud") this.repo,
    @Named("google_drive") this.drive,
  ) : super(const CloudPersistanceState.initial());

  Future<void> persist(ClipboardItem item) async {
    if (!active) return;
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
          await _uploadAndCreate(item.assignUserId(userId));
      }
    }
  }

  Future<void> _create(ClipboardItem item) async {
    emit(CloudPersistanceState.creatingItem(
        item.copyWith(uploading: true)..applyId(item)));
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

  Future<void> _uploadAndCreate(ClipboardItem item) async {
    emit(CloudPersistanceState.uploadingFile(
        item.copyWith(uploading: true)..applyId(item)));
    final session = auth.session;

    if (session == null) {
      emit(
        CloudPersistanceState.error(
          notLoggedInFailure,
          item.syncDone(notLoggedInFailure),
        ),
      );
      return;
    }

    final accessToken = await gToken.getAccessToken();

    if (accessToken == null) {
      const failure = Failure(
        message: "Google Drive not authenticated.",
        code: "gdrive-unauth",
      );
      emit(
        CloudPersistanceState.error(
          failure,
          item.syncDone(failure),
        ),
      );
      return;
    }

    drive.accessToken = accessToken;
    final updatedItem = await drive.upload(item.assignUserId(session.user.id));
    await _create(updatedItem);
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
        notLoggedInFailure,
        item.syncDone(notLoggedInFailure),
      ));
      return;
    }

    final accessToken = await gToken.getAccessToken();

    if (accessToken == null) {
      const failure = Failure(
        message: "Google Drive not authenticated.",
        code: "gdrive-unauth",
      );
      emit(
        CloudPersistanceState.error(
          failure,
          item.syncDone(failure),
        ),
      );
      return;
    }

    drive.accessToken = accessToken;
    final updatedItem =
        await drive.download(item.assignUserId(session.user.id));
    await persist(updatedItem);
  }
}
