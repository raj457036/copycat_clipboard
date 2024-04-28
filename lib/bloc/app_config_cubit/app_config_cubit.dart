import 'package:bloc/bloc.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/data/repositories/app_config.dart';
import 'package:clipboard/db/app_config/appconfig.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_config_cubit.freezed.dart';
part 'app_config_state.dart';

@singleton
class AppConfigCubit extends Cubit<AppConfigState> {
  final AppConfigRepository repo;
  AppConfigCubit(this.repo)
      : super(AppConfigState.loaded(isLoading: true, config: AppConfig()));

  Future<void> load() async {
    emit(state.copyWith(isLoading: true));
    final appConfig = await repo.get();

    emit(appConfig.fold(
      (l) => state.copyWith(failure: l),
      (r) => state.copyWith(config: r),
    ));
  }

  bool get isCopyingPaused =>
      state.config.pausedTill != null &&
      state.config.pausedTill!.isAfter(now());

  bool canUploadFile(int size) => state.config.dontUploadOver >= size;

  bool canCopyFile(int size) => state.config.dontCopyOver >= size;

  bool get isSyncEnabled => state.config.enableSync;

  bool get isFileSyncEnabled =>
      state.config.enableSync && state.config.enableFileSync;

  Future<void> changePausedTill(DateTime? pausedTill) async {
    final newConfig = state.config.copyWith(pausedTill: pausedTill)
      ..applyId(state.config);
    emit(AppConfigState.loaded(config: newConfig));
    repo.update(newConfig);
  }

  Future<void> changeAutoSyncDuration(int seconds) async {
    final newConfig = state.config.copyWith(autoSyncInterval: seconds)
      ..applyId(state.config);
    emit(state.copyWith(config: newConfig));
    repo.update(newConfig);
  }

  Future<void> changeDontCopyOver(int size) async {
    final newConfig = state.config.copyWith(dontCopyOver: size)
      ..applyId(state.config);
    emit(state.copyWith(config: newConfig));
    repo.update(newConfig);
  }

  Future<void> changeDontUploadOver(int size) async {
    final newConfig = state.config.copyWith(dontUploadOver: size)
      ..applyId(state.config);
    emit(state.copyWith(config: newConfig));
    repo.update(newConfig);
  }

  Future<void> changeThemeMode(ThemeMode mode) async {
    final newConfig = state.config.copyWith(themeMode: mode)
      ..applyId(state.config);
    emit(state.copyWith(config: newConfig));
    repo.update(newConfig);
  }

  Future<void> changeSync(bool value) async {
    final newConfig = state.config.copyWith(enableSync: value)
      ..applyId(state.config);
    emit(state.copyWith(config: newConfig));
    repo.update(newConfig);
  }

  Future<void> changeFileSync(bool value) async {
    final newConfig = state.config.copyWith(enableFileSync: value)
      ..applyId(state.config);
    emit(state.copyWith(config: newConfig));
    repo.update(newConfig);
  }
}
