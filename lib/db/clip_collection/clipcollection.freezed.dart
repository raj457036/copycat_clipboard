// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clipcollection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClipCollection _$ClipCollectionFromJson(Map<String, dynamic> json) {
  return _ClipCollection.fromJson(json);
}

/// @nodoc
mixin _$ClipCollection {
  @JsonKey(name: "id", includeToJson: false)
  String? get serverId => throw _privateConstructorUsedError;
  @JsonKey(name: "created")
  @DateTimeConverter()
  DateTime get created => throw _privateConstructorUsedError;
  @JsonKey(name: "modified")
  @DateTimeConverter()
  DateTime get modified => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get emoji => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClipCollectionCopyWith<ClipCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClipCollectionCopyWith<$Res> {
  factory $ClipCollectionCopyWith(
          ClipCollection value, $Res Function(ClipCollection) then) =
      _$ClipCollectionCopyWithImpl<$Res, ClipCollection>;
  @useResult
  $Res call(
      {@JsonKey(name: "id", includeToJson: false) String? serverId,
      @JsonKey(name: "created") @DateTimeConverter() DateTime created,
      @JsonKey(name: "modified") @DateTimeConverter() DateTime modified,
      String title,
      String? description,
      String emoji});
}

/// @nodoc
class _$ClipCollectionCopyWithImpl<$Res, $Val extends ClipCollection>
    implements $ClipCollectionCopyWith<$Res> {
  _$ClipCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverId = freezed,
    Object? created = null,
    Object? modified = null,
    Object? title = null,
    Object? description = freezed,
    Object? emoji = null,
  }) {
    return _then(_value.copyWith(
      serverId: freezed == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClipCollectionImplCopyWith<$Res>
    implements $ClipCollectionCopyWith<$Res> {
  factory _$$ClipCollectionImplCopyWith(_$ClipCollectionImpl value,
          $Res Function(_$ClipCollectionImpl) then) =
      __$$ClipCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id", includeToJson: false) String? serverId,
      @JsonKey(name: "created") @DateTimeConverter() DateTime created,
      @JsonKey(name: "modified") @DateTimeConverter() DateTime modified,
      String title,
      String? description,
      String emoji});
}

/// @nodoc
class __$$ClipCollectionImplCopyWithImpl<$Res>
    extends _$ClipCollectionCopyWithImpl<$Res, _$ClipCollectionImpl>
    implements _$$ClipCollectionImplCopyWith<$Res> {
  __$$ClipCollectionImplCopyWithImpl(
      _$ClipCollectionImpl _value, $Res Function(_$ClipCollectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverId = freezed,
    Object? created = null,
    Object? modified = null,
    Object? title = null,
    Object? description = freezed,
    Object? emoji = null,
  }) {
    return _then(_$ClipCollectionImpl(
      serverId: freezed == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClipCollectionImpl extends _ClipCollection {
  _$ClipCollectionImpl(
      {@JsonKey(name: "id", includeToJson: false) this.serverId,
      @JsonKey(name: "created") @DateTimeConverter() required this.created,
      @JsonKey(name: "modified") @DateTimeConverter() required this.modified,
      required this.title,
      this.description,
      required this.emoji})
      : super._();

  factory _$ClipCollectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClipCollectionImplFromJson(json);

  @override
  @JsonKey(name: "id", includeToJson: false)
  final String? serverId;
  @override
  @JsonKey(name: "created")
  @DateTimeConverter()
  final DateTime created;
  @override
  @JsonKey(name: "modified")
  @DateTimeConverter()
  final DateTime modified;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String emoji;

  @override
  String toString() {
    return 'ClipCollection(serverId: $serverId, created: $created, modified: $modified, title: $title, description: $description, emoji: $emoji)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClipCollectionImpl &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.modified, modified) ||
                other.modified == modified) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.emoji, emoji) || other.emoji == emoji));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, serverId, created, modified, title, description, emoji);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClipCollectionImplCopyWith<_$ClipCollectionImpl> get copyWith =>
      __$$ClipCollectionImplCopyWithImpl<_$ClipCollectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClipCollectionImplToJson(
      this,
    );
  }
}

abstract class _ClipCollection extends ClipCollection {
  factory _ClipCollection(
      {@JsonKey(name: "id", includeToJson: false) final String? serverId,
      @JsonKey(name: "created")
      @DateTimeConverter()
      required final DateTime created,
      @JsonKey(name: "modified")
      @DateTimeConverter()
      required final DateTime modified,
      required final String title,
      final String? description,
      required final String emoji}) = _$ClipCollectionImpl;
  _ClipCollection._() : super._();

  factory _ClipCollection.fromJson(Map<String, dynamic> json) =
      _$ClipCollectionImpl.fromJson;

  @override
  @JsonKey(name: "id", includeToJson: false)
  String? get serverId;
  @override
  @JsonKey(name: "created")
  @DateTimeConverter()
  DateTime get created;
  @override
  @JsonKey(name: "modified")
  @DateTimeConverter()
  DateTime get modified;
  @override
  String get title;
  @override
  String? get description;
  @override
  String get emoji;
  @override
  @JsonKey(ignore: true)
  _$$ClipCollectionImplCopyWith<_$ClipCollectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
