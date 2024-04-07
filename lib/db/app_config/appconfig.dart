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
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
}
