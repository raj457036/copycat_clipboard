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
  @Id()
  int get localId => throw _privateConstructorUsedError;

  /// common properties
  @Id()
  set localId(int value) => throw _privateConstructorUsedError;
  @Unique()
  String? get id => throw _privateConstructorUsedError;
  @Unique()
  set id(String? value) => throw _privateConstructorUsedError;
  @DateTimeConverter()
  @Property(type: PropertyType.date)
  DateTime get created => throw _privateConstructorUsedError;
  @DateTimeConverter()
  @Property(type: PropertyType.date)
  set created(DateTime value) => throw _privateConstructorUsedError;
  @DateTimeConverter()
  @Property(type: PropertyType.date)
  DateTime? get lastSynced => throw _privateConstructorUsedError;
  @DateTimeConverter()
  @Property(type: PropertyType.date)
  set lastSynced(DateTime? value) =>
      throw _privateConstructorUsedError; // specific properties
  String? get text => throw _privateConstructorUsedError; // specific properties
  set text(String? value) => throw _privateConstructorUsedError;

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
      {@Id() int localId,
      @Unique() String? id,
      @DateTimeConverter() @Property(type: PropertyType.date) DateTime created,
      @DateTimeConverter()
      @Property(type: PropertyType.date)
      DateTime? lastSynced,
      String? text});
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
    Object? localId = null,
    Object? id = freezed,
    Object? created = null,
    Object? lastSynced = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      localId: null == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastSynced: freezed == lastSynced
          ? _value.lastSynced
          : lastSynced // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@Id() int localId,
      @Unique() String? id,
      @DateTimeConverter() @Property(type: PropertyType.date) DateTime created,
      @DateTimeConverter()
      @Property(type: PropertyType.date)
      DateTime? lastSynced,
      String? text});
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
    Object? localId = null,
    Object? id = freezed,
    Object? created = null,
    Object? lastSynced = freezed,
    Object? text = freezed,
  }) {
    return _then(_$ClipImpl(
      localId: null == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastSynced: freezed == lastSynced
          ? _value.lastSynced
          : lastSynced // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Entity(realClass: Clip)
class _$ClipImpl extends _Clip {
  _$ClipImpl(
      {@Id() this.localId = 0,
      @Unique() this.id,
      @DateTimeConverter()
      @Property(type: PropertyType.date)
      required this.created,
      @DateTimeConverter() @Property(type: PropertyType.date) this.lastSynced,
      this.text})
      : super._();

  factory _$ClipImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClipImplFromJson(json);

  /// common properties
  @override
  @JsonKey()
  @Id()
  int localId;
  @override
  @Unique()
  String? id;
  @override
  @DateTimeConverter()
  @Property(type: PropertyType.date)
  DateTime created;
  @override
  @DateTimeConverter()
  @Property(type: PropertyType.date)
  DateTime? lastSynced;
// specific properties
  @override
  String? text;

  @override
  String toString() {
    return 'Clip(localId: $localId, id: $id, created: $created, lastSynced: $lastSynced, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClipImpl &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.lastSynced, lastSynced) ||
                other.lastSynced == lastSynced) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, localId, id, created, lastSynced, text);

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
  factory _Clip(
      {@Id() int localId,
      @Unique() String? id,
      @DateTimeConverter()
      @Property(type: PropertyType.date)
      required DateTime created,
      @DateTimeConverter()
      @Property(type: PropertyType.date)
      DateTime? lastSynced,
      String? text}) = _$ClipImpl;
  _Clip._() : super._();

  factory _Clip.fromJson(Map<String, dynamic> json) = _$ClipImpl.fromJson;

  @override

  /// common properties
  @Id()
  int get localId;

  /// common properties
  @Id()
  set localId(int value);
  @override
  @Unique()
  String? get id;
  @Unique()
  set id(String? value);
  @override
  @DateTimeConverter()
  @Property(type: PropertyType.date)
  DateTime get created;
  @DateTimeConverter()
  @Property(type: PropertyType.date)
  set created(DateTime value);
  @override
  @DateTimeConverter()
  @Property(type: PropertyType.date)
  DateTime? get lastSynced;
  @DateTimeConverter()
  @Property(type: PropertyType.date)
  set lastSynced(DateTime? value);
  @override // specific properties
  String? get text; // specific properties
  set text(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ClipImplCopyWith<_$ClipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
