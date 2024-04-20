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
  AppConfigCubit(this.repo) : super(const AppConfigState.initial());

  Future<void> load() async {
    emit(const AppConfigState.initial());
    final appConfig = await repo.get();

    emit(appConfig.fold(
      (l) => AppConfigState.error(failure: l),
      (r) => AppConfigState.loaded(config: r),
    ));
  }

  bool get isCopyingPaused => state.maybeWhen(
        loaded: (config) =>
            config.pausedTill != null && config.pausedTill!.isAfter(now()),
        orElse: () => true,
      );

  bool canUploadFile(int size) => state.maybeWhen(
        loaded: (config) => config.dontUploadOver >= size,
        orElse: () => false,
      );

  bool canCopyFile(int size) => state.maybeWhen(
        loaded: (config) => config.dontCopyOver >= size,
        orElse: () => false,
      );

  bool get isSyncEnabled => state.maybeWhen(
        loaded: (config) => config.enableSync,
        orElse: () => false,
      );

  bool get isFileSyncEnabled => state.maybeWhen(
        loaded: (config) => config.enableSync && config.enableFileSync,
        orElse: () => false,
      );

  Future<void> changePausedTill(DateTime? pausedTill) async {
    state.whenOrNull(loaded: (config) {
      final newConfig = config.copyWith(pausedTill: pausedTill)
        ..applyId(config);
      emit(AppConfigState.loaded(config: newConfig));
      repo.update(newConfig);
    });
  }

  Future<void> changeDontCopyOver(int size) async {
    state.whenOrNull(loaded: (config) {
      final newConfig = config.copyWith(dontCopyOver: size)..applyId(config);
      emit(AppConfigState.loaded(config: newConfig));
      repo.update(newConfig);
    });
  }

  Future<void> changeDontUploadOver(int size) async {
    state.whenOrNull(loaded: (config) {
      final newConfig = config.copyWith(dontUploadOver: size)..applyId(config);
      emit(AppConfigState.loaded(config: newConfig));
      repo.update(newConfig);
    });
  }

  Future<void> changeThemeMode(ThemeMode mode) async {
    state.whenOrNull(loaded: (config) {
      final newConfig = config.copyWith(themeMode: mode)..applyId(config);
      emit(AppConfigState.loaded(config: newConfig));
      repo.update(newConfig);
    });
  }

  Future<void> changeSync(bool value) async {
    state.whenOrNull(loaded: (config) {
      final newConfig = config.copyWith(enableSync: value)..applyId(config);
      emit(AppConfigState.loaded(config: newConfig));
      repo.update(newConfig);
    });
  }

  Future<void> changeFileSync(bool value) async {
    state.whenOrNull(loaded: (config) {
      final newConfig = config.copyWith(enableFileSync: value)..applyId(config);
      emit(AppConfigState.loaded(config: newConfig));
      repo.update(newConfig);
    });
  }
}
