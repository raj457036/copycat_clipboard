// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Clip _$ClipFromJson(Map<String, dynamic> json) {
  return _Clip.fromJson(json);
}

/// @nodoc
mixin _$Clip {
  /// common properties
  String? get serverId => throw _privateConstructorUsedError;
  DateTime? get lastSynced => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  DateTime get modified => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError; // specific properties
  /// text, path, url
  String? get value => throw _privateConstructorUsedError;
  @Enumerated(EnumType.name)
  ClipType? get clipType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClipCopyWith<Clip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClipCopyWith<$Res> {
  factory $ClipCopyWith(Clip value, $Res Function(Clip) then) =
      _$ClipCopyWithImpl<$Res, Clip>;
  @useResult
  $Res call(
      {String? serverId,
      DateTime? lastSynced,
      DateTime created,
      DateTime modified,
      String title,
      String? value,
      @Enumerated(EnumType.name) ClipType? clipType});
}

/// @nodoc
class _$ClipCopyWithImpl<$Res, $Val extends Clip>
    implements $ClipCopyWith<$Res> {
  _$ClipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverId = freezed,
    Object? lastSynced = freezed,
    Object? created = null,
    Object? modified = null,
    Object? title = null,
    Object? value = freezed,
    Object? clipType = freezed,
  }) {
    return _then(_value.copyWith(
      serverId: freezed == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSynced: freezed == lastSynced
          ? _value.lastSynced
          : lastSynced // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modified: null == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      clipType: freezed == clipType
          ? _value.clipType
          : clipType // ignore: cast_nullable_to_non_nullable
              as ClipType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClipImplCopyWith<$Res> implements $ClipCopyWith<$Res> {
  factory _$$ClipImplCopyWith(
          _$ClipImpl value, $Res Function(_$ClipImpl) then) =
      __$$ClipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? serverId,
      DateTime? lastSynced,
      DateTime created,
      DateTime modified,
      String title,
      String? value,
      @Enumerated(EnumType.name) ClipType? clipType});
}

/// @nodoc
class __$$ClipImplCopyWithImpl<$Res>
    extends _$ClipCopyWithImpl<$Res, _$ClipImpl>
    implements _$$ClipImplCopyWith<$Res> {
  __$$ClipImplCopyWithImpl(_$ClipImpl _value, $Res Function(_$ClipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverId = freezed,
    Object? lastSynced = freezed,
    Object? created = null,
    Object? modified = null,
    Object? title = null,
    Object? value = freezed,
    Object? clipType = freezed,
  }) {
    return _then(_$ClipImpl(
      serverId: freezed == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSynced: freezed == lastSynced
          ? _value.lastSynced
          : lastSynced // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modified: null == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      clipType: freezed == clipType
          ? _value.clipType
          : clipType // ignore: cast_nullable_to_non_nullable
              as ClipType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClipImpl extends _Clip {
  const _$ClipImpl(
      {this.serverId,
      this.lastSynced,
      required this.created,
      required this.modified,
      required this.title,
      this.value,
      @Enumerated(EnumType.name) this.clipType})
      : super._();

  factory _$ClipImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClipImplFromJson(json);

  /// common properties
  @override
  final String? serverId;
  @override
  final DateTime? lastSynced;
  @override
  final DateTime created;
  @override
  final DateTime modified;
  @override
  final String title;
// specific properties
  /// text, path, url
  @override
  final String? value;
  @override
  @Enumerated(EnumType.name)
  final ClipType? clipType;

  @override
  String toString() {
    return 'Clip(serverId: $serverId, lastSynced: $lastSynced, created: $created, modified: $modified, title: $title, value: $value, clipType: $clipType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClipImpl &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId) &&
            (identical(other.lastSynced, lastSynced) ||
                other.lastSynced == lastSynced) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.modified, modified) ||
                other.modified == modified) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.clipType, clipType) ||
                other.clipType == clipType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, serverId, lastSynced, created,
      modified, title, value, clipType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClipImplCopyWith<_$ClipImpl> get copyWith =>
      __$$ClipImplCopyWithImpl<_$ClipImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClipImplToJson(
      this,
    );
  }
}

abstract class _Clip extends Clip {
  const factory _Clip(
      {final String? serverId,
      final DateTime? lastSynced,
      required final DateTime created,
      required final DateTime modified,
      required final String title,
      final String? value,
      @Enumerated(EnumType.name) final ClipType? clipType}) = _$ClipImpl;
  const _Clip._() : super._();

  factory _Clip.fromJson(Map<String, dynamic> json) = _$ClipImpl.fromJson;

  @override

  /// common properties
  String? get serverId;
  @override
  DateTime? get lastSynced;
  @override
  DateTime get created;
  @override
  DateTime get modified;
  @override
  String get title;
  @override // specific properties
  /// text, path, url
  String? get value;
  @override
  @Enumerated(EnumType.name)
  ClipType? get clipType;
  @override
  @JsonKey(ignore: true)
  _$$ClipImplCopyWith<_$ClipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
