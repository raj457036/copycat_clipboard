// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appconfig.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return _AppConfig.fromJson(json);
}

/// @nodoc
mixin _$AppConfig {
  @Enumerated(EnumType.name)
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  bool get enableSync => throw _privateConstructorUsedError;
  bool get enableFileSync => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppConfigCopyWith<AppConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigCopyWith<$Res> {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) then) =
      _$AppConfigCopyWithImpl<$Res, AppConfig>;
  @useResult
  $Res call(
      {@Enumerated(EnumType.name) ThemeMode themeMode,
      bool enableSync,
      bool enableFileSync});
}

/// @nodoc
class _$AppConfigCopyWithImpl<$Res, $Val extends AppConfig>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? enableSync = null,
    Object? enableFileSync = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      enableSync: null == enableSync
          ? _value.enableSync
          : enableSync // ignore: cast_nullable_to_non_nullable
              as bool,
      enableFileSync: null == enableFileSync
          ? _value.enableFileSync
          : enableFileSync // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppConfigImplCopyWith<$Res>
    implements $AppConfigCopyWith<$Res> {
  factory _$$AppConfigImplCopyWith(
          _$AppConfigImpl value, $Res Function(_$AppConfigImpl) then) =
      __$$AppConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Enumerated(EnumType.name) ThemeMode themeMode,
      bool enableSync,
      bool enableFileSync});
}

/// @nodoc
class __$$AppConfigImplCopyWithImpl<$Res>
    extends _$AppConfigCopyWithImpl<$Res, _$AppConfigImpl>
    implements _$$AppConfigImplCopyWith<$Res> {
  __$$AppConfigImplCopyWithImpl(
      _$AppConfigImpl _value, $Res Function(_$AppConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? enableSync = null,
    Object? enableFileSync = null,
  }) {
    return _then(_$AppConfigImpl(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      enableSync: null == enableSync
          ? _value.enableSync
          : enableSync // ignore: cast_nullable_to_non_nullable
              as bool,
      enableFileSync: null == enableFileSync
          ? _value.enableFileSync
          : enableFileSync // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppConfigImpl extends _AppConfig {
  _$AppConfigImpl(
      {@Enumerated(EnumType.name) this.themeMode = ThemeMode.system,
      this.enableSync = true,
      this.enableFileSync = true})
      : super._();

  factory _$AppConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigImplFromJson(json);

  @override
  @JsonKey()
  @Enumerated(EnumType.name)
  final ThemeMode themeMode;
  @override
  @JsonKey()
  final bool enableSync;
  @override
  @JsonKey()
  final bool enableFileSync;

  @override
  String toString() {
    return 'AppConfig(themeMode: $themeMode, enableSync: $enableSync, enableFileSync: $enableFileSync)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.enableSync, enableSync) ||
                other.enableSync == enableSync) &&
            (identical(other.enableFileSync, enableFileSync) ||
                other.enableFileSync == enableFileSync));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, themeMode, enableSync, enableFileSync);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      __$$AppConfigImplCopyWithImpl<_$AppConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigImplToJson(
      this,
    );
  }
}

abstract class _AppConfig extends AppConfig {
  factory _AppConfig(
      {@Enumerated(EnumType.name) final ThemeMode themeMode,
      final bool enableSync,
      final bool enableFileSync}) = _$AppConfigImpl;
  _AppConfig._() : super._();

  factory _AppConfig.fromJson(Map<String, dynamic> json) =
      _$AppConfigImpl.fromJson;

  @override
  @Enumerated(EnumType.name)
  ThemeMode get themeMode;
  @override
  bool get enableSync;
  @override
  bool get enableFileSync;
  @override
  @JsonKey(ignore: true)
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
