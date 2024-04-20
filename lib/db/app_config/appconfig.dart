import 'package:clipboard/constants/numbers/file_sizes.dart';
import 'package:clipboard/db/base.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
}
