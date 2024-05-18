import 'dart:convert' show jsonDecode;

import 'package:clipboard/constants/numbers/duration.dart';
import 'package:clipboard/constants/numbers/file_sizes.dart';
import 'package:clipboard/db/base.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:isar/isar.dart';

part 'appconfig.freezed.dart';
part 'appconfig.g.dart';

@freezed
@Collection(ignore: {"copyWith"})
class AppConfig with _$AppConfig, IsarIdMixin {
  AppConfig._();

  factory AppConfig({
    @Default(ThemeMode.system) @Enumerated(EnumType.name) ThemeMode themeMode,
    @Default(true) bool enableSync,
    @Default(true) bool enableFileSync,

    /// will prevent auto upload for files over 10 MB
    @Default($10MB) int dontUploadOver,

    /// will prevent auto copy for files over 10 MB
    @Default($10MB) int dontCopyOver,

    /// Pause auto copy for till pausedTill is reached.
    DateTime? pausedTill,

    // Auto Sync Interval
    @Default($90S) int autoSyncInterval,

    // System show/hide toggle hotkey
    String? toggleHotkey,

    /// If enabled, the primary action on clips will be smartly selected.
    /// The primary action will be paste, which will directly paste the clip
    /// to the last focused cursor in the last window, and the clipboard will minimize.
    @Default(false) bool smartPaste,

    /// If enabled, the application will automatically start at startup.
    @Default(false) bool launchAtStartup,

    //? Local App States
    /// last focus window id
    @ignore
    @JsonKey(includeFromJson: false, includeToJson: false)
    int? lastFocusedWindowId,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  @ignore
  HotKey? get getToggleHotkey =>
      toggleHotkey != null ? HotKey.fromJson(jsonDecode(toggleHotkey!)) : null;
}
