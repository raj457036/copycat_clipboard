// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clipboard_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClipboardState {
  List<ClipboardItem> get items => throw _privateConstructorUsedError;
  dynamic get hasMore => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get syncing => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ClipboardItem> items, dynamic hasMore,
            int limit, int offset, bool loading, bool syncing, Failure? failure)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ClipboardItem> items, dynamic hasMore, int limit,
            int offset, bool loading, bool syncing, Failure? failure)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ClipboardItem> items, dynamic hasMore, int limit,
            int offset, bool loading, bool syncing, Failure? failure)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClipboardLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClipboardLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClipboardLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClipboardStateCopyWith<ClipboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClipboardStateCopyWith<$Res> {
  factory $ClipboardStateCopyWith(
          ClipboardState value, $Res Function(ClipboardState) then) =
      _$ClipboardStateCopyWithImpl<$Res, ClipboardState>;
  @useResult
  $Res call(
      {List<ClipboardItem> items,
      dynamic hasMore,
      int limit,
      int offset,
      bool loading,
      bool syncing,
      Failure? failure});
}

/// @nodoc
class _$ClipboardStateCopyWithImpl<$Res, $Val extends ClipboardState>
    implements $ClipboardStateCopyWith<$Res> {
  _$ClipboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? hasMore = freezed,
    Object? limit = null,
    Object? offset = null,
    Object? loading = null,
    Object? syncing = null,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ClipboardItem>,
      hasMore: freezed == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as dynamic,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      syncing: null == syncing
          ? _value.syncing
          : syncing // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClipboardLoadedStateImplCopyWith<$Res>
    implements $ClipboardStateCopyWith<$Res> {
  factory _$$ClipboardLoadedStateImplCopyWith(_$ClipboardLoadedStateImpl value,
          $Res Function(_$ClipboardLoadedStateImpl) then) =
      __$$ClipboardLoadedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ClipboardItem> items,
      dynamic hasMore,
      int limit,
      int offset,
      bool loading,
      bool syncing,
      Failure? failure});
}

/// @nodoc
class __$$ClipboardLoadedStateImplCopyWithImpl<$Res>
    extends _$ClipboardStateCopyWithImpl<$Res, _$ClipboardLoadedStateImpl>
    implements _$$ClipboardLoadedStateImplCopyWith<$Res> {
  __$$ClipboardLoadedStateImplCopyWithImpl(_$ClipboardLoadedStateImpl _value,
      $Res Function(_$ClipboardLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? hasMore = freezed,
    Object? limit = null,
    Object? offset = null,
    Object? loading = null,
    Object? syncing = null,
    Object? failure = freezed,
  }) {
    return _then(_$ClipboardLoadedStateImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ClipboardItem>,
      hasMore: freezed == hasMore ? _value.hasMore! : hasMore,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      syncing: null == syncing
          ? _value.syncing
          : syncing // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$ClipboardLoadedStateImpl implements ClipboardLoadedState {
  const _$ClipboardLoadedStateImpl(
      {required final List<ClipboardItem> items,
      this.hasMore = true,
      this.limit = 50,
      this.offset = 0,
      this.loading = true,
      this.syncing = false,
      this.failure})
      : _items = items;

  final List<ClipboardItem> _items;
  @override
  List<ClipboardItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final dynamic hasMore;
  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final int offset;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool syncing;
  @override
  final Failure? failure;

  @override
  String toString() {
    return 'ClipboardState.loaded(items: $items, hasMore: $hasMore, limit: $limit, offset: $offset, loading: $loading, syncing: $syncing, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClipboardLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other.hasMore, hasMore) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.syncing, syncing) || other.syncing == syncing) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(hasMore),
      limit,
      offset,
      loading,
      syncing,
      failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClipboardLoadedStateImplCopyWith<_$ClipboardLoadedStateImpl>
      get copyWith =>
          __$$ClipboardLoadedStateImplCopyWithImpl<_$ClipboardLoadedStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ClipboardItem> items, dynamic hasMore,
            int limit, int offset, bool loading, bool syncing, Failure? failure)
        loaded,
  }) {
    return loaded(items, hasMore, limit, offset, loading, syncing, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ClipboardItem> items, dynamic hasMore, int limit,
            int offset, bool loading, bool syncing, Failure? failure)?
        loaded,
  }) {
    return loaded?.call(
        items, hasMore, limit, offset, loading, syncing, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ClipboardItem> items, dynamic hasMore, int limit,
            int offset, bool loading, bool syncing, Failure? failure)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(items, hasMore, limit, offset, loading, syncing, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClipboardLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClipboardLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClipboardLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ClipboardLoadedState implements ClipboardState {
  const factory ClipboardLoadedState(
      {required final List<ClipboardItem> items,
      final dynamic hasMore,
      final int limit,
      final int offset,
      final bool loading,
      final bool syncing,
      final Failure? failure}) = _$ClipboardLoadedStateImpl;

  @override
  List<ClipboardItem> get items;
  @override
  dynamic get hasMore;
  @override
  int get limit;
  @override
  int get offset;
  @override
  bool get loading;
  @override
  bool get syncing;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$ClipboardLoadedStateImplCopyWith<_$ClipboardLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
