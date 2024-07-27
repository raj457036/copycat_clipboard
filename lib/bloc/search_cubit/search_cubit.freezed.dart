// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String query, List<String>? textCategories,
            List<ClipItemType>? types)
        searching,
    required TResult Function(
            String query,
            List<String>? textCategories,
            List<ClipItemType>? types,
            List<ClipboardItem> results,
            bool hasMore,
            bool isLoading,
            int offset)
        results,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String query, List<String>? textCategories,
            List<ClipItemType>? types)?
        searching,
    TResult? Function(
            String query,
            List<String>? textCategories,
            List<ClipItemType>? types,
            List<ClipboardItem> results,
            bool hasMore,
            bool isLoading,
            int offset)?
        results,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String query, List<String>? textCategories,
            List<ClipItemType>? types)?
        searching,
    TResult Function(
            String query,
            List<String>? textCategories,
            List<ClipItemType>? types,
            List<ClipboardItem> results,
            bool hasMore,
            bool isLoading,
            int offset)?
        results,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSearchState value) initial,
    required TResult Function(SearchingState value) searching,
    required TResult Function(SearchResultState value) results,
    required TResult Function(SearchErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialSearchState value)? initial,
    TResult? Function(SearchingState value)? searching,
    TResult? Function(SearchResultState value)? results,
    TResult? Function(SearchErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSearchState value)? initial,
    TResult Function(SearchingState value)? searching,
    TResult Function(SearchResultState value)? results,
    TResult Function(SearchErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialSearchStateImplCopyWith<$Res> {
  factory _$$InitialSearchStateImplCopyWith(_$InitialSearchStateImpl value,
          $Res Function(_$InitialSearchStateImpl) then) =
      __$$InitialSearchStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialSearchStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$InitialSearchStateImpl>
    implements _$$InitialSearchStateImplCopyWith<$Res> {
  __$$InitialSearchStateImplCopyWithImpl(_$InitialSearchStateImpl _value,
      $Res Function(_$InitialSearchStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialSearchStateImpl implements InitialSearchState {
  const _$InitialSearchStateImpl();

  @override
  String toString() {
    return 'SearchState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialSearchStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String query, List<String>? textCategories,
            List<ClipItemType>? types)
        searching,
    required TResult Function(
            String query,
            List<String>? textCategories,
            List<ClipItemType>? types,
            List<ClipboardItem> results,
            bool hasMore,
            bool isLoading,
            int offset)
        results,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String query, List<String>? textCategories,
            List<ClipItemType>? types)?
        searching,
    TResult? Function(
            String query,
            List<String>? textCategories,
            List<ClipItemType>? types,
            List<ClipboardItem> results,
            bool hasMore,
            bool isLoading,
            int offset)?
        results,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String query, List<String>? textCategories,
            List<ClipItemType>? types)?
        searching,
    TResult Function(
            String query,
            List<String>? textCategories,
            List<ClipItemType>? types,
            List<ClipboardItem> results,
            bool hasMore,
            bool isLoading,
            int offset)?
        results,
    TResult Function(Failure failure)? error,
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
    required TResult Function(InitialSearchState value) initial,
    required TResult Function(SearchingState value) searching,
    required TResult Function(SearchResultState value) results,
    required TResult Function(SearchErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialSearchState value)? initial,
    TResult? Function(SearchingState value)? searching,
    TResult? Function(SearchResultState value)? results,
    TResult? Function(SearchErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSearchState value)? initial,
    TResult Function(SearchingState value)? searching,
    TResult Function(SearchResultState value)? results,
    TResult Function(SearchErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialSearchState implements SearchState {
  const factory InitialSearchState() = _$InitialSearchStateImpl;
}

/// @nodoc
abstract class _$$SearchingStateImplCopyWith<$Res> {
  factory _$$SearchingStateImplCopyWith(_$SearchingStateImpl value,
          $Res Function(_$SearchingStateImpl) then) =
      __$$SearchingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String query, List<String>? textCategories, List<ClipItemType>? types});
}

/// @nodoc
class __$$SearchingStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchingStateImpl>
    implements _$$SearchingStateImplCopyWith<$Res> {
  __$$SearchingStateImplCopyWithImpl(
      _$SearchingStateImpl _value, $Res Function(_$SearchingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? textCategories = freezed,
    Object? types = freezed,
  }) {
    return _then(_$SearchingStateImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      textCategories: freezed == textCategories
          ? _value._textCategories
          : textCategories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<ClipItemType>?,
    ));
  }
}

/// @nodoc

class _$SearchingStateImpl implements SearchingState {
  const _$SearchingStateImpl(
      {required this.query,
      final List<String>? textCategories,
      final List<ClipItemType>? types})
      : _textCategories = textCategories,
        _types = types;

  @override
  final String query;
  final List<String>? _textCategories;
  @override
  List<String>? get textCategories {
    final value = _textCategories;
    if (value == null) return null;
    if (_textCategories is EqualUnmodifiableListView) return _textCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ClipItemType>? _types;
  @override
  List<ClipItemType>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchState.searching(query: $query, textCategories: $textCategories, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchingStateImpl &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality()
                .equals(other._textCategories, _textCategories) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      query,
      const DeepCollectionEquality().hash(_textCategories),
      const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchingStateImplCopyWith<_$SearchingStateImpl> get copyWith =>
      __$$SearchingStateImplCopyWithImpl<_$SearchingStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String query, List<String>? textCategories,
            List<ClipItemType>? types)
        searching,
    required TResult Function(
            String query,
            List<String>? textCategories,
            List<ClipItemType>? types,
            List<ClipboardItem> results,
            bool hasMore,
            bool isLoading,
            int offset)
        results,
    required TResult Function(Failure failure) error,
  }) {
    return searching(query, textCategories, types);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String query, List<String>? textCategories,
            List<ClipItemType>? types)?
        searching,
    TResult? Function(
            String query,
            List<String>? textCategories,
            List<ClipItemType>? types,
            List<ClipboardItem> results,
            bool hasMore,
            bool isLoading,
            int offset)?
        results,
    TResult? Function(Failure failure)? error,
  }) {
    return searching?.call(query, textCategories, types);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String query, List<String>? textCategories,
            List<ClipItemType>? types)?
        searching,
    TResult Function(
            String query,
            List<String>? textCategories,
            List<ClipItemType>? types,
            List<ClipboardItem> results,
            bool hasMore,
            bool isLoading,
            int offset)?
        results,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (searching != null) {
      return searching(query, textCategories, types);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSearchState value) initial,
    required TResult Function(SearchingState value) searching,
    required TResult Function(SearchResultState value) results,
    required TResult Function(SearchErrorState value) error,
  }) {
    return searching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialSearchState value)? initial,
    TResult? Function(SearchingState value)? searching,
    TResult? Function(SearchResultState value)? results,
    TResult? Function(SearchErrorState value)? error,
  }) {
    return searching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSearchState value)? initial,
    TResult Function(SearchingState value)? searching,
    TResult Function(SearchResultState value)? results,
    TResult Function(SearchErrorState value)? error,
    required TResult orElse(),
  }) {
    if (searching != null) {
      return searching(this);
    }
    return orElse();
  }
}

abstract class SearchingState implements SearchState {
  const factory SearchingState(
      {required final String query,
      final List<String>? textCategories,
      final List<ClipItemType>? types}) = _$SearchingStateImpl;

  String get query;
  List<String>? get textCategories;
  List<ClipItemType>? get types;
  @JsonKey(ignore: true)
  _$$SearchingStateImplCopyWith<_$SearchingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchResultStateImplCopyWith<$Res> {
  factory _$$SearchResultStateImplCopyWith(_$SearchResultStateImpl value,
          $Res Function(_$SearchResultStateImpl) then) =
      __$$SearchResultStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String query,
      List<String>? textCategories,
      List<ClipItemType>? types,
      List<ClipboardItem> results,
      bool hasMore,
      bool isLoading,
      int offset});
}

/// @nodoc
class __$$SearchResultStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchResultStateImpl>
    implements _$$SearchResultStateImplCopyWith<$Res> {
  __$$SearchResultStateImplCopyWithImpl(_$SearchResultStateImpl _value,
      $Res Function(_$SearchResultStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? textCategories = freezed,
    Object? types = freezed,
    Object? results = null,
    Object? hasMore = null,
    Object? isLoading = null,
    Object? offset = null,
  }) {
    return _then(_$SearchResultStateImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      textCategories: freezed == textCategories
          ? _value._textCategories
          : textCategories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<ClipItemType>?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ClipboardItem>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchResultStateImpl implements SearchResultState {
  const _$SearchResultStateImpl(
      {required this.query,
      final List<String>? textCategories,
      final List<ClipItemType>? types,
      required final List<ClipboardItem> results,
      this.hasMore = false,
      this.isLoading = false,
      this.offset = 0})
      : _textCategories = textCategories,
        _types = types,
        _results = results;

  @override
  final String query;
  final List<String>? _textCategories;
  @override
  List<String>? get textCategories {
    final value = _textCategories;
    if (value == null) return null;
    if (_textCategories is EqualUnmodifiableListView) return _textCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ClipItemType>? _types;
  @override
  List<ClipItemType>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ClipboardItem> _results;
  @override
  List<ClipboardItem> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey()
  final bool hasMore;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int offset;

  @override
  String toString() {
    return 'SearchState.results(query: $query, textCategories: $textCategories, types: $types, results: $results, hasMore: $hasMore, isLoading: $isLoading, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultStateImpl &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality()
                .equals(other._textCategories, _textCategories) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      query,
      const DeepCollectionEquality().hash(_textCategories),
      const DeepCollectionEquality().hash(_types),
      const DeepCollectionEquality().hash(_results),
      hasMore,
      isLoading,
      offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultStateImplCopyWith<_$SearchResultStateImpl> get copyWith =>
      __$$SearchResultStateImplCopyWithImpl<_$SearchResultStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String query, List<String>? textCategories,
            List<ClipItemType>? types)
        searching,
    required TResult Function(
            String query,
            List<String>? textCategories,
            List<ClipItemType>? types,
            List<ClipboardItem> results,
            bool hasMore,
            bool isLoading,
            int offset)
        results,
    required TResult Function(Failure failure) error,
  }) {
    return results(
        query, textCategories, types, this.results, hasMore, isLoading, offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String query, List<String>? textCategories,
            List<ClipItemType>? types)?
        searching,
    TResult? Function(
            String query,
            List<String>? textCategories,
            List<ClipItemType>? types,
            List<ClipboardItem> results,
            bool hasMore,
            bool isLoading,
            int offset)?
        results,
    TResult? Function(Failure failure)? error,
  }) {
    return results?.call(
        query, textCategories, types, this.results, hasMore, isLoading, offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String query, List<String>? textCategories,
            List<ClipItemType>? types)?
        searching,
    TResult Function(
            String query,
            List<String>? textCategories,
            List<ClipItemType>? types,
            List<ClipboardItem> results,
            bool hasMore,
            bool isLoading,
            int offset)?
        results,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (results != null) {
      return results(query, textCategories, types, this.results, hasMore,
          isLoading, offset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialSearchState value) initial,
    required TResult Function(SearchingState value) searching,
    required TResult Function(SearchResultState value) results,
    required TResult Function(SearchErrorState value) error,
  }) {
    return results(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialSearchState value)? initial,
    TResult? Function(SearchingState value)? searching,
    TResult? Function(SearchResultState value)? results,
    TResult? Function(SearchErrorState value)? error,
  }) {
    return results?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSearchState value)? initial,
    TResult Function(SearchingState value)? searching,
    TResult Function(SearchResultState value)? results,
    TResult Function(SearchErrorState value)? error,
    required TResult orElse(),
  }) {
    if (results != null) {
      return results(this);
    }
    return orElse();
  }
}

abstract class SearchResultState implements SearchState {
  const factory SearchResultState(
      {required final String query,
      final List<String>? textCategories,
      final List<ClipItemType>? types,
      required final List<ClipboardItem> results,
      final bool hasMore,
      final bool isLoading,
      final int offset}) = _$SearchResultStateImpl;

  String get query;
  List<String>? get textCategories;
  List<ClipItemType>? get types;
  List<ClipboardItem> get results;
  bool get hasMore;
  bool get isLoading;
  int get offset;
  @JsonKey(ignore: true)
  _$$SearchResultStateImplCopyWith<_$SearchResultStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchErrorStateImplCopyWith<$Res> {
  factory _$$SearchErrorStateImplCopyWith(_$SearchErrorStateImpl value,
          $Res Function(_$SearchErrorStateImpl) then) =
      __$$SearchErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$SearchErrorStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchErrorStateImpl>
    implements _$$SearchErrorStateImplCopyWith<$Res> {
  __$$SearchErrorStateImplCopyWithImpl(_$SearchErrorStateImpl _value,
      $Res Function(_$SearchErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$SearchErrorStateImpl(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$SearchErrorStateImpl implements SearchErrorState {
  const _$SearchErrorStateImpl({required this.failure});

  @override
  final Failure failure;

  @override
  String toString() {
    return 'SearchState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchErrorStateImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchErrorStateImplCopyWith<_$SearchErrorStateImpl> get copyWith =>
      __$$SearchErrorStateImplCopyWithImpl<_$SearchErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String query, List<String>? textCategories,
            List<ClipItemType>? types)
        searching,
    required TResult Function(
            String query,
            List<String>? textCategories,
            List<ClipItemType>? types,
            List<ClipboardItem> results,
            bool hasMore,
            bool isLoading,
            int offset)
        results,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String query, List<String>? textCategories,
            List<ClipItemType>? types)?
        searching,
    TResult? Function(
            String query,
            List<String>? textCategories,
            List<ClipItemType>? types,
            List<ClipboardItem> results,
            bool hasMore,
            bool isLoading,
            int offset)?
        results,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String query, List<String>? textCategories,
            List<ClipItemType>? types)?
        searching,
    TResult Function(
            String query,
            List<String>? textCategories,
            List<ClipItemType>? types,
            List<ClipboardItem> results,
            bool hasMore,
            bool isLoading,
            int offset)?
        results,
    TResult Function(Failure failure)? error,
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
    required TResult Function(InitialSearchState value) initial,
    required TResult Function(SearchingState value) searching,
    required TResult Function(SearchResultState value) results,
    required TResult Function(SearchErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialSearchState value)? initial,
    TResult? Function(SearchingState value)? searching,
    TResult? Function(SearchResultState value)? results,
    TResult? Function(SearchErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialSearchState value)? initial,
    TResult Function(SearchingState value)? searching,
    TResult Function(SearchResultState value)? results,
    TResult Function(SearchErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SearchErrorState implements SearchState {
  const factory SearchErrorState({required final Failure failure}) =
      _$SearchErrorStateImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$SearchErrorStateImplCopyWith<_$SearchErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
