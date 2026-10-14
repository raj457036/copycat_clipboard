// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'syncstatus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SyncStatus {

@JsonKey(includeToJson: false, includeFromJson: false) int? get id; DateTime? get lastSyncPoint; DateTime? get lastSyncStartPoint; int? get lastKnownSyncCount; int? get lastKnownTotalCount; bool get restorationPending;
/// Create a copy of SyncStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncStatusCopyWith<SyncStatus> get copyWith => _$SyncStatusCopyWithImpl<SyncStatus>(this as SyncStatus, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncStatus&&(identical(other.id, id) || other.id == id)&&(identical(other.lastSyncPoint, lastSyncPoint) || other.lastSyncPoint == lastSyncPoint)&&(identical(other.lastSyncStartPoint, lastSyncStartPoint) || other.lastSyncStartPoint == lastSyncStartPoint)&&(identical(other.lastKnownSyncCount, lastKnownSyncCount) || other.lastKnownSyncCount == lastKnownSyncCount)&&(identical(other.lastKnownTotalCount, lastKnownTotalCount) || other.lastKnownTotalCount == lastKnownTotalCount)&&(identical(other.restorationPending, restorationPending) || other.restorationPending == restorationPending));
}


@override
int get hashCode => Object.hash(runtimeType,id,lastSyncPoint,lastSyncStartPoint,lastKnownSyncCount,lastKnownTotalCount,restorationPending);

@override
String toString() {
  return 'SyncStatus(id: $id, lastSyncPoint: $lastSyncPoint, lastSyncStartPoint: $lastSyncStartPoint, lastKnownSyncCount: $lastKnownSyncCount, lastKnownTotalCount: $lastKnownTotalCount, restorationPending: $restorationPending)';
}


}

/// @nodoc
abstract mixin class $SyncStatusCopyWith<$Res>  {
  factory $SyncStatusCopyWith(SyncStatus value, $Res Function(SyncStatus) _then) = _$SyncStatusCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false, includeFromJson: false) int? id, DateTime? lastSyncPoint, DateTime? lastSyncStartPoint, int? lastKnownSyncCount, int? lastKnownTotalCount, bool restorationPending
});




}
/// @nodoc
class _$SyncStatusCopyWithImpl<$Res>
    implements $SyncStatusCopyWith<$Res> {
  _$SyncStatusCopyWithImpl(this._self, this._then);

  final SyncStatus _self;
  final $Res Function(SyncStatus) _then;

/// Create a copy of SyncStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? lastSyncPoint = freezed,Object? lastSyncStartPoint = freezed,Object? lastKnownSyncCount = freezed,Object? lastKnownTotalCount = freezed,Object? restorationPending = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,lastSyncPoint: freezed == lastSyncPoint ? _self.lastSyncPoint : lastSyncPoint // ignore: cast_nullable_to_non_nullable
as DateTime?,lastSyncStartPoint: freezed == lastSyncStartPoint ? _self.lastSyncStartPoint : lastSyncStartPoint // ignore: cast_nullable_to_non_nullable
as DateTime?,lastKnownSyncCount: freezed == lastKnownSyncCount ? _self.lastKnownSyncCount : lastKnownSyncCount // ignore: cast_nullable_to_non_nullable
as int?,lastKnownTotalCount: freezed == lastKnownTotalCount ? _self.lastKnownTotalCount : lastKnownTotalCount // ignore: cast_nullable_to_non_nullable
as int?,restorationPending: null == restorationPending ? _self.restorationPending : restorationPending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncStatus].
extension SyncStatusPatterns on SyncStatus {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncStatus() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncStatus value)  $default,){
final _that = this;
switch (_that) {
case _SyncStatus():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncStatus value)?  $default,){
final _that = this;
switch (_that) {
case _SyncStatus() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false, includeFromJson: false)  int? id,  DateTime? lastSyncPoint,  DateTime? lastSyncStartPoint,  int? lastKnownSyncCount,  int? lastKnownTotalCount,  bool restorationPending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncStatus() when $default != null:
return $default(_that.id,_that.lastSyncPoint,_that.lastSyncStartPoint,_that.lastKnownSyncCount,_that.lastKnownTotalCount,_that.restorationPending);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false, includeFromJson: false)  int? id,  DateTime? lastSyncPoint,  DateTime? lastSyncStartPoint,  int? lastKnownSyncCount,  int? lastKnownTotalCount,  bool restorationPending)  $default,) {final _that = this;
switch (_that) {
case _SyncStatus():
return $default(_that.id,_that.lastSyncPoint,_that.lastSyncStartPoint,_that.lastKnownSyncCount,_that.lastKnownTotalCount,_that.restorationPending);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false, includeFromJson: false)  int? id,  DateTime? lastSyncPoint,  DateTime? lastSyncStartPoint,  int? lastKnownSyncCount,  int? lastKnownTotalCount,  bool restorationPending)?  $default,) {final _that = this;
switch (_that) {
case _SyncStatus() when $default != null:
return $default(_that.id,_that.lastSyncPoint,_that.lastSyncStartPoint,_that.lastKnownSyncCount,_that.lastKnownTotalCount,_that.restorationPending);case _:
  return null;

}
}

}

/// @nodoc


class _SyncStatus extends SyncStatus {
   _SyncStatus({@JsonKey(includeToJson: false, includeFromJson: false) this.id, this.lastSyncPoint, this.lastSyncStartPoint, this.lastKnownSyncCount, this.lastKnownTotalCount, this.restorationPending = true}): super._();
  

@override@JsonKey(includeToJson: false, includeFromJson: false) final  int? id;
@override final  DateTime? lastSyncPoint;
@override final  DateTime? lastSyncStartPoint;
@override final  int? lastKnownSyncCount;
@override final  int? lastKnownTotalCount;
@override@JsonKey() final  bool restorationPending;

/// Create a copy of SyncStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncStatusCopyWith<_SyncStatus> get copyWith => __$SyncStatusCopyWithImpl<_SyncStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncStatus&&(identical(other.id, id) || other.id == id)&&(identical(other.lastSyncPoint, lastSyncPoint) || other.lastSyncPoint == lastSyncPoint)&&(identical(other.lastSyncStartPoint, lastSyncStartPoint) || other.lastSyncStartPoint == lastSyncStartPoint)&&(identical(other.lastKnownSyncCount, lastKnownSyncCount) || other.lastKnownSyncCount == lastKnownSyncCount)&&(identical(other.lastKnownTotalCount, lastKnownTotalCount) || other.lastKnownTotalCount == lastKnownTotalCount)&&(identical(other.restorationPending, restorationPending) || other.restorationPending == restorationPending));
}


@override
int get hashCode => Object.hash(runtimeType,id,lastSyncPoint,lastSyncStartPoint,lastKnownSyncCount,lastKnownTotalCount,restorationPending);

@override
String toString() {
  return 'SyncStatus(id: $id, lastSyncPoint: $lastSyncPoint, lastSyncStartPoint: $lastSyncStartPoint, lastKnownSyncCount: $lastKnownSyncCount, lastKnownTotalCount: $lastKnownTotalCount, restorationPending: $restorationPending)';
}


}

/// @nodoc
abstract mixin class _$SyncStatusCopyWith<$Res> implements $SyncStatusCopyWith<$Res> {
  factory _$SyncStatusCopyWith(_SyncStatus value, $Res Function(_SyncStatus) _then) = __$SyncStatusCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false, includeFromJson: false) int? id, DateTime? lastSyncPoint, DateTime? lastSyncStartPoint, int? lastKnownSyncCount, int? lastKnownTotalCount, bool restorationPending
});




}
/// @nodoc
class __$SyncStatusCopyWithImpl<$Res>
    implements _$SyncStatusCopyWith<$Res> {
  __$SyncStatusCopyWithImpl(this._self, this._then);

  final _SyncStatus _self;
  final $Res Function(_SyncStatus) _then;

/// Create a copy of SyncStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? lastSyncPoint = freezed,Object? lastSyncStartPoint = freezed,Object? lastKnownSyncCount = freezed,Object? lastKnownTotalCount = freezed,Object? restorationPending = null,}) {
  return _then(_SyncStatus(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,lastSyncPoint: freezed == lastSyncPoint ? _self.lastSyncPoint : lastSyncPoint // ignore: cast_nullable_to_non_nullable
as DateTime?,lastSyncStartPoint: freezed == lastSyncStartPoint ? _self.lastSyncStartPoint : lastSyncStartPoint // ignore: cast_nullable_to_non_nullable
as DateTime?,lastKnownSyncCount: freezed == lastKnownSyncCount ? _self.lastKnownSyncCount : lastKnownSyncCount // ignore: cast_nullable_to_non_nullable
as int?,lastKnownTotalCount: freezed == lastKnownTotalCount ? _self.lastKnownTotalCount : lastKnownTotalCount // ignore: cast_nullable_to_non_nullable
as int?,restorationPending: null == restorationPending ? _self.restorationPending : restorationPending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
