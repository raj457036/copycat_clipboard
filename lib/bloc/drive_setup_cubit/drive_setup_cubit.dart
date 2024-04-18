import 'package:bloc/bloc.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/data/repositories/drive_credential.dart';
import 'package:clipboard/model/drive_access_token.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'drive_setup_cubit.freezed.dart';
part 'drive_setup_state.dart';

@injectable
class DriveSetupCubit extends Cubit<DriveSetupState> {
  final DriveCredentialRepository repo;

  DriveSetupCubit(this.repo) : super(const DriveSetupState.unknown());

  Future<void> fetch() async {
    emit(const DriveSetupState.fetching());
    final result = await repo.getDriveCredentials();
    emit(result.fold(
      (l) => DriveSetupState.setupError(failure: l),
      (r) => DriveSetupState.setupDone(token: r),
    ));
  }

  Future<void> startSetup() async {
    emit(const DriveSetupState.unknown());
    final result = await repo.launchConsentPage();
    emit(result.fold(
      (l) => DriveSetupState.setupError(failure: l),
      (r) => const DriveSetupState.unknown(waiting: true),
    ));
  }

  Future<void> verifyAuthCodeAndSetup(String code, List<String> scopes) async {
    emit(DriveSetupState.verifyingCode(code: code, scopes: scopes));

    final result = await repo.setupDrive(code);
    emit(result.fold(
      (l) => DriveSetupState.setupError(failure: l),
      (r) => DriveSetupState.setupDone(token: r),
    ));
  }

  Future<void> refreshAccess() async {
    emit(const DriveSetupState.refreshingToken());
    final result = await repo.refreshAccessToken();
    emit(result.fold(
      (l) => DriveSetupState.setupError(failure: l),
      (r) => DriveSetupState.setupDone(token: r),
    ));
  }
}
