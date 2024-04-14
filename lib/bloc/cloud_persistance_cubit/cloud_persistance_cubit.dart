import 'package:bloc/bloc.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/google_token_cubit/google_token_manager_cubit.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/data/repositories/clipboard.dart';
import 'package:clipboard/data/services/drive_service.dart';
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

  CloudPersistanceCubit(
    this.network,
    this.auth,
    this.gToken,
    @Named("cloud") this.repo,
    @Named("google_drive") this.drive,
  ) : super(const CloudPersistanceState.initial());

  Future<void> persist(ClipboardItem item) async {
    if (!network.isConnected) {
      emit(const CloudPersistanceState.error(noInternetConnectionFailure));
      return;
    }

    if (item.serverId != null) {
      emit(CloudPersistanceState.updatingItem(item));
      final result = await repo.update(item);
      emit(
        result.fold(
          (l) => CloudPersistanceState.error(l),
          (r) => CloudPersistanceState.saved(r),
        ),
      );
    } else {
      switch (item.type) {
        case ClipItemType.text || ClipItemType.url:
          await _create(item);
        case ClipItemType.media || ClipItemType.file:
          await _uploadAndCreate(item);
      }
    }
  }

  Future<void> _create(ClipboardItem item) async {
    emit(CloudPersistanceState.creatingItem(item));
    final result = await repo.create(item);
    emit(
      result.fold(
        (l) => CloudPersistanceState.error(l),
        (r) => CloudPersistanceState.saved(r, created: true),
      ),
    );
  }

  Future<void> _uploadAndCreate(ClipboardItem item) async {
    emit(CloudPersistanceState.uploadingFile(item));
    final session = auth.getSession();

    if (session == null) {
      emit(const CloudPersistanceState.error(notLoggedInFailure));
      return;
    }

    final accessToken = await gToken.getAccessToken();

    if (accessToken == null) {
      emit(
        const CloudPersistanceState.error(
          Failure(
            message: "Google Drive not authenticated.",
            code: "gdrive-unauth",
          ),
        ),
      );
      return;
    }

    drive.accessToken = accessToken;
    final updatedItem = await drive.upload(item.assignUserId(session.user.id));
    await _create(updatedItem);
  }
}
