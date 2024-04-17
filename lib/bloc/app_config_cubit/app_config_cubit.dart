import 'package:bloc/bloc.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/data/repositories/app_config.dart';
import 'package:clipboard/db/app_config/appconfig.dart';
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
