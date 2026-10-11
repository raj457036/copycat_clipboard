import 'dart:convert' show jsonDecode;
import 'package:clipboard/base/constants/numbers/file_sizes.dart';
import 'package:clipboard/base/constants/widget_styles.dart';
import 'package:clipboard/base/domain/model/base.dart';
import 'package:clipboard/base/domain/model/exclusion_rules/exclusion_rules.dart';
import 'package:clipboard/base/domain/sources/clipboard.dart';
import 'package:clipboard/base/enums/sort.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hotkey_manager/hotkey_manager.dart';

part 'appconfig.freezed.dart';
part 'appconfig.g.dart';

const int defaultThemeColor = 0xFF322C57;

enum AppLayout { grid, list }

enum SyncSpeed { balanced, realtime }

enum AppView { topDocked, bottomDocked, leftDocked, rightDocked, windowed }

enum ClipboardFeedbackMode {
  disabled,
  copyOnly,
  syncOnly,
  copyAndSync,
  @Deprecated('Use copyAndSync instead')
  toast,
}

ClipboardFeedbackMode _feedbackModeFromJson(Object? value) {
  if (value == null) return ClipboardFeedbackMode.copyAndSync;
  final String str = value.toString();
  if (str == 'toast') return ClipboardFeedbackMode.copyAndSync;
  return ClipboardFeedbackMode.values.firstWhere(
    (ClipboardFeedbackMode e) => e.name == str,
    orElse: () => ClipboardFeedbackMode.copyAndSync,
  );
}

String _feedbackModeToJson(ClipboardFeedbackMode mode) {
  if (mode == ClipboardFeedbackMode.toast) {
    return ClipboardFeedbackMode.copyAndSync.name;
  }
  return mode.name;
}

enum ActiveCloudStorageProvider { googleDrive, webdav }

@freezed
abstract class AppConfig with _$AppConfig, Identifiable {
  AppConfig._();

  factory AppConfig({
    @JsonKey(includeToJson: false, includeFromJson: false) int? id,
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(true) bool enableSync,
    @Default(true) bool enableFileSync,
    @Default(ActiveCloudStorageProvider.googleDrive)
    ActiveCloudStorageProvider activeStorageProvider,
    @Default(AppLayout.grid) AppLayout layout,
    @Default(AppView.windowed) AppView view,
    @Default(false) bool pinned,
    @Default(initialWindowWidth) double windowWidth,
    @Default(initialWindowHeight) double windowHeight,

    // Sorting settings
    @Default(ClipboardSortKey.modified) ClipboardSortKey sortBy,
    @Default(SortOrder.desc) SortOrder sortOrder,

    /// will prevent auto upload for files over 10 MB
    @Default($10MB) int dontUploadOver,

    /// will prevent auto copy for files over 10 MB
    @Default($10MB) int dontCopyOver,

    /// Pause auto copy for till pausedTill is reached.
    DateTime? pausedTill,

    // Auto Sync Interval
    @Default(SyncSpeed.balanced) SyncSpeed syncSpeed,

    // System show/hide toggle hotkey
    String? toggleHotkey,

    // Quick paste popup hotkey
    String? quickPasteHotkey,

    // Paste stack toggle hotkey
    String? pasteStackHotkey,

    /// If enabled, the primary action on clips will be smartly selected.
    /// The primary action will be paste, which will directly paste the clip
    /// to the last focused cursor in the last window, and the clipboard will minimize.
    @Default(false) bool smartPaste,

    /// If enabled, losing focus keeps the window open in the background
    /// instead of hiding it automatically.
    @Default(true) bool keepWindowOpenOnUnfocus,

    /// If enabled, transformed clips will be saved as new clips instead of
    /// being copied/pasted immediately.
    @Default(false) bool transformAsNewClip,

    /// Controls the feedback shown when a clip is captured or received.
    @JsonKey(
      fromJson: _feedbackModeFromJson,
      toJson: _feedbackModeToJson,
    )
    @Default(ClipboardFeedbackMode.copyAndSync)
    ClipboardFeedbackMode clipboardFeedbackMode,

    /// If enabled, search runs while the user types in the search box.
    @Default(false) bool enableTypeToSearch,

    /// If enabled, the application will automatically start at startup.
    @Default(false) bool launchAtStartup,
    @Default("en") String locale,

    // Security
    String? enc2,
    @Default(false) bool autoEncrypt,
    @Default(false) bool useEncryptionNonce,
    @Default(true) bool hideFromScreenCapture,
    @JsonKey(includeFromJson: false, includeToJson: false)
    ExclusionRules? exclusionRules,

    // App Lock
    @Default(false) bool enableLocalAuth,
    @Default(1) int localAuthTimeoutMinutes,

    // Customization
    @Default(defaultThemeColor) int themeColor,
    @Default(DynamicSchemeVariant.tonalSpot) DynamicSchemeVariant themeVariant,

    // Flags
    @Default(true) bool showCollectionTip,
    @Default(false) bool searchIndexReady,

    // Exprimental
    @Default(false) bool enableDragNDrop,
    @Default(false) bool enablePasteStack,
    @Default(false) bool androidBgListener,
    @Default(false) bool richDataCapture,

    // LAN Instant Sync
    @Default(false) bool lanInstantSync,
    @Default(false) bool autoWriteOnReceive,

    // Desktop UI
    @Default(true) bool showTrayIcon,

    // on boarding
    @Default(true)
    bool onBoardComplete, // On logout/unauth this will be set to true
    // In-App Review tracking
    @Default(0) int reviewQualifyingEventCount,
    DateTime? lastReviewPromptDate,
    @Default(false) bool reviewNeverAsk,

    //? Local App States
    /// last focus window id
    @JsonKey(includeFromJson: false, includeToJson: false)
    int? lastFocusedWindowId,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool clockUnSynced,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  Size get windowSize {
    final width = windowWidth.isNaN || windowWidth.isNegative
        ? initialWindowWidth
        : windowWidth;
    final height = windowHeight.isNaN || windowHeight.isNegative
        ? initialWindowHeight
        : windowHeight;
    return Size(width, height);
  }

  ExclusionRules get copyExclusionRules =>
      exclusionRules ?? defaultExclusionRules;

  HotKey? get getToggleHotkey =>
      toggleHotkey != null ? HotKey.fromJson(jsonDecode(toggleHotkey!)) : null;

  HotKey? get getQuickPasteHotkey => quickPasteHotkey != null
      ? HotKey.fromJson(jsonDecode(quickPasteHotkey!))
      : null;

  HotKey? get getPasteStackHotkey => pasteStackHotkey != null
      ? HotKey.fromJson(jsonDecode(pasteStackHotkey!))
      : null;

  ColorScheme get lightThemeColorScheme {
    return ColorScheme.fromSeed(
      seedColor: Color(themeColor.isNegative ? defaultThemeColor : themeColor),
      dynamicSchemeVariant: themeVariant,
    );
  }

  ColorScheme get darkThemeColorScheme {
    return ColorScheme.fromSeed(
      seedColor: Color(themeColor.isNegative ? defaultThemeColor : themeColor),
      brightness: Brightness.dark,
      dynamicSchemeVariant: themeVariant,
    );
  }
}
