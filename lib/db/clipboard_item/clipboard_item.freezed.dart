// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clipboard_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClipboardItem _$ClipboardItemFromJson(Map<String, dynamic> json) {
  return _ClipboardItem.fromJson(json);
}

/// @nodoc
mixin _$ClipboardItem {
  String? get serverId => throw _privateConstructorUsedError;
  DateTime? get lastSynced => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  String? get localPath => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  DateTime get modified => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @Enumerated(EnumType.name)
  ClipItemType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClipboardItemCopyWith<ClipboardItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClipboardItemCopyWith<$Res> {
  factory $ClipboardItemCopyWith(
          ClipboardItem value, $Res Function(ClipboardItem) then) =
      _$ClipboardItemCopyWithImpl<$Res, ClipboardItem>;
  @useResult
  $Res call(
      {String? serverId,
      DateTime? lastSynced,
      String? value,
      String? localPath,
      DateTime created,
      DateTime modified,
      String title,
      @Enumerated(EnumType.name) ClipItemType type});
}

/// @nodoc
class _$ClipboardItemCopyWithImpl<$Res, $Val extends ClipboardItem>
    implements $ClipboardItemCopyWith<$Res> {
  _$ClipboardItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverId = freezed,
    Object? lastSynced = freezed,
    Object? value = freezed,
    Object? localPath = freezed,
    Object? created = null,
    Object? modified = null,
    Object? title = null,
    Object? type = null,
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
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      localPath: freezed == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String?,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ClipItemType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClipboardItemImplCopyWith<$Res>
    implements $ClipboardItemCopyWith<$Res> {
  factory _$$ClipboardItemImplCopyWith(
          _$ClipboardItemImpl value, $Res Function(_$ClipboardItemImpl) then) =
      __$$ClipboardItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? serverId,
      DateTime? lastSynced,
      String? value,
      String? localPath,
      DateTime created,
      DateTime modified,
      String title,
      @Enumerated(EnumType.name) ClipItemType type});
}

/// @nodoc
class __$$ClipboardItemImplCopyWithImpl<$Res>
    extends _$ClipboardItemCopyWithImpl<$Res, _$ClipboardItemImpl>
    implements _$$ClipboardItemImplCopyWith<$Res> {
  __$$ClipboardItemImplCopyWithImpl(
      _$ClipboardItemImpl _value, $Res Function(_$ClipboardItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverId = freezed,
    Object? lastSynced = freezed,
    Object? value = freezed,
    Object? localPath = freezed,
    Object? created = null,
    Object? modified = null,
    Object? title = null,
    Object? type = null,
  }) {
    return _then(_$ClipboardItemImpl(
      serverId: freezed == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSynced: freezed == lastSynced
          ? _value.lastSynced
          : lastSynced // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      localPath: freezed == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String?,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ClipItemType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClipboardItemImpl extends _ClipboardItem {
  _$ClipboardItemImpl(
      {this.serverId,
      this.lastSynced,
      this.value,
      this.localPath,
      required this.created,
      required this.modified,
      required this.title,
      @Enumerated(EnumType.name) required this.type})
      : super._();

  factory _$ClipboardItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClipboardItemImplFromJson(json);

  @override
  final String? serverId;
  @override
  final DateTime? lastSynced;
  @override
  final String? value;
  @override
  final String? localPath;
  @override
  final DateTime created;
  @override
  final DateTime modified;
  @override
  final String title;
  @override
  @Enumerated(EnumType.name)
  final ClipItemType type;

  @override
  String toString() {
    return 'ClipboardItem(serverId: $serverId, lastSynced: $lastSynced, value: $value, localPath: $localPath, created: $created, modified: $modified, title: $title, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClipboardItemImpl &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId) &&
            (identical(other.lastSynced, lastSynced) ||
                other.lastSynced == lastSynced) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.modified, modified) ||
                other.modified == modified) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, serverId, lastSynced, value,
      localPath, created, modified, title, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClipboardItemImplCopyWith<_$ClipboardItemImpl> get copyWith =>
      __$$ClipboardItemImplCopyWithImpl<_$ClipboardItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClipboardItemImplToJson(
      this,
    );
  }
}

abstract class _ClipboardItem extends ClipboardItem {
  factory _ClipboardItem(
          {final String? serverId,
          final DateTime? lastSynced,
          final String? value,
          final String? localPath,
          required final DateTime created,
          required final DateTime modified,
          required final String title,
          @Enumerated(EnumType.name) required final ClipItemType type}) =
      _$ClipboardItemImpl;
  _ClipboardItem._() : super._();

  factory _ClipboardItem.fromJson(Map<String, dynamic> json) =
      _$ClipboardItemImpl.fromJson;

  @override
  String? get serverId;
  @override
  DateTime? get lastSynced;
  @override
  String? get value;
  @override
  String? get localPath;
  @override
  DateTime get created;
  @override
  DateTime get modified;
  @override
  String get title;
  @override
  @Enumerated(EnumType.name)
  ClipItemType get type;
  @override
  @JsonKey(ignore: true)
  _$$ClipboardItemImplCopyWith<_$ClipboardItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
