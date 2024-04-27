// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clip_collection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClipCollectionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Failure failure) error,
    required TResult Function(List<ClipCollection> collections, bool hasMore,
            bool isLoading, int limit, int offset)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Failure failure)? error,
    TResult? Function(List<ClipCollection> collections, bool hasMore,
            bool isLoading, int limit, int offset)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Failure failure)? error,
    TResult Function(List<ClipCollection> collections, bool hasMore,
            bool isLoading, int limit, int offset)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClipCollectionInitial value) initial,
    required TResult Function(ClipCollectionError value) error,
    required TResult Function(ClipCollectionLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClipCollectionInitial value)? initial,
    TResult? Function(ClipCollectionError value)? error,
    TResult? Function(ClipCollectionLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClipCollectionInitial value)? initial,
    TResult Function(ClipCollectionError value)? error,
    TResult Function(ClipCollectionLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClipCollectionStateCopyWith<$Res> {
  factory $ClipCollectionStateCopyWith(
          ClipCollectionState value, $Res Function(ClipCollectionState) then) =
      _$ClipCollectionStateCopyWithImpl<$Res, ClipCollectionState>;
}

/// @nodoc
class _$ClipCollectionStateCopyWithImpl<$Res, $Val extends ClipCollectionState>
    implements $ClipCollectionStateCopyWith<$Res> {
  _$ClipCollectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ClipCollectionInitialImplCopyWith<$Res> {
  factory _$$ClipCollectionInitialImplCopyWith(
          _$ClipCollectionInitialImpl value,
          $Res Function(_$ClipCollectionInitialImpl) then) =
      __$$ClipCollectionInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClipCollectionInitialImplCopyWithImpl<$Res>
    extends _$ClipCollectionStateCopyWithImpl<$Res, _$ClipCollectionInitialImpl>
    implements _$$ClipCollectionInitialImplCopyWith<$Res> {
  __$$ClipCollectionInitialImplCopyWithImpl(_$ClipCollectionInitialImpl _value,
      $Res Function(_$ClipCollectionInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClipCollectionInitialImpl implements ClipCollectionInitial {
  const _$ClipCollectionInitialImpl();

  @override
  String toString() {
    return 'ClipCollectionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClipCollectionInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Failure failure) error,
    required TResult Function(List<ClipCollection> collections, bool hasMore,
            bool isLoading, int limit, int offset)
        loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Failure failure)? error,
    TResult? Function(List<ClipCollection> collections, bool hasMore,
            bool isLoading, int limit, int offset)?
        loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Failure failure)? error,
    TResult Function(List<ClipCollection> collections, bool hasMore,
            bool isLoading, int limit, int offset)?
        loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClipCollectionInitial value) initial,
    required TResult Function(ClipCollectionError value) error,
    required TResult Function(ClipCollectionLoaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClipCollectionInitial value)? initial,
    TResult? Function(ClipCollectionError value)? error,
    TResult? Function(ClipCollectionLoaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClipCollectionInitial value)? initial,
    TResult Function(ClipCollectionError value)? error,
    TResult Function(ClipCollectionLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ClipCollectionInitial implements ClipCollectionState {
  const factory ClipCollectionInitial() = _$ClipCollectionInitialImpl;
}

/// @nodoc
abstract class _$$ClipCollectionErrorImplCopyWith<$Res> {
  factory _$$ClipCollectionErrorImplCopyWith(_$ClipCollectionErrorImpl value,
          $Res Function(_$ClipCollectionErrorImpl) then) =
      __$$ClipCollectionErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$ClipCollectionErrorImplCopyWithImpl<$Res>
    extends _$ClipCollectionStateCopyWithImpl<$Res, _$ClipCollectionErrorImpl>
    implements _$$ClipCollectionErrorImplCopyWith<$Res> {
  __$$ClipCollectionErrorImplCopyWithImpl(_$ClipCollectionErrorImpl _value,
      $Res Function(_$ClipCollectionErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ClipCollectionErrorImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$ClipCollectionErrorImpl implements ClipCollectionError {
  const _$ClipCollectionErrorImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'ClipCollectionState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClipCollectionErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClipCollectionErrorImplCopyWith<_$ClipCollectionErrorImpl> get copyWith =>
      __$$ClipCollectionErrorImplCopyWithImpl<_$ClipCollectionErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Failure failure) error,
    required TResult Function(List<ClipCollection> collections, bool hasMore,
            bool isLoading, int limit, int offset)
        loaded,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Failure failure)? error,
    TResult? Function(List<ClipCollection> collections, bool hasMore,
            bool isLoading, int limit, int offset)?
        loaded,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Failure failure)? error,
    TResult Function(List<ClipCollection> collections, bool hasMore,
            bool isLoading, int limit, int offset)?
        loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClipCollectionInitial value) initial,
    required TResult Function(ClipCollectionError value) error,
    required TResult Function(ClipCollectionLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClipCollectionInitial value)? initial,
    TResult? Function(ClipCollectionError value)? error,
    TResult? Function(ClipCollectionLoaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClipCollectionInitial value)? initial,
    TResult Function(ClipCollectionError value)? error,
    TResult Function(ClipCollectionLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ClipCollectionError implements ClipCollectionState {
  const factory ClipCollectionError(final Failure failure) =
      _$ClipCollectionErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ClipCollectionErrorImplCopyWith<_$ClipCollectionErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClipCollectionLoadedImplCopyWith<$Res> {
  factory _$$ClipCollectionLoadedImplCopyWith(_$ClipCollectionLoadedImpl value,
          $Res Function(_$ClipCollectionLoadedImpl) then) =
      __$$ClipCollectionLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ClipCollection> collections,
      bool hasMore,
      bool isLoading,
      int limit,
      int offset});
}

/// @nodoc
class __$$ClipCollectionLoadedImplCopyWithImpl<$Res>
    extends _$ClipCollectionStateCopyWithImpl<$Res, _$ClipCollectionLoadedImpl>
    implements _$$ClipCollectionLoadedImplCopyWith<$Res> {
  __$$ClipCollectionLoadedImplCopyWithImpl(_$ClipCollectionLoadedImpl _value,
      $Res Function(_$ClipCollectionLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collections = null,
    Object? hasMore = null,
    Object? isLoading = null,
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_$ClipCollectionLoadedImpl(
      collections: null == collections
          ? _value._collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<ClipCollection>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ClipCollectionLoadedImpl implements ClipCollectionLoaded {
  const _$ClipCollectionLoadedImpl(
      {required final List<ClipCollection> collections,
      this.hasMore = true,
      this.isLoading = false,
      this.limit = 50,
      this.offset = 0})
      : _collections = collections;

  final List<ClipCollection> _collections;
  @override
  List<ClipCollection> get collections {
    if (_collections is EqualUnmodifiableListView) return _collections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collections);
  }

  @override
  @JsonKey()
  final bool hasMore;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final int offset;

  @override
  String toString() {
    return 'ClipCollectionState.loaded(collections: $collections, hasMore: $hasMore, isLoading: $isLoading, limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClipCollectionLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._collections, _collections) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_collections),
      hasMore,
      isLoading,
      limit,
      offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClipCollectionLoadedImplCopyWith<_$ClipCollectionLoadedImpl>
      get copyWith =>
          __$$ClipCollectionLoadedImplCopyWithImpl<_$ClipCollectionLoadedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Failure failure) error,
    required TResult Function(List<ClipCollection> collections, bool hasMore,
            bool isLoading, int limit, int offset)
        loaded,
  }) {
    return loaded(collections, hasMore, isLoading, limit, offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Failure failure)? error,
    TResult? Function(List<ClipCollection> collections, bool hasMore,
            bool isLoading, int limit, int offset)?
        loaded,
  }) {
    return loaded?.call(collections, hasMore, isLoading, limit, offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Failure failure)? error,
    TResult Function(List<ClipCollection> collections, bool hasMore,
            bool isLoading, int limit, int offset)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(collections, hasMore, isLoading, limit, offset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClipCollectionInitial value) initial,
    required TResult Function(ClipCollectionError value) error,
    required TResult Function(ClipCollectionLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClipCollectionInitial value)? initial,
    TResult? Function(ClipCollectionError value)? error,
    TResult? Function(ClipCollectionLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClipCollectionInitial value)? initial,
    TResult Function(ClipCollectionError value)? error,
    TResult Function(ClipCollectionLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ClipCollectionLoaded implements ClipCollectionState {
  const factory ClipCollectionLoaded(
      {required final List<ClipCollection> collections,
      final bool hasMore,
      final bool isLoading,
      final int limit,
      final int offset}) = _$ClipCollectionLoadedImpl;

  List<ClipCollection> get collections;
  bool get hasMore;
  bool get isLoading;
  int get limit;
  int get offset;
  @JsonKey(ignore: true)
  _$$ClipCollectionLoadedImplCopyWith<_$ClipCollectionLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
