import 'dart:convert' show jsonEncode;

import 'package:bloc/bloc.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/common/logging.dart';
import 'package:copycat_base/constants/numbers/duration.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/db/subscription/subscription.dart';
import 'package:copycat_base/domain/repositories/app_config.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:ntp/ntp.dart';

part 'app_config_cubit.freezed.dart';
part 'app_config_state.dart';

@singleton
class AppConfigCubit extends Cubit<AppConfigState> {
  final AppConfigRepository repo;
  AppConfigCubit(this.repo)
      : super(
          AppConfigState.loaded(
            isLoading: true,
            config: AppConfig(),
          ),
        );

  @override
  void emit(AppConfigState state) {
    if (isClosed) return;
    super.emit(state);
  }

  Future<bool?> syncClocks() async {
    try {
      final currentInternetTime = await NTP.now();
      final currentTime = DateTime.now();

      final notInSameMoment =
          currentInternetTime.difference(currentTime).inSeconds.abs() > 2;
      if (notInSameMoment) {
        emit(
          state.copyWith(
            config: state.config.copyWith(clockUnSynced: true)
              ..applyId(state.config),
          ),
        );
        return false;
      } else {
        emit(
          state.copyWith(
            config: state.config.copyWith(clockUnSynced: false)
              ..applyId(state.config),
          ),
        );
      }
      return true;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<void> reset() async {
    setE2EEKey(null);
    changeAutoSyncDuration($60S);
  }

  (AppConfig, bool) applyForSubscription(
    AppConfig config,
    Subscription subscription,
  ) {
    if (subscription.isFree || !subscription.isActive) {
      config = config.copyWith(
        autoSyncInterval: $45S,
        autoEncrypt: false,
      )..applyId(config);
      return (config, true);
    }
    return (config, false);
  }

  Future<void> load([Subscription? subscription]) async {
    emit(state.copyWith(isLoading: true));
    final appConfig = await repo.get();

    await appConfig.fold(
      (l) async => emit(state.copyWith(failure: l, isLoading: false)),
      (r) async {
        if (subscription != null) {
          final (config, changed) = applyForSubscription(r, subscription);
          if (changed) {
            emit(state.copyWith(config: config, isLoading: false));
            await repo.update(config);
          } else {
            emit(state.copyWith(config: r, isLoading: false));
          }
        } else {
          emit(state.copyWith(config: r, isLoading: false));
        }
      },
    );
  }

  bool get isCopyingPaused =>
      state.config.pausedTill != null &&
      state.config.pausedTill!.isAfter(now());

  bool canUploadFile(int size) => state.config.dontUploadOver >= size;

  bool canCopyFile(int size) => state.config.dontCopyOver >= size;

  bool get isSyncEnabled =>
      !state.config.clockUnSynced && state.config.enableSync;

  bool get isEncryptionEnabled => state.config.autoEncrypt;
  bool get isE2EESetupDone => state.config.enc2 != null;

  bool get isFileSyncEnabled =>
      state.config.enableSync && state.config.enableFileSync;

  Future<void> changePausedTill(DateTime? pausedTill) async {
    final newConfig = state.config.copyWith(pausedTill: pausedTill)
      ..applyId(state.config);
    emit(AppConfigState.loaded(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> setClipboardToggleHotkey(HotKey? key) async {
    final newConfig = state.config
        .copyWith(toggleHotkey: key != null ? jsonEncode(key.toJson()) : null)
      ..applyId(state.config);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> setE2EEKey(String? key) async {
    final newConfig = state.config.copyWith(enc2: key)..applyId(state.config);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> changeAutoSyncDuration(int seconds) async {
    final newConfig = state.config.copyWith(autoSyncInterval: seconds)
      ..applyId(state.config);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> changeDontCopyOver(int size) async {
    final newConfig = state.config.copyWith(dontCopyOver: size)
      ..applyId(state.config);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> changeDontUploadOver(int size) async {
    final newConfig = state.config.copyWith(dontUploadOver: size)
      ..applyId(state.config);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> changeLocale(String locale) async {
    final newConfig = state.config.copyWith(locale: locale)
      ..applyId(state.config);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> changeThemeMode(ThemeMode mode) async {
    final newConfig = state.config.copyWith(themeMode: mode)
      ..applyId(state.config);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> changeSync(bool value) async {
    final newConfig = state.config.copyWith(enableSync: value)
      ..applyId(state.config);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> toggleSmartPaste(bool value) async {
    final newConfig = state.config.copyWith(smartPaste: value)
      ..applyId(state.config);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> toggleAutoEncrypt(bool value) async {
    final newConfig = state.config.copyWith(autoEncrypt: value)
      ..applyId(state.config);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> changeFileSync(bool value) async {
    final newConfig = state.config.copyWith(enableFileSync: value)
      ..applyId(state.config);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> setLaunchAtStartup(bool value) async {
    bool launchAtStartup_ = false;
    try {
      if (value) {
        await launchAtStartup.enable();
        launchAtStartup_ = true;
      } else {
        await launchAtStartup.disable();
        launchAtStartup_ = false;
      }
    } catch (e) {
      logger.e(e);
    }
    final newConfig = state.config.copyWith(launchAtStartup: launchAtStartup_)
      ..applyId(state.config);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  // ? Non persistent states
  void setLastFocusedWindowId(int? value) {
    final newConfig = state.config.copyWith(lastFocusedWindowId: value)
      ..applyId(state.config);
    emit(state.copyWith(config: newConfig));
  }
}
