import 'package:bloc/bloc.dart';
import 'package:clipboard/common/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'drive_setup_cubit.freezed.dart';
part 'drive_setup_state.dart';

@injectable
class DriveSetupCubit extends Cubit<DriveSetupState> {
  DriveSetupCubit() : super(const DriveSetupState.unknown());
}
