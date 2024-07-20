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

  /// will prevent auto upload for files over 10 MB
  int get dontUploadOver => throw _privateConstructorUsedError;

  /// will prevent auto copy for files over 10 MB
  int get dontCopyOver => throw _privateConstructorUsedError;

  /// Pause auto copy for till pausedTill is reached.
  DateTime? get pausedTill =>
      throw _privateConstructorUsedError; // Auto Sync Interval
  int get autoSyncInterval =>
      throw _privateConstructorUsedError; // System show/hide toggle hotkey
  String? get toggleHotkey => throw _privateConstructorUsedError;

  /// If enabled, the primary action on clips will be smartly selected.
  /// The primary action will be paste, which will directly paste the clip
  /// to the last focused cursor in the last window, and the clipboard will minimize.
  bool get smartPaste => throw _privateConstructorUsedError;

  /// If enabled, the application will automatically start at startup.
  bool get launchAtStartup => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;
  String? get enc2 => throw _privateConstructorUsedError;
  bool get autoEncrypt =>
      throw _privateConstructorUsedError; //? Local App States
  /// last focus window id
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get lastFocusedWindowId => throw _privateConstructorUsedError;
  @ignore
  bool get clockUnSynced => throw _privateConstructorUsedError;

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
      bool enableFileSync,
      int dontUploadOver,
      int dontCopyOver,
      DateTime? pausedTill,
      int autoSyncInterval,
      String? toggleHotkey,
      bool smartPaste,
      bool launchAtStartup,
      String locale,
      String? enc2,
      bool autoEncrypt,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      int? lastFocusedWindowId,
      @ignore bool clockUnSynced});
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
    Object? dontUploadOver = null,
    Object? dontCopyOver = null,
    Object? pausedTill = freezed,
    Object? autoSyncInterval = null,
    Object? toggleHotkey = freezed,
    Object? smartPaste = null,
    Object? launchAtStartup = null,
    Object? locale = null,
    Object? enc2 = freezed,
    Object? autoEncrypt = null,
    Object? lastFocusedWindowId = freezed,
    Object? clockUnSynced = null,
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
      dontUploadOver: null == dontUploadOver
          ? _value.dontUploadOver
          : dontUploadOver // ignore: cast_nullable_to_non_nullable
              as int,
      dontCopyOver: null == dontCopyOver
          ? _value.dontCopyOver
          : dontCopyOver // ignore: cast_nullable_to_non_nullable
              as int,
      pausedTill: freezed == pausedTill
          ? _value.pausedTill
          : pausedTill // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      autoSyncInterval: null == autoSyncInterval
          ? _value.autoSyncInterval
          : autoSyncInterval // ignore: cast_nullable_to_non_nullable
              as int,
      toggleHotkey: freezed == toggleHotkey
          ? _value.toggleHotkey
          : toggleHotkey // ignore: cast_nullable_to_non_nullable
              as String?,
      smartPaste: null == smartPaste
          ? _value.smartPaste
          : smartPaste // ignore: cast_nullable_to_non_nullable
              as bool,
      launchAtStartup: null == launchAtStartup
          ? _value.launchAtStartup
          : launchAtStartup // ignore: cast_nullable_to_non_nullable
              as bool,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      enc2: freezed == enc2
          ? _value.enc2
          : enc2 // ignore: cast_nullable_to_non_nullable
              as String?,
      autoEncrypt: null == autoEncrypt
          ? _value.autoEncrypt
          : autoEncrypt // ignore: cast_nullable_to_non_nullable
              as bool,
      lastFocusedWindowId: freezed == lastFocusedWindowId
          ? _value.lastFocusedWindowId
          : lastFocusedWindowId // ignore: cast_nullable_to_non_nullable
              as int?,
      clockUnSynced: null == clockUnSynced
          ? _value.clockUnSynced
          : clockUnSynced // ignore: cast_nullable_to_non_nullable
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
      bool enableFileSync,
      int dontUploadOver,
      int dontCopyOver,
      DateTime? pausedTill,
      int autoSyncInterval,
      String? toggleHotkey,
      bool smartPaste,
      bool launchAtStartup,
      String locale,
      String? enc2,
      bool autoEncrypt,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      int? lastFocusedWindowId,
      @ignore bool clockUnSynced});
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
    Object? dontUploadOver = null,
    Object? dontCopyOver = null,
    Object? pausedTill = freezed,
    Object? autoSyncInterval = null,
    Object? toggleHotkey = freezed,
    Object? smartPaste = null,
    Object? launchAtStartup = null,
    Object? locale = null,
    Object? enc2 = freezed,
    Object? autoEncrypt = null,
    Object? lastFocusedWindowId = freezed,
    Object? clockUnSynced = null,
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
      dontUploadOver: null == dontUploadOver
          ? _value.dontUploadOver
          : dontUploadOver // ignore: cast_nullable_to_non_nullable
              as int,
      dontCopyOver: null == dontCopyOver
          ? _value.dontCopyOver
          : dontCopyOver // ignore: cast_nullable_to_non_nullable
              as int,
      pausedTill: freezed == pausedTill
          ? _value.pausedTill
          : pausedTill // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      autoSyncInterval: null == autoSyncInterval
          ? _value.autoSyncInterval
          : autoSyncInterval // ignore: cast_nullable_to_non_nullable
              as int,
      toggleHotkey: freezed == toggleHotkey
          ? _value.toggleHotkey
          : toggleHotkey // ignore: cast_nullable_to_non_nullable
              as String?,
      smartPaste: null == smartPaste
          ? _value.smartPaste
          : smartPaste // ignore: cast_nullable_to_non_nullable
              as bool,
      launchAtStartup: null == launchAtStartup
          ? _value.launchAtStartup
          : launchAtStartup // ignore: cast_nullable_to_non_nullable
              as bool,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      enc2: freezed == enc2
          ? _value.enc2
          : enc2 // ignore: cast_nullable_to_non_nullable
              as String?,
      autoEncrypt: null == autoEncrypt
          ? _value.autoEncrypt
          : autoEncrypt // ignore: cast_nullable_to_non_nullable
              as bool,
      lastFocusedWindowId: freezed == lastFocusedWindowId
          ? _value.lastFocusedWindowId
          : lastFocusedWindowId // ignore: cast_nullable_to_non_nullable
              as int?,
      clockUnSynced: null == clockUnSynced
          ? _value.clockUnSynced
          : clockUnSynced // ignore: cast_nullable_to_non_nullable
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
      this.enableFileSync = true,
      this.dontUploadOver = $10MB,
      this.dontCopyOver = $10MB,
      this.pausedTill,
      this.autoSyncInterval = $60S,
      this.toggleHotkey,
      this.smartPaste = false,
      this.launchAtStartup = false,
      this.locale = "en",
      this.enc2,
      this.autoEncrypt = false,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.lastFocusedWindowId,
      @ignore this.clockUnSynced = false})
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

  /// will prevent auto upload for files over 10 MB
  @override
  @JsonKey()
  final int dontUploadOver;

  /// will prevent auto copy for files over 10 MB
  @override
  @JsonKey()
  final int dontCopyOver;

  /// Pause auto copy for till pausedTill is reached.
  @override
  final DateTime? pausedTill;
// Auto Sync Interval
  @override
  @JsonKey()
  final int autoSyncInterval;
// System show/hide toggle hotkey
  @override
  final String? toggleHotkey;

  /// If enabled, the primary action on clips will be smartly selected.
  /// The primary action will be paste, which will directly paste the clip
  /// to the last focused cursor in the last window, and the clipboard will minimize.
  @override
  @JsonKey()
  final bool smartPaste;

  /// If enabled, the application will automatically start at startup.
  @override
  @JsonKey()
  final bool launchAtStartup;
  @override
  @JsonKey()
  final String locale;
  @override
  final String? enc2;
  @override
  @JsonKey()
  final bool autoEncrypt;
//? Local App States
  /// last focus window id
  @override
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int? lastFocusedWindowId;
  @override
  @JsonKey()
  @ignore
  final bool clockUnSynced;

  @override
  String toString() {
    return 'AppConfig(themeMode: $themeMode, enableSync: $enableSync, enableFileSync: $enableFileSync, dontUploadOver: $dontUploadOver, dontCopyOver: $dontCopyOver, pausedTill: $pausedTill, autoSyncInterval: $autoSyncInterval, toggleHotkey: $toggleHotkey, smartPaste: $smartPaste, launchAtStartup: $launchAtStartup, locale: $locale, enc2: $enc2, autoEncrypt: $autoEncrypt, lastFocusedWindowId: $lastFocusedWindowId, clockUnSynced: $clockUnSynced)';
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
                other.enableFileSync == enableFileSync) &&
            (identical(other.dontUploadOver, dontUploadOver) ||
                other.dontUploadOver == dontUploadOver) &&
            (identical(other.dontCopyOver, dontCopyOver) ||
                other.dontCopyOver == dontCopyOver) &&
            (identical(other.pausedTill, pausedTill) ||
                other.pausedTill == pausedTill) &&
            (identical(other.autoSyncInterval, autoSyncInterval) ||
                other.autoSyncInterval == autoSyncInterval) &&
            (identical(other.toggleHotkey, toggleHotkey) ||
                other.toggleHotkey == toggleHotkey) &&
            (identical(other.smartPaste, smartPaste) ||
                other.smartPaste == smartPaste) &&
            (identical(other.launchAtStartup, launchAtStartup) ||
                other.launchAtStartup == launchAtStartup) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.enc2, enc2) || other.enc2 == enc2) &&
            (identical(other.autoEncrypt, autoEncrypt) ||
                other.autoEncrypt == autoEncrypt) &&
            (identical(other.lastFocusedWindowId, lastFocusedWindowId) ||
                other.lastFocusedWindowId == lastFocusedWindowId) &&
            (identical(other.clockUnSynced, clockUnSynced) ||
                other.clockUnSynced == clockUnSynced));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      themeMode,
      enableSync,
      enableFileSync,
      dontUploadOver,
      dontCopyOver,
      pausedTill,
      autoSyncInterval,
      toggleHotkey,
      smartPaste,
      launchAtStartup,
      locale,
      enc2,
      autoEncrypt,
      lastFocusedWindowId,
      clockUnSynced);

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
      final bool enableFileSync,
      final int dontUploadOver,
      final int dontCopyOver,
      final DateTime? pausedTill,
      final int autoSyncInterval,
      final String? toggleHotkey,
      final bool smartPaste,
      final bool launchAtStartup,
      final String locale,
      final String? enc2,
      final bool autoEncrypt,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      final int? lastFocusedWindowId,
      @ignore final bool clockUnSynced}) = _$AppConfigImpl;
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

  /// will prevent auto upload for files over 10 MB
  int get dontUploadOver;
  @override

  /// will prevent auto copy for files over 10 MB
  int get dontCopyOver;
  @override

  /// Pause auto copy for till pausedTill is reached.
  DateTime? get pausedTill;
  @override // Auto Sync Interval
  int get autoSyncInterval;
  @override // System show/hide toggle hotkey
  String? get toggleHotkey;
  @override

  /// If enabled, the primary action on clips will be smartly selected.
  /// The primary action will be paste, which will directly paste the clip
  /// to the last focused cursor in the last window, and the clipboard will minimize.
  bool get smartPaste;
  @override

  /// If enabled, the application will automatically start at startup.
  bool get launchAtStartup;
  @override
  String get locale;
  @override
  String? get enc2;
  @override
  bool get autoEncrypt;
  @override //? Local App States
  /// last focus window id
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get lastFocusedWindowId;
  @override
  @ignore
  bool get clockUnSynced;
  @override
  @JsonKey(ignore: true)
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
