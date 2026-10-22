import 'dart:async';
import 'dart:convert' show jsonEncode;
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:clipboard/base/data/services/encryption.dart';
import 'package:clipboard/base/domain/model/app_config/appconfig.dart';
import 'package:clipboard/base/domain/model/exclusion_rules/exclusion_checker.dart';
import 'package:clipboard/base/domain/model/exclusion_rules/exclusion_result.dart';
import 'package:clipboard/base/domain/model/exclusion_rules/exclusion_rules.dart';
import 'package:clipboard/base/domain/model/subscription/subscription.dart';
import 'package:clipboard/base/domain/repositories/app_config.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/base/domain/sources/clipboard.dart';
import 'package:clipboard/base/enums/sort.dart';
import 'package:flutter/material.dart';
import 'package:focus_window/focus_window.dart';
import 'package:focus_window/platform/activity_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:no_screenshot/no_screenshot.dart';
import 'package:ntp/ntp.dart';
import 'package:retry/retry.dart';
import 'package:clipboard/common/secure_store.dart';
import 'package:universal_io/io.dart';
import 'package:android_background_clipboard/android_background_clipboard.dart';
import 'package:clipboard/base/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/base/data/services/lan_sync_service.dart';
import 'package:clipboard/di/di.dart';

part 'app_config_cubit.freezed.dart';
part 'app_config_state.dart';
part 'app_config_cubit_e2ee_mixin.dart';

ExclusionChecker? exclusionChecker;
DateTime? currentInternetTime;

@singleton
class AppConfigCubit extends Cubit<AppConfigState> with AppConfigE2EEMixin {
  ActivityInfo? lastActivity;
  @override
  final AppConfigRepository repo;
  final FocusWindow focusWindow = FocusWindow();

  final Completer<void> loaded = Completer();

  AppConfigCubit(this.repo)
    : super(AppConfigState.loaded(isLoading: true, config: AppConfig())) {
    load();
  }

  @override
  void emit(AppConfigState state) {
    if (isClosed) return;
    super.emit(state);
  }

  void initializeExclusionChecker() {
    if (exclusionRules.enable && isDesktopPlatform) {
      exclusionChecker = ExclusionChecker(exclusionRules);
    } else {
      exclusionChecker = null;
    }
  }

  /// Returns `true` if the clock is synced, `false` if the clock is detectably
  /// off, or `null` if all NTP servers were unreachable (can't determine).
  Future<bool?> syncClocks() async {
    try {
      final timeServers = [
        'time.google.com',
        'pool.ntp.org',
        'time.apple.com',
        'time.windows.com',
        'time.cloudflare.com',
        'time.facebook.com',
      ];

      await retry(
        () async {
          String timeServer =
              timeServers[Random().nextInt(
                timeServers.length,
              )]; // Randomly select a time server

          currentInternetTime = await NTP
              .now(lookUpAddress: timeServer)
              .timeout(const Duration(seconds: 6));
          final now_ = DateTime.now();
          systemToInternetTimeOffset = currentInternetTime!.difference(now_);

          logger.d(
            'Current Internet Time: $currentInternetTime, System Time: $now_, '
            'Difference: ${systemToInternetTimeOffset!.inSeconds} seconds',
          );
        },
        retryIf: (e) => e is SocketException || e is TimeoutException,
        maxAttempts: 3,
        onRetry: (e) => logger.w('Retrying NTP fetch due to $e'),
      );

      final currentTime = systemTime();

      final notInSameMoment =
          currentInternetTime!.difference(currentTime).inSeconds.abs() > 5;

      if (notInSameMoment) {
        emit(
          state.copyWith(config: state.config.copyWith(clockUnSynced: true)),
        );
        return false;
      } else {
        emit(
          state.copyWith(config: state.config.copyWith(clockUnSynced: false)),
        );
      }
      return true;
    } catch (e) {
      // NTP servers were unreachable — cannot determine clock accuracy.
      // Do not mark the clock as unsynced; return null so callers skip the dialog.
      logger.w('NTP unreachable, skipping clock check: $e');
      return null;
    }
  }

  Future<void> reset() async {
    await _secureStorage.deleteAll();
    await _clearStoredE2EEKey();
    _hasStoredE2EEKey = false;
    _keychainReadFailed = false;
    final config = AppConfig(
      id: 1,
      onBoardComplete: false,
      syncSpeed: SyncSpeed.balanced,
      enc2: null,
      exclusionRules: defaultExclusionRules,
    );
    emit(AppConfigState.loaded(config: config));
    await repo.update(config);
  }

  (AppConfig, bool) applyForSubscription(
    AppConfig config,
    Subscription subscription,
  ) {
    final hasProSync = subscription.isActive && !subscription.isFree;

    final nextConfig = hasProSync
        ? config.copyWith(
            syncSpeed: SyncSpeed.realtime,
            enableTypeToSearch: true,
            lanInstantSync: true,
          )
        : config.copyWith(
            syncSpeed: SyncSpeed.balanced,
            enableDragNDrop: false,
            enableTypeToSearch: false,
            lanInstantSync: false,
            autoWriteOnReceive: false,
            quickPasteHotkey: null,
            richDataCapture: false,
          );
    return (nextConfig, nextConfig != config);
  }

  Future<AppConfigState> load([Subscription? subscription]) async {
    emit(state.copyWith(isLoading: true));
    final appConfig = await repo.get();

    final next = await appConfig.fold(
      (l) async {
        final newState = state.copyWith(failure: l, isLoading: false);
        emit(newState);
        return newState;
      },
      (r) async {
        if (subscription != null) {
          final (config, changed) = applyForSubscription(r, subscription);
          if (changed) {
            final newState = state.copyWith(config: config, isLoading: false);
            emit(newState);
            await repo.update(config);
            return newState;
          } else {
            final newState = state.copyWith(config: r, isLoading: false);
            emit(newState);
            return newState;
          }
        } else {
          final newState = state.copyWith(config: r, isLoading: false);
          emit(newState);
          return newState;
        }
      },
    );
    initializeExclusionChecker();
    await _migrateLegacyEnc2ToSecureStorage(next.config);
    await _refreshE2EEKeyPresence();
    if (Platform.isAndroid) {
      _syncLanConfigToAndroid(next.config);
    } else if (!Platform.isIOS) {
      _initLanSyncService(next.config);
    }
    await _applyScreenCaptureProtection(next.config.hideFromScreenCapture);

    if (!loaded.isCompleted) {
      loaded.complete();
    }
    return next;
  }

  Future<void> _applyScreenCaptureProtection(bool enabled) async {
    try {
      final noScreenshot = NoScreenshot.instance;
      if (enabled) {
        await noScreenshot.screenshotOff();
      } else {
        await noScreenshot.screenshotOn();
      }
    } catch (e) {
      logger.e('Failed to apply screen capture protection: $e');
    }
  }

  void _initLanSyncService(AppConfig config) {
    final lanSync = sl<LanSyncService>();
    lanSync.lanSyncEnabled = config.lanInstantSync;
    lanSync.deviceId = sl<String>(instanceName: "device_id");
    lanSync.userId = sl<AuthCubit>().userId ?? '';
    unawaited(lanSync.reconfigure());
  }

  /// Writes LAN config to Android SharedPreferences so the background service
  /// can read it via its [OnSharedPreferenceChangeListener].
  void _syncLanConfigToAndroid(AppConfig config) {
    final plugin = sl<AndroidBackgroundClipboard>();
    plugin.writeShared('lanInstantSync', config.lanInstantSync);
    plugin.writeShared('autoWriteOnReceive', config.autoWriteOnReceive);
    plugin.writeShared('dontCopyOver', config.dontCopyOver);
    plugin.writeShared(
      'clipboardFeedbackMode',
      config.clipboardFeedbackMode.name,
    );
  }

  bool get isCopyingPaused =>
      state.config.pausedTill != null &&
      state.config.pausedTill!.isAfter(systemTime());

  bool canUploadFile(int size) {
    return state.config.dontUploadOver >= size;
  }

  bool canCopyFile(int size) {
    return state.config.dontCopyOver >= size;
  }

  bool get isSyncEnabled =>
      !state.config.clockUnSynced && state.config.enableSync;

  bool get isEncryptionEnabled => state.config.autoEncrypt;

  bool get isPinned => state.config.pinned;

  bool get isFileSyncEnabled =>
      state.config.enableSync && state.config.enableFileSync;

  ExclusionRules get exclusionRules => state.config.copyExclusionRules;

  Future<void> changePausedTill(DateTime? pausedTill) async {
    final newConfig = state.config.copyWith(pausedTill: pausedTill);
    emit(AppConfigState.loaded(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> changeAppLayout(AppLayout layout) async {
    final newConfig = state.config.copyWith(layout: layout);
    emit(AppConfigState.loaded(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> changeAppView(AppView view) async {
    final newConfig = state.config.copyWith(view: view);
    emit(AppConfigState.loaded(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> setPinned(bool pinned) async {
    final newConfig = state.config.copyWith(pinned: pinned);
    emit(AppConfigState.loaded(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> togglePinned() async {
    final newConfig = state.config.copyWith(pinned: !state.config.pinned);
    emit(AppConfigState.loaded(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> showCollectionTip(final bool value) async {
    final newConfig = state.config.copyWith(showCollectionTip: value);
    emit(AppConfigState.loaded(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> changeWindowSize({double? width, double? height}) async {
    final config = state.config;
    final newConfig = config.copyWith(
      windowWidth: width ?? config.windowWidth,
      windowHeight: height ?? config.windowHeight,
    );
    emit(AppConfigState.loaded(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> setClipboardToggleHotkey(HotKey? key) async {
    final newConfig = state.config.copyWith(
      toggleHotkey: key != null ? jsonEncode(key.toJson()) : null,
    );
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> setQuickPasteHotkey(HotKey? key) async {
    final newConfig = state.config.copyWith(
      quickPasteHotkey: key != null ? jsonEncode(key.toJson()) : null,
    );
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> setPasteStackHotkey(HotKey? key) async {
    final newConfig = state.config.copyWith(
      pasteStackHotkey: key != null ? jsonEncode(key.toJson()) : null,
    );
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> setThemeColor(Color color) async {
    final newConfig = state.config.copyWith(themeColor: color.toARGB32());
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> setSortConfig({
    ClipboardSortKey? sortBy,
    SortOrder? sortOrder,
  }) async {
    final newConfig = state.config.copyWith(
      sortBy: sortBy ?? state.config.sortBy,
      sortOrder: sortOrder ?? state.config.sortOrder,
    );
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> setThemeColorVariant(DynamicSchemeVariant? variant) async {
    if (variant == null) return;
    final newConfig = state.config.copyWith(themeVariant: variant);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> changeSyncMode(SyncSpeed? speed) async {
    if (speed == null) return;
    final newConfig = state.config.copyWith(syncSpeed: speed);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> changeDontCopyOver(int? size) async {
    if (size == null) return;
    final newConfig = state.config.copyWith(dontCopyOver: size);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> changeDontUploadOver(int? size) async {
    if (size == null) return;
    final newConfig = state.config.copyWith(dontUploadOver: size);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> changeLocale(String locale) async {
    final newConfig = state.config.copyWith(locale: locale);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> setClipboardFeedbackMode(ClipboardFeedbackMode? mode) async {
    if (mode == null) return;
    final newConfig = state.config.copyWith(clipboardFeedbackMode: mode);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
    if (Platform.isAndroid) {
      await sl<AndroidBackgroundClipboard>().writeShared(
        'clipboardFeedbackMode',
        mode.name,
      );
    }
  }

  Future<void> changeThemeMode(ThemeMode? mode) async {
    if (mode == null) return;
    final newConfig = state.config.copyWith(themeMode: mode);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> changeSync(bool value) async {
    final newConfig = state.config.copyWith(enableSync: value);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
    if (Platform.isAndroid) {
      final effectiveSyncEnabled =
          !newConfig.clockUnSynced && newConfig.enableSync;
      await sl<AndroidBackgroundClipboard>().writeShared(
        'syncEnabled',
        effectiveSyncEnabled,
      );
    }
  }

  Future<void> toggleRichDataCapture(bool value) async {
    final newConfig = state.config.copyWith(richDataCapture: value);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> toggleSmartPaste(bool value) async {
    final newConfig = state.config.copyWith(smartPaste: value);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> toggleKeepWindowOpenOnUnfocus(bool value) async {
    final newConfig = state.config.copyWith(keepWindowOpenOnUnfocus: value);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> toggleTransformAsNewClip(bool value) async {
    final newConfig = state.config.copyWith(transformAsNewClip: value);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> toggleTypeToSearch(bool value) async {
    final newConfig = state.config.copyWith(enableTypeToSearch: value);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> toggleDragNDrop(bool value) async {
    final newConfig = state.config.copyWith(enableDragNDrop: value);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> toggleAndroidBgListener(bool value) async {
    final newConfig = state.config.copyWith(androidBgListener: value);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> toggleAutoEncrypt(bool value) async {
    final newConfig = state.config.copyWith(autoEncrypt: value);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> toggleUseEncryptionNonce(bool value) async {
    final newConfig = state.config.copyWith(useEncryptionNonce: value);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> toggleHideFromScreenCapture(bool value) async {
    final newConfig = state.config.copyWith(hideFromScreenCapture: value);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
    await _applyScreenCaptureProtection(value);
  }

  Future<void> toggleLocalAuth(bool value) async {
    final newConfig = state.config.copyWith(enableLocalAuth: value);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> setLocalAuthTimeout(int minutes) async {
    final newConfig = state.config.copyWith(localAuthTimeoutMinutes: minutes);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> changeOnBoardStatus(bool value) async {
    final newConfig = state.config.copyWith(
      onBoardComplete: value,
      searchIndexReady: value == true,
    );
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> changeFileSync(bool value) async {
    final newConfig = state.config.copyWith(enableFileSync: value);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> changeActiveStorageProvider(
    ActiveCloudStorageProvider value,
  ) async {
    final newConfig = state.config.copyWith(activeStorageProvider: value);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> toggleTrayIcon(bool value) async {
    final newConfig = state.config.copyWith(showTrayIcon: value);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  Future<void> setSearchIndexingStatus(bool value) async {
    final newConfig = state.config.copyWith(searchIndexReady: value);
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
    final newConfig = state.config.copyWith(launchAtStartup: launchAtStartup_);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
  }

  // ? Non persistent states
  void setLastFocusedWindowId(int? value) {
    final newConfig = state.config.copyWith(lastFocusedWindowId: value);
    emit(state.copyWith(config: newConfig));
  }

  Future<void> updateExclusionRule(ExclusionRules exclusionRule) async {
    final newConfig = state.config.copyWith(exclusionRules: exclusionRule);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
    initializeExclusionChecker();
  }

  Future<ExclusionCheckResult> checkActivityExclusion() async {
    if (isMobilePlatform) return const ExclusionCheckResult.allowed();
    try {
      final activity = await focusWindow.getActivity().timeout(
        const Duration(seconds: 5),
      );
      logger.d(() => activity);
      lastActivity = activity;
      final result =
          exclusionChecker?.checkActivity(activity) ??
          const ExclusionCheckResult.allowed();
      return result;
    } on TimeoutException {
      lastActivity = null;
      return const ExclusionCheckResult.allowed();
    } catch (e) {
      lastActivity = null;
      return const ExclusionCheckResult.allowed();
    }
  }

  Future<bool> isCopyingAllowedByActivity() async {
    final result = await checkActivityExclusion();
    return result.isAllowed;
  }

  Future<bool> confirmAccessibilityPermission() async {
    if (Platform.isAndroid) return true;
    final granted = await focusWindow.isAccessibilityPermissionGranted();
    if (!granted) {
      await focusWindow.openAccessibilityPermissionSetting();
      return false;
    }
    return true;
  }

  Future<void> toggleLanInstantSync(bool value) async {
    final newConfig = state.config.copyWith(lanInstantSync: value);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
    if (Platform.isAndroid) {
      sl<AndroidBackgroundClipboard>().writeShared('lanInstantSync', value);
    } else {
      sl<LanSyncService>().reconfigure(enabled: value);
    }
  }

  Future<void> toggleAutoWriteOnReceive(bool value) async {
    final newConfig = state.config.copyWith(autoWriteOnReceive: value);
    emit(state.copyWith(config: newConfig));
    await repo.update(newConfig);
    if (Platform.isAndroid) {
      sl<AndroidBackgroundClipboard>().writeShared('autoWriteOnReceive', value);
    }
    // Desktop: OfflinePersistenceCubit reads appConfig.state directly — no push needed.
  }
}
