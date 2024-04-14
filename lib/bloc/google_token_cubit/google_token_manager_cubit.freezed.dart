// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_token_manager_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GoogleTokenManagerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notAvailable,
    required TResult Function() loading,
    required TResult Function(
            String token, String refreshToken, DateTime expiry)
        loaded,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notAvailable,
    TResult? Function()? loading,
    TResult? Function(String token, String refreshToken, DateTime expiry)?
        loaded,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notAvailable,
    TResult Function()? loading,
    TResult Function(String token, String refreshToken, DateTime expiry)?
        loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoogleTokenManagerInitialState value) initial,
    required TResult Function(GoogleTokenManagerNotAvailableState value)
        notAvailable,
    required TResult Function(GoogleTokenManagerLoadingState value) loading,
    required TResult Function(GoogleTokenManagerLoadedState value) loaded,
    required TResult Function(GoogleTokenManagerErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleTokenManagerInitialState value)? initial,
    TResult? Function(GoogleTokenManagerNotAvailableState value)? notAvailable,
    TResult? Function(GoogleTokenManagerLoadingState value)? loading,
    TResult? Function(GoogleTokenManagerLoadedState value)? loaded,
    TResult? Function(GoogleTokenManagerErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleTokenManagerInitialState value)? initial,
    TResult Function(GoogleTokenManagerNotAvailableState value)? notAvailable,
    TResult Function(GoogleTokenManagerLoadingState value)? loading,
    TResult Function(GoogleTokenManagerLoadedState value)? loaded,
    TResult Function(GoogleTokenManagerErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleTokenManagerStateCopyWith<$Res> {
  factory $GoogleTokenManagerStateCopyWith(GoogleTokenManagerState value,
          $Res Function(GoogleTokenManagerState) then) =
      _$GoogleTokenManagerStateCopyWithImpl<$Res, GoogleTokenManagerState>;
}

/// @nodoc
class _$GoogleTokenManagerStateCopyWithImpl<$Res,
        $Val extends GoogleTokenManagerState>
    implements $GoogleTokenManagerStateCopyWith<$Res> {
  _$GoogleTokenManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GoogleTokenManagerInitialStateImplCopyWith<$Res> {
  factory _$$GoogleTokenManagerInitialStateImplCopyWith(
          _$GoogleTokenManagerInitialStateImpl value,
          $Res Function(_$GoogleTokenManagerInitialStateImpl) then) =
      __$$GoogleTokenManagerInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleTokenManagerInitialStateImplCopyWithImpl<$Res>
    extends _$GoogleTokenManagerStateCopyWithImpl<$Res,
        _$GoogleTokenManagerInitialStateImpl>
    implements _$$GoogleTokenManagerInitialStateImplCopyWith<$Res> {
  __$$GoogleTokenManagerInitialStateImplCopyWithImpl(
      _$GoogleTokenManagerInitialStateImpl _value,
      $Res Function(_$GoogleTokenManagerInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleTokenManagerInitialStateImpl
    implements GoogleTokenManagerInitialState {
  const _$GoogleTokenManagerInitialStateImpl();

  @override
  String toString() {
    return 'GoogleTokenManagerState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleTokenManagerInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notAvailable,
    required TResult Function() loading,
    required TResult Function(
            String token, String refreshToken, DateTime expiry)
        loaded,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notAvailable,
    TResult? Function()? loading,
    TResult? Function(String token, String refreshToken, DateTime expiry)?
        loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notAvailable,
    TResult Function()? loading,
    TResult Function(String token, String refreshToken, DateTime expiry)?
        loaded,
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
    required TResult Function(GoogleTokenManagerInitialState value) initial,
    required TResult Function(GoogleTokenManagerNotAvailableState value)
        notAvailable,
    required TResult Function(GoogleTokenManagerLoadingState value) loading,
    required TResult Function(GoogleTokenManagerLoadedState value) loaded,
    required TResult Function(GoogleTokenManagerErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleTokenManagerInitialState value)? initial,
    TResult? Function(GoogleTokenManagerNotAvailableState value)? notAvailable,
    TResult? Function(GoogleTokenManagerLoadingState value)? loading,
    TResult? Function(GoogleTokenManagerLoadedState value)? loaded,
    TResult? Function(GoogleTokenManagerErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleTokenManagerInitialState value)? initial,
    TResult Function(GoogleTokenManagerNotAvailableState value)? notAvailable,
    TResult Function(GoogleTokenManagerLoadingState value)? loading,
    TResult Function(GoogleTokenManagerLoadedState value)? loaded,
    TResult Function(GoogleTokenManagerErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GoogleTokenManagerInitialState
    implements GoogleTokenManagerState {
  const factory GoogleTokenManagerInitialState() =
      _$GoogleTokenManagerInitialStateImpl;
}

/// @nodoc
abstract class _$$GoogleTokenManagerNotAvailableStateImplCopyWith<$Res> {
  factory _$$GoogleTokenManagerNotAvailableStateImplCopyWith(
          _$GoogleTokenManagerNotAvailableStateImpl value,
          $Res Function(_$GoogleTokenManagerNotAvailableStateImpl) then) =
      __$$GoogleTokenManagerNotAvailableStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleTokenManagerNotAvailableStateImplCopyWithImpl<$Res>
    extends _$GoogleTokenManagerStateCopyWithImpl<$Res,
        _$GoogleTokenManagerNotAvailableStateImpl>
    implements _$$GoogleTokenManagerNotAvailableStateImplCopyWith<$Res> {
  __$$GoogleTokenManagerNotAvailableStateImplCopyWithImpl(
      _$GoogleTokenManagerNotAvailableStateImpl _value,
      $Res Function(_$GoogleTokenManagerNotAvailableStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleTokenManagerNotAvailableStateImpl
    implements GoogleTokenManagerNotAvailableState {
  const _$GoogleTokenManagerNotAvailableStateImpl();

  @override
  String toString() {
    return 'GoogleTokenManagerState.notAvailable()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleTokenManagerNotAvailableStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notAvailable,
    required TResult Function() loading,
    required TResult Function(
            String token, String refreshToken, DateTime expiry)
        loaded,
    required TResult Function(Failure failure) error,
  }) {
    return notAvailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notAvailable,
    TResult? Function()? loading,
    TResult? Function(String token, String refreshToken, DateTime expiry)?
        loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return notAvailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notAvailable,
    TResult Function()? loading,
    TResult Function(String token, String refreshToken, DateTime expiry)?
        loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (notAvailable != null) {
      return notAvailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoogleTokenManagerInitialState value) initial,
    required TResult Function(GoogleTokenManagerNotAvailableState value)
        notAvailable,
    required TResult Function(GoogleTokenManagerLoadingState value) loading,
    required TResult Function(GoogleTokenManagerLoadedState value) loaded,
    required TResult Function(GoogleTokenManagerErrorState value) error,
  }) {
    return notAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleTokenManagerInitialState value)? initial,
    TResult? Function(GoogleTokenManagerNotAvailableState value)? notAvailable,
    TResult? Function(GoogleTokenManagerLoadingState value)? loading,
    TResult? Function(GoogleTokenManagerLoadedState value)? loaded,
    TResult? Function(GoogleTokenManagerErrorState value)? error,
  }) {
    return notAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleTokenManagerInitialState value)? initial,
    TResult Function(GoogleTokenManagerNotAvailableState value)? notAvailable,
    TResult Function(GoogleTokenManagerLoadingState value)? loading,
    TResult Function(GoogleTokenManagerLoadedState value)? loaded,
    TResult Function(GoogleTokenManagerErrorState value)? error,
    required TResult orElse(),
  }) {
    if (notAvailable != null) {
      return notAvailable(this);
    }
    return orElse();
  }
}

abstract class GoogleTokenManagerNotAvailableState
    implements GoogleTokenManagerState {
  const factory GoogleTokenManagerNotAvailableState() =
      _$GoogleTokenManagerNotAvailableStateImpl;
}

/// @nodoc
abstract class _$$GoogleTokenManagerLoadingStateImplCopyWith<$Res> {
  factory _$$GoogleTokenManagerLoadingStateImplCopyWith(
          _$GoogleTokenManagerLoadingStateImpl value,
          $Res Function(_$GoogleTokenManagerLoadingStateImpl) then) =
      __$$GoogleTokenManagerLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleTokenManagerLoadingStateImplCopyWithImpl<$Res>
    extends _$GoogleTokenManagerStateCopyWithImpl<$Res,
        _$GoogleTokenManagerLoadingStateImpl>
    implements _$$GoogleTokenManagerLoadingStateImplCopyWith<$Res> {
  __$$GoogleTokenManagerLoadingStateImplCopyWithImpl(
      _$GoogleTokenManagerLoadingStateImpl _value,
      $Res Function(_$GoogleTokenManagerLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleTokenManagerLoadingStateImpl
    implements GoogleTokenManagerLoadingState {
  const _$GoogleTokenManagerLoadingStateImpl();

  @override
  String toString() {
    return 'GoogleTokenManagerState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleTokenManagerLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notAvailable,
    required TResult Function() loading,
    required TResult Function(
            String token, String refreshToken, DateTime expiry)
        loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notAvailable,
    TResult? Function()? loading,
    TResult? Function(String token, String refreshToken, DateTime expiry)?
        loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notAvailable,
    TResult Function()? loading,
    TResult Function(String token, String refreshToken, DateTime expiry)?
        loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoogleTokenManagerInitialState value) initial,
    required TResult Function(GoogleTokenManagerNotAvailableState value)
        notAvailable,
    required TResult Function(GoogleTokenManagerLoadingState value) loading,
    required TResult Function(GoogleTokenManagerLoadedState value) loaded,
    required TResult Function(GoogleTokenManagerErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleTokenManagerInitialState value)? initial,
    TResult? Function(GoogleTokenManagerNotAvailableState value)? notAvailable,
    TResult? Function(GoogleTokenManagerLoadingState value)? loading,
    TResult? Function(GoogleTokenManagerLoadedState value)? loaded,
    TResult? Function(GoogleTokenManagerErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleTokenManagerInitialState value)? initial,
    TResult Function(GoogleTokenManagerNotAvailableState value)? notAvailable,
    TResult Function(GoogleTokenManagerLoadingState value)? loading,
    TResult Function(GoogleTokenManagerLoadedState value)? loaded,
    TResult Function(GoogleTokenManagerErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GoogleTokenManagerLoadingState
    implements GoogleTokenManagerState {
  const factory GoogleTokenManagerLoadingState() =
      _$GoogleTokenManagerLoadingStateImpl;
}

/// @nodoc
abstract class _$$GoogleTokenManagerLoadedStateImplCopyWith<$Res> {
  factory _$$GoogleTokenManagerLoadedStateImplCopyWith(
          _$GoogleTokenManagerLoadedStateImpl value,
          $Res Function(_$GoogleTokenManagerLoadedStateImpl) then) =
      __$$GoogleTokenManagerLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String token, String refreshToken, DateTime expiry});
}

/// @nodoc
class __$$GoogleTokenManagerLoadedStateImplCopyWithImpl<$Res>
    extends _$GoogleTokenManagerStateCopyWithImpl<$Res,
        _$GoogleTokenManagerLoadedStateImpl>
    implements _$$GoogleTokenManagerLoadedStateImplCopyWith<$Res> {
  __$$GoogleTokenManagerLoadedStateImplCopyWithImpl(
      _$GoogleTokenManagerLoadedStateImpl _value,
      $Res Function(_$GoogleTokenManagerLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? refreshToken = null,
    Object? expiry = null,
  }) {
    return _then(_$GoogleTokenManagerLoadedStateImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiry: null == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$GoogleTokenManagerLoadedStateImpl
    implements GoogleTokenManagerLoadedState {
  const _$GoogleTokenManagerLoadedStateImpl(
      {required this.token, required this.refreshToken, required this.expiry});

  @override
  final String token;
  @override
  final String refreshToken;
  @override
  final DateTime expiry;

  @override
  String toString() {
    return 'GoogleTokenManagerState.loaded(token: $token, refreshToken: $refreshToken, expiry: $expiry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleTokenManagerLoadedStateImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiry, expiry) || other.expiry == expiry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token, refreshToken, expiry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleTokenManagerLoadedStateImplCopyWith<
          _$GoogleTokenManagerLoadedStateImpl>
      get copyWith => __$$GoogleTokenManagerLoadedStateImplCopyWithImpl<
          _$GoogleTokenManagerLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notAvailable,
    required TResult Function() loading,
    required TResult Function(
            String token, String refreshToken, DateTime expiry)
        loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loaded(token, refreshToken, expiry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notAvailable,
    TResult? Function()? loading,
    TResult? Function(String token, String refreshToken, DateTime expiry)?
        loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loaded?.call(token, refreshToken, expiry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notAvailable,
    TResult Function()? loading,
    TResult Function(String token, String refreshToken, DateTime expiry)?
        loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(token, refreshToken, expiry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoogleTokenManagerInitialState value) initial,
    required TResult Function(GoogleTokenManagerNotAvailableState value)
        notAvailable,
    required TResult Function(GoogleTokenManagerLoadingState value) loading,
    required TResult Function(GoogleTokenManagerLoadedState value) loaded,
    required TResult Function(GoogleTokenManagerErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleTokenManagerInitialState value)? initial,
    TResult? Function(GoogleTokenManagerNotAvailableState value)? notAvailable,
    TResult? Function(GoogleTokenManagerLoadingState value)? loading,
    TResult? Function(GoogleTokenManagerLoadedState value)? loaded,
    TResult? Function(GoogleTokenManagerErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleTokenManagerInitialState value)? initial,
    TResult Function(GoogleTokenManagerNotAvailableState value)? notAvailable,
    TResult Function(GoogleTokenManagerLoadingState value)? loading,
    TResult Function(GoogleTokenManagerLoadedState value)? loaded,
    TResult Function(GoogleTokenManagerErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class GoogleTokenManagerLoadedState
    implements GoogleTokenManagerState {
  const factory GoogleTokenManagerLoadedState(
      {required final String token,
      required final String refreshToken,
      required final DateTime expiry}) = _$GoogleTokenManagerLoadedStateImpl;

  String get token;
  String get refreshToken;
  DateTime get expiry;
  @JsonKey(ignore: true)
  _$$GoogleTokenManagerLoadedStateImplCopyWith<
          _$GoogleTokenManagerLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GoogleTokenManagerErrorStateImplCopyWith<$Res> {
  factory _$$GoogleTokenManagerErrorStateImplCopyWith(
          _$GoogleTokenManagerErrorStateImpl value,
          $Res Function(_$GoogleTokenManagerErrorStateImpl) then) =
      __$$GoogleTokenManagerErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$GoogleTokenManagerErrorStateImplCopyWithImpl<$Res>
    extends _$GoogleTokenManagerStateCopyWithImpl<$Res,
        _$GoogleTokenManagerErrorStateImpl>
    implements _$$GoogleTokenManagerErrorStateImplCopyWith<$Res> {
  __$$GoogleTokenManagerErrorStateImplCopyWithImpl(
      _$GoogleTokenManagerErrorStateImpl _value,
      $Res Function(_$GoogleTokenManagerErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$GoogleTokenManagerErrorStateImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$GoogleTokenManagerErrorStateImpl
    implements GoogleTokenManagerErrorState {
  const _$GoogleTokenManagerErrorStateImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'GoogleTokenManagerState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleTokenManagerErrorStateImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleTokenManagerErrorStateImplCopyWith<
          _$GoogleTokenManagerErrorStateImpl>
      get copyWith => __$$GoogleTokenManagerErrorStateImplCopyWithImpl<
          _$GoogleTokenManagerErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notAvailable,
    required TResult Function() loading,
    required TResult Function(
            String token, String refreshToken, DateTime expiry)
        loaded,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notAvailable,
    TResult? Function()? loading,
    TResult? Function(String token, String refreshToken, DateTime expiry)?
        loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notAvailable,
    TResult Function()? loading,
    TResult Function(String token, String refreshToken, DateTime expiry)?
        loaded,
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
    required TResult Function(GoogleTokenManagerInitialState value) initial,
    required TResult Function(GoogleTokenManagerNotAvailableState value)
        notAvailable,
    required TResult Function(GoogleTokenManagerLoadingState value) loading,
    required TResult Function(GoogleTokenManagerLoadedState value) loaded,
    required TResult Function(GoogleTokenManagerErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleTokenManagerInitialState value)? initial,
    TResult? Function(GoogleTokenManagerNotAvailableState value)? notAvailable,
    TResult? Function(GoogleTokenManagerLoadingState value)? loading,
    TResult? Function(GoogleTokenManagerLoadedState value)? loaded,
    TResult? Function(GoogleTokenManagerErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleTokenManagerInitialState value)? initial,
    TResult Function(GoogleTokenManagerNotAvailableState value)? notAvailable,
    TResult Function(GoogleTokenManagerLoadingState value)? loading,
    TResult Function(GoogleTokenManagerLoadedState value)? loaded,
    TResult Function(GoogleTokenManagerErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GoogleTokenManagerErrorState implements GoogleTokenManagerState {
  const factory GoogleTokenManagerErrorState(final Failure failure) =
      _$GoogleTokenManagerErrorStateImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$GoogleTokenManagerErrorStateImplCopyWith<
          _$GoogleTokenManagerErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
