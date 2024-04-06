// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppConfigState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(AppConfig config) loaded,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(AppConfig config)? loaded,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AppConfig config)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppConfigLoading value) initial,
    required TResult Function(AppConfigLoaded value) loaded,
    required TResult Function(AppConfigError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppConfigLoading value)? initial,
    TResult? Function(AppConfigLoaded value)? loaded,
    TResult? Function(AppConfigError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppConfigLoading value)? initial,
    TResult Function(AppConfigLoaded value)? loaded,
    TResult Function(AppConfigError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigStateCopyWith<$Res> {
  factory $AppConfigStateCopyWith(
          AppConfigState value, $Res Function(AppConfigState) then) =
      _$AppConfigStateCopyWithImpl<$Res, AppConfigState>;
}

/// @nodoc
class _$AppConfigStateCopyWithImpl<$Res, $Val extends AppConfigState>
    implements $AppConfigStateCopyWith<$Res> {
  _$AppConfigStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppConfigLoadingImplCopyWith<$Res> {
  factory _$$AppConfigLoadingImplCopyWith(_$AppConfigLoadingImpl value,
          $Res Function(_$AppConfigLoadingImpl) then) =
      __$$AppConfigLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppConfigLoadingImplCopyWithImpl<$Res>
    extends _$AppConfigStateCopyWithImpl<$Res, _$AppConfigLoadingImpl>
    implements _$$AppConfigLoadingImplCopyWith<$Res> {
  __$$AppConfigLoadingImplCopyWithImpl(_$AppConfigLoadingImpl _value,
      $Res Function(_$AppConfigLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppConfigLoadingImpl implements AppConfigLoading {
  const _$AppConfigLoadingImpl();

  @override
  String toString() {
    return 'AppConfigState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppConfigLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(AppConfig config) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(AppConfig config)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AppConfig config)? loaded,
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
    required TResult Function(AppConfigLoading value) initial,
    required TResult Function(AppConfigLoaded value) loaded,
    required TResult Function(AppConfigError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppConfigLoading value)? initial,
    TResult? Function(AppConfigLoaded value)? loaded,
    TResult? Function(AppConfigError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppConfigLoading value)? initial,
    TResult Function(AppConfigLoaded value)? loaded,
    TResult Function(AppConfigError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AppConfigLoading implements AppConfigState {
  const factory AppConfigLoading() = _$AppConfigLoadingImpl;
}

/// @nodoc
abstract class _$$AppConfigLoadedImplCopyWith<$Res> {
  factory _$$AppConfigLoadedImplCopyWith(_$AppConfigLoadedImpl value,
          $Res Function(_$AppConfigLoadedImpl) then) =
      __$$AppConfigLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppConfig config});

  $AppConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$AppConfigLoadedImplCopyWithImpl<$Res>
    extends _$AppConfigStateCopyWithImpl<$Res, _$AppConfigLoadedImpl>
    implements _$$AppConfigLoadedImplCopyWith<$Res> {
  __$$AppConfigLoadedImplCopyWithImpl(
      _$AppConfigLoadedImpl _value, $Res Function(_$AppConfigLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$AppConfigLoadedImpl(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as AppConfig,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AppConfigCopyWith<$Res> get config {
    return $AppConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc

class _$AppConfigLoadedImpl implements AppConfigLoaded {
  const _$AppConfigLoadedImpl({required this.config});

  @override
  final AppConfig config;

  @override
  String toString() {
    return 'AppConfigState.loaded(config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigLoadedImpl &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigLoadedImplCopyWith<_$AppConfigLoadedImpl> get copyWith =>
      __$$AppConfigLoadedImplCopyWithImpl<_$AppConfigLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(AppConfig config) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loaded(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(AppConfig config)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loaded?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AppConfig config)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppConfigLoading value) initial,
    required TResult Function(AppConfigLoaded value) loaded,
    required TResult Function(AppConfigError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppConfigLoading value)? initial,
    TResult? Function(AppConfigLoaded value)? loaded,
    TResult? Function(AppConfigError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppConfigLoading value)? initial,
    TResult Function(AppConfigLoaded value)? loaded,
    TResult Function(AppConfigError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class AppConfigLoaded implements AppConfigState {
  const factory AppConfigLoaded({required final AppConfig config}) =
      _$AppConfigLoadedImpl;

  AppConfig get config;
  @JsonKey(ignore: true)
  _$$AppConfigLoadedImplCopyWith<_$AppConfigLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppConfigErrorImplCopyWith<$Res> {
  factory _$$AppConfigErrorImplCopyWith(_$AppConfigErrorImpl value,
          $Res Function(_$AppConfigErrorImpl) then) =
      __$$AppConfigErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$AppConfigErrorImplCopyWithImpl<$Res>
    extends _$AppConfigStateCopyWithImpl<$Res, _$AppConfigErrorImpl>
    implements _$$AppConfigErrorImplCopyWith<$Res> {
  __$$AppConfigErrorImplCopyWithImpl(
      _$AppConfigErrorImpl _value, $Res Function(_$AppConfigErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$AppConfigErrorImpl(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$AppConfigErrorImpl implements AppConfigError {
  const _$AppConfigErrorImpl({required this.failure});

  @override
  final Failure failure;

  @override
  String toString() {
    return 'AppConfigState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigErrorImplCopyWith<_$AppConfigErrorImpl> get copyWith =>
      __$$AppConfigErrorImplCopyWithImpl<_$AppConfigErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(AppConfig config) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(AppConfig config)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AppConfig config)? loaded,
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
    required TResult Function(AppConfigLoading value) initial,
    required TResult Function(AppConfigLoaded value) loaded,
    required TResult Function(AppConfigError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppConfigLoading value)? initial,
    TResult? Function(AppConfigLoaded value)? loaded,
    TResult? Function(AppConfigError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppConfigLoading value)? initial,
    TResult Function(AppConfigLoaded value)? loaded,
    TResult Function(AppConfigError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AppConfigError implements AppConfigState {
  const factory AppConfigError({required final Failure failure}) =
      _$AppConfigErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$AppConfigErrorImplCopyWith<_$AppConfigErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
