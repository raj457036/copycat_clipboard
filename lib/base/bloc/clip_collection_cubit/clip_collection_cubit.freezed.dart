// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clip_collection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClipCollectionState {

 List<ClipCollection> get collections; bool get hasMore; bool get isLoading; int get limit; int get offset; bool get loading; bool get syncing; int get activeLimit; Failure? get failure;
/// Create a copy of ClipCollectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClipCollectionStateCopyWith<ClipCollectionState> get copyWith => _$ClipCollectionStateCopyWithImpl<ClipCollectionState>(this as ClipCollectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClipCollectionState&&const DeepCollectionEquality().equals(other.collections, collections)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.syncing, syncing) || other.syncing == syncing)&&(identical(other.activeLimit, activeLimit) || other.activeLimit == activeLimit)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(collections),hasMore,isLoading,limit,offset,loading,syncing,activeLimit,failure);

@override
String toString() {
  return 'ClipCollectionState(collections: $collections, hasMore: $hasMore, isLoading: $isLoading, limit: $limit, offset: $offset, loading: $loading, syncing: $syncing, activeLimit: $activeLimit, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ClipCollectionStateCopyWith<$Res>  {
  factory $ClipCollectionStateCopyWith(ClipCollectionState value, $Res Function(ClipCollectionState) _then) = _$ClipCollectionStateCopyWithImpl;
@useResult
$Res call({
 List<ClipCollection> collections, bool hasMore, bool isLoading, int limit, int offset, bool loading, bool syncing, int activeLimit, Failure? failure
});




}
/// @nodoc
class _$ClipCollectionStateCopyWithImpl<$Res>
    implements $ClipCollectionStateCopyWith<$Res> {
  _$ClipCollectionStateCopyWithImpl(this._self, this._then);

  final ClipCollectionState _self;
  final $Res Function(ClipCollectionState) _then;

/// Create a copy of ClipCollectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? collections = null,Object? hasMore = null,Object? isLoading = null,Object? limit = null,Object? offset = null,Object? loading = null,Object? syncing = null,Object? activeLimit = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
collections: null == collections ? _self.collections : collections // ignore: cast_nullable_to_non_nullable
as List<ClipCollection>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,syncing: null == syncing ? _self.syncing : syncing // ignore: cast_nullable_to_non_nullable
as bool,activeLimit: null == activeLimit ? _self.activeLimit : activeLimit // ignore: cast_nullable_to_non_nullable
as int,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClipCollectionState].
extension ClipCollectionStatePatterns on ClipCollectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ClipCollectionLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ClipCollectionLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ClipCollectionLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case ClipCollectionLoaded():
return loaded(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ClipCollectionLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case ClipCollectionLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<ClipCollection> collections,  bool hasMore,  bool isLoading,  int limit,  int offset,  bool loading,  bool syncing,  int activeLimit,  Failure? failure)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ClipCollectionLoaded() when loaded != null:
return loaded(_that.collections,_that.hasMore,_that.isLoading,_that.limit,_that.offset,_that.loading,_that.syncing,_that.activeLimit,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<ClipCollection> collections,  bool hasMore,  bool isLoading,  int limit,  int offset,  bool loading,  bool syncing,  int activeLimit,  Failure? failure)  loaded,}) {final _that = this;
switch (_that) {
case ClipCollectionLoaded():
return loaded(_that.collections,_that.hasMore,_that.isLoading,_that.limit,_that.offset,_that.loading,_that.syncing,_that.activeLimit,_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<ClipCollection> collections,  bool hasMore,  bool isLoading,  int limit,  int offset,  bool loading,  bool syncing,  int activeLimit,  Failure? failure)?  loaded,}) {final _that = this;
switch (_that) {
case ClipCollectionLoaded() when loaded != null:
return loaded(_that.collections,_that.hasMore,_that.isLoading,_that.limit,_that.offset,_that.loading,_that.syncing,_that.activeLimit,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class ClipCollectionLoaded implements ClipCollectionState {
  const ClipCollectionLoaded({required final  List<ClipCollection> collections, this.hasMore = true, this.isLoading = false, this.limit = 50, this.offset = 0, this.loading = true, this.syncing = false, this.activeLimit = defaultCollectionCount, this.failure}): _collections = collections;
  

 final  List<ClipCollection> _collections;
@override List<ClipCollection> get collections {
  if (_collections is EqualUnmodifiableListView) return _collections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_collections);
}

@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  int limit;
@override@JsonKey() final  int offset;
@override@JsonKey() final  bool loading;
@override@JsonKey() final  bool syncing;
@override@JsonKey() final  int activeLimit;
@override final  Failure? failure;

/// Create a copy of ClipCollectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClipCollectionLoadedCopyWith<ClipCollectionLoaded> get copyWith => _$ClipCollectionLoadedCopyWithImpl<ClipCollectionLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClipCollectionLoaded&&const DeepCollectionEquality().equals(other._collections, _collections)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.syncing, syncing) || other.syncing == syncing)&&(identical(other.activeLimit, activeLimit) || other.activeLimit == activeLimit)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_collections),hasMore,isLoading,limit,offset,loading,syncing,activeLimit,failure);

@override
String toString() {
  return 'ClipCollectionState.loaded(collections: $collections, hasMore: $hasMore, isLoading: $isLoading, limit: $limit, offset: $offset, loading: $loading, syncing: $syncing, activeLimit: $activeLimit, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ClipCollectionLoadedCopyWith<$Res> implements $ClipCollectionStateCopyWith<$Res> {
  factory $ClipCollectionLoadedCopyWith(ClipCollectionLoaded value, $Res Function(ClipCollectionLoaded) _then) = _$ClipCollectionLoadedCopyWithImpl;
@override @useResult
$Res call({
 List<ClipCollection> collections, bool hasMore, bool isLoading, int limit, int offset, bool loading, bool syncing, int activeLimit, Failure? failure
});




}
/// @nodoc
class _$ClipCollectionLoadedCopyWithImpl<$Res>
    implements $ClipCollectionLoadedCopyWith<$Res> {
  _$ClipCollectionLoadedCopyWithImpl(this._self, this._then);

  final ClipCollectionLoaded _self;
  final $Res Function(ClipCollectionLoaded) _then;

/// Create a copy of ClipCollectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? collections = null,Object? hasMore = null,Object? isLoading = null,Object? limit = null,Object? offset = null,Object? loading = null,Object? syncing = null,Object? activeLimit = null,Object? failure = freezed,}) {
  return _then(ClipCollectionLoaded(
collections: null == collections ? _self._collections : collections // ignore: cast_nullable_to_non_nullable
as List<ClipCollection>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,syncing: null == syncing ? _self.syncing : syncing // ignore: cast_nullable_to_non_nullable
as bool,activeLimit: null == activeLimit ? _self.activeLimit : activeLimit // ignore: cast_nullable_to_non_nullable
as int,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
