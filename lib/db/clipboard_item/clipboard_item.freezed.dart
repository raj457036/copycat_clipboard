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
  @JsonKey(name: "\$id", includeToJson: false)
  String? get serverId => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  DateTime? get lastSynced => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get localPath => throw _privateConstructorUsedError;
  @JsonKey(name: "\$createdAt")
  DateTime get created => throw _privateConstructorUsedError;
  @JsonKey(name: "\$updatedAt")
  DateTime get modified => throw _privateConstructorUsedError;
  @Enumerated(EnumType.name)
  ClipItemType get type => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  String? get serverPath => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "\$id", includeToJson: false) String? serverId,
      @JsonKey(includeFromJson: false, includeToJson: false)
      DateTime? lastSynced,
      @JsonKey(includeFromJson: false, includeToJson: false) String? localPath,
      @JsonKey(name: "\$createdAt") DateTime created,
      @JsonKey(name: "\$updatedAt") DateTime modified,
      @Enumerated(EnumType.name) ClipItemType type,
      String userId,
      String title,
      String? value,
      String? serverPath,
      String? description,
      DateTime? deletedAt,
      int? size});
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
    Object? localPath = freezed,
    Object? created = null,
    Object? modified = null,
    Object? type = null,
    Object? userId = null,
    Object? title = null,
    Object? value = freezed,
    Object? serverPath = freezed,
    Object? description = freezed,
    Object? deletedAt = freezed,
    Object? size = freezed,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ClipItemType,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      serverPath: freezed == serverPath
          ? _value.serverPath
          : serverPath // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {@JsonKey(name: "\$id", includeToJson: false) String? serverId,
      @JsonKey(includeFromJson: false, includeToJson: false)
      DateTime? lastSynced,
      @JsonKey(includeFromJson: false, includeToJson: false) String? localPath,
      @JsonKey(name: "\$createdAt") DateTime created,
      @JsonKey(name: "\$updatedAt") DateTime modified,
      @Enumerated(EnumType.name) ClipItemType type,
      String userId,
      String title,
      String? value,
      String? serverPath,
      String? description,
      DateTime? deletedAt,
      int? size});
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
    Object? localPath = freezed,
    Object? created = null,
    Object? modified = null,
    Object? type = null,
    Object? userId = null,
    Object? title = null,
    Object? value = freezed,
    Object? serverPath = freezed,
    Object? description = freezed,
    Object? deletedAt = freezed,
    Object? size = freezed,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ClipItemType,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      serverPath: freezed == serverPath
          ? _value.serverPath
          : serverPath // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClipboardItemImpl extends _ClipboardItem {
  _$ClipboardItemImpl(
      {@JsonKey(name: "\$id", includeToJson: false) this.serverId,
      @JsonKey(includeFromJson: false, includeToJson: false) this.lastSynced,
      @JsonKey(includeFromJson: false, includeToJson: false) this.localPath,
      @JsonKey(name: "\$createdAt") required this.created,
      @JsonKey(name: "\$updatedAt") required this.modified,
      @Enumerated(EnumType.name) required this.type,
      required this.userId,
      required this.title,
      this.value,
      this.serverPath,
      this.description,
      this.deletedAt,
      this.size})
      : super._();

  factory _$ClipboardItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClipboardItemImplFromJson(json);

  @override
  @JsonKey(name: "\$id", includeToJson: false)
  final String? serverId;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final DateTime? lastSynced;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? localPath;
  @override
  @JsonKey(name: "\$createdAt")
  final DateTime created;
  @override
  @JsonKey(name: "\$updatedAt")
  final DateTime modified;
  @override
  @Enumerated(EnumType.name)
  final ClipItemType type;
  @override
  final String userId;
  @override
  final String title;
  @override
  final String? value;
  @override
  final String? serverPath;
  @override
  final String? description;
  @override
  final DateTime? deletedAt;
  @override
  final int? size;

  @override
  String toString() {
    return 'ClipboardItem(serverId: $serverId, lastSynced: $lastSynced, localPath: $localPath, created: $created, modified: $modified, type: $type, userId: $userId, title: $title, value: $value, serverPath: $serverPath, description: $description, deletedAt: $deletedAt, size: $size)';
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
            (identical(other.localPath, localPath) ||
                other.localPath == localPath) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.modified, modified) ||
                other.modified == modified) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.serverPath, serverPath) ||
                other.serverPath == serverPath) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      serverId,
      lastSynced,
      localPath,
      created,
      modified,
      type,
      userId,
      title,
      value,
      serverPath,
      description,
      deletedAt,
      size);

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
      {@JsonKey(name: "\$id", includeToJson: false) final String? serverId,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final DateTime? lastSynced,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final String? localPath,
      @JsonKey(name: "\$createdAt") required final DateTime created,
      @JsonKey(name: "\$updatedAt") required final DateTime modified,
      @Enumerated(EnumType.name) required final ClipItemType type,
      required final String userId,
      required final String title,
      final String? value,
      final String? serverPath,
      final String? description,
      final DateTime? deletedAt,
      final int? size}) = _$ClipboardItemImpl;
  _ClipboardItem._() : super._();

  factory _ClipboardItem.fromJson(Map<String, dynamic> json) =
      _$ClipboardItemImpl.fromJson;

  @override
  @JsonKey(name: "\$id", includeToJson: false)
  String? get serverId;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  DateTime? get lastSynced;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get localPath;
  @override
  @JsonKey(name: "\$createdAt")
  DateTime get created;
  @override
  @JsonKey(name: "\$updatedAt")
  DateTime get modified;
  @override
  @Enumerated(EnumType.name)
  ClipItemType get type;
  @override
  String get userId;
  @override
  String get title;
  @override
  String? get value;
  @override
  String? get serverPath;
  @override
  String? get description;
  @override
  DateTime? get deletedAt;
  @override
  int? get size;
  @override
  @JsonKey(ignore: true)
  _$$ClipboardItemImplCopyWith<_$ClipboardItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
