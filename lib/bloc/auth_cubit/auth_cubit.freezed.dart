// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(AuthUser user, String accessToken) authenticated,
    required TResult Function() localAuthenticated,
    required TResult Function() authenticating,
    required TResult Function(Failure? failure) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(AuthUser user, String accessToken)? authenticated,
    TResult? Function()? localAuthenticated,
    TResult? Function()? authenticating,
    TResult? Function(Failure? failure)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(AuthUser user, String accessToken)? authenticated,
    TResult Function()? localAuthenticated,
    TResult Function()? authenticating,
    TResult Function(Failure? failure)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownAuthState value) unknown,
    required TResult Function(AuthenticatedAuthState value) authenticated,
    required TResult Function(LocalAuthenticatedAuthState value)
        localAuthenticated,
    required TResult Function(AuthenticatingAuthState value) authenticating,
    required TResult Function(UnauthenticatedAuthState value) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknownAuthState value)? unknown,
    TResult? Function(AuthenticatedAuthState value)? authenticated,
    TResult? Function(LocalAuthenticatedAuthState value)? localAuthenticated,
    TResult? Function(AuthenticatingAuthState value)? authenticating,
    TResult? Function(UnauthenticatedAuthState value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownAuthState value)? unknown,
    TResult Function(AuthenticatedAuthState value)? authenticated,
    TResult Function(LocalAuthenticatedAuthState value)? localAuthenticated,
    TResult Function(AuthenticatingAuthState value)? authenticating,
    TResult Function(UnauthenticatedAuthState value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UnknownAuthStateImplCopyWith<$Res> {
  factory _$$UnknownAuthStateImplCopyWith(_$UnknownAuthStateImpl value,
          $Res Function(_$UnknownAuthStateImpl) then) =
      __$$UnknownAuthStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownAuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnknownAuthStateImpl>
    implements _$$UnknownAuthStateImplCopyWith<$Res> {
  __$$UnknownAuthStateImplCopyWithImpl(_$UnknownAuthStateImpl _value,
      $Res Function(_$UnknownAuthStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnknownAuthStateImpl implements UnknownAuthState {
  const _$UnknownAuthStateImpl();

  @override
  String toString() {
    return 'AuthState.unknown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnknownAuthStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(AuthUser user, String accessToken) authenticated,
    required TResult Function() localAuthenticated,
    required TResult Function() authenticating,
    required TResult Function(Failure? failure) unauthenticated,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(AuthUser user, String accessToken)? authenticated,
    TResult? Function()? localAuthenticated,
    TResult? Function()? authenticating,
    TResult? Function(Failure? failure)? unauthenticated,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(AuthUser user, String accessToken)? authenticated,
    TResult Function()? localAuthenticated,
    TResult Function()? authenticating,
    TResult Function(Failure? failure)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownAuthState value) unknown,
    required TResult Function(AuthenticatedAuthState value) authenticated,
    required TResult Function(LocalAuthenticatedAuthState value)
        localAuthenticated,
    required TResult Function(AuthenticatingAuthState value) authenticating,
    required TResult Function(UnauthenticatedAuthState value) unauthenticated,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknownAuthState value)? unknown,
    TResult? Function(AuthenticatedAuthState value)? authenticated,
    TResult? Function(LocalAuthenticatedAuthState value)? localAuthenticated,
    TResult? Function(AuthenticatingAuthState value)? authenticating,
    TResult? Function(UnauthenticatedAuthState value)? unauthenticated,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownAuthState value)? unknown,
    TResult Function(AuthenticatedAuthState value)? authenticated,
    TResult Function(LocalAuthenticatedAuthState value)? localAuthenticated,
    TResult Function(AuthenticatingAuthState value)? authenticating,
    TResult Function(UnauthenticatedAuthState value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownAuthState implements AuthState {
  const factory UnknownAuthState() = _$UnknownAuthStateImpl;
}

/// @nodoc
abstract class _$$AuthenticatedAuthStateImplCopyWith<$Res> {
  factory _$$AuthenticatedAuthStateImplCopyWith(
          _$AuthenticatedAuthStateImpl value,
          $Res Function(_$AuthenticatedAuthStateImpl) then) =
      __$$AuthenticatedAuthStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthUser user, String accessToken});

  $AuthUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthenticatedAuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatedAuthStateImpl>
    implements _$$AuthenticatedAuthStateImplCopyWith<$Res> {
  __$$AuthenticatedAuthStateImplCopyWithImpl(
      _$AuthenticatedAuthStateImpl _value,
      $Res Function(_$AuthenticatedAuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? accessToken = null,
  }) {
    return _then(_$AuthenticatedAuthStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthUser,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthUserCopyWith<$Res> get user {
    return $AuthUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthenticatedAuthStateImpl implements AuthenticatedAuthState {
  const _$AuthenticatedAuthStateImpl(
      {required this.user, required this.accessToken});

  @override
  final AuthUser user;
  @override
  final String accessToken;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user, accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedAuthStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, accessToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedAuthStateImplCopyWith<_$AuthenticatedAuthStateImpl>
      get copyWith => __$$AuthenticatedAuthStateImplCopyWithImpl<
          _$AuthenticatedAuthStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(AuthUser user, String accessToken) authenticated,
    required TResult Function() localAuthenticated,
    required TResult Function() authenticating,
    required TResult Function(Failure? failure) unauthenticated,
  }) {
    return authenticated(user, accessToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(AuthUser user, String accessToken)? authenticated,
    TResult? Function()? localAuthenticated,
    TResult? Function()? authenticating,
    TResult? Function(Failure? failure)? unauthenticated,
  }) {
    return authenticated?.call(user, accessToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(AuthUser user, String accessToken)? authenticated,
    TResult Function()? localAuthenticated,
    TResult Function()? authenticating,
    TResult Function(Failure? failure)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user, accessToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownAuthState value) unknown,
    required TResult Function(AuthenticatedAuthState value) authenticated,
    required TResult Function(LocalAuthenticatedAuthState value)
        localAuthenticated,
    required TResult Function(AuthenticatingAuthState value) authenticating,
    required TResult Function(UnauthenticatedAuthState value) unauthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknownAuthState value)? unknown,
    TResult? Function(AuthenticatedAuthState value)? authenticated,
    TResult? Function(LocalAuthenticatedAuthState value)? localAuthenticated,
    TResult? Function(AuthenticatingAuthState value)? authenticating,
    TResult? Function(UnauthenticatedAuthState value)? unauthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownAuthState value)? unknown,
    TResult Function(AuthenticatedAuthState value)? authenticated,
    TResult Function(LocalAuthenticatedAuthState value)? localAuthenticated,
    TResult Function(AuthenticatingAuthState value)? authenticating,
    TResult Function(UnauthenticatedAuthState value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthenticatedAuthState implements AuthState {
  const factory AuthenticatedAuthState(
      {required final AuthUser user,
      required final String accessToken}) = _$AuthenticatedAuthStateImpl;

  AuthUser get user;
  String get accessToken;
  @JsonKey(ignore: true)
  _$$AuthenticatedAuthStateImplCopyWith<_$AuthenticatedAuthStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocalAuthenticatedAuthStateImplCopyWith<$Res> {
  factory _$$LocalAuthenticatedAuthStateImplCopyWith(
          _$LocalAuthenticatedAuthStateImpl value,
          $Res Function(_$LocalAuthenticatedAuthStateImpl) then) =
      __$$LocalAuthenticatedAuthStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LocalAuthenticatedAuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LocalAuthenticatedAuthStateImpl>
    implements _$$LocalAuthenticatedAuthStateImplCopyWith<$Res> {
  __$$LocalAuthenticatedAuthStateImplCopyWithImpl(
      _$LocalAuthenticatedAuthStateImpl _value,
      $Res Function(_$LocalAuthenticatedAuthStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LocalAuthenticatedAuthStateImpl implements LocalAuthenticatedAuthState {
  const _$LocalAuthenticatedAuthStateImpl();

  @override
  String toString() {
    return 'AuthState.localAuthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalAuthenticatedAuthStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(AuthUser user, String accessToken) authenticated,
    required TResult Function() localAuthenticated,
    required TResult Function() authenticating,
    required TResult Function(Failure? failure) unauthenticated,
  }) {
    return localAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(AuthUser user, String accessToken)? authenticated,
    TResult? Function()? localAuthenticated,
    TResult? Function()? authenticating,
    TResult? Function(Failure? failure)? unauthenticated,
  }) {
    return localAuthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(AuthUser user, String accessToken)? authenticated,
    TResult Function()? localAuthenticated,
    TResult Function()? authenticating,
    TResult Function(Failure? failure)? unauthenticated,
    required TResult orElse(),
  }) {
    if (localAuthenticated != null) {
      return localAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownAuthState value) unknown,
    required TResult Function(AuthenticatedAuthState value) authenticated,
    required TResult Function(LocalAuthenticatedAuthState value)
        localAuthenticated,
    required TResult Function(AuthenticatingAuthState value) authenticating,
    required TResult Function(UnauthenticatedAuthState value) unauthenticated,
  }) {
    return localAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknownAuthState value)? unknown,
    TResult? Function(AuthenticatedAuthState value)? authenticated,
    TResult? Function(LocalAuthenticatedAuthState value)? localAuthenticated,
    TResult? Function(AuthenticatingAuthState value)? authenticating,
    TResult? Function(UnauthenticatedAuthState value)? unauthenticated,
  }) {
    return localAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownAuthState value)? unknown,
    TResult Function(AuthenticatedAuthState value)? authenticated,
    TResult Function(LocalAuthenticatedAuthState value)? localAuthenticated,
    TResult Function(AuthenticatingAuthState value)? authenticating,
    TResult Function(UnauthenticatedAuthState value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (localAuthenticated != null) {
      return localAuthenticated(this);
    }
    return orElse();
  }
}

abstract class LocalAuthenticatedAuthState implements AuthState {
  const factory LocalAuthenticatedAuthState() =
      _$LocalAuthenticatedAuthStateImpl;
}

/// @nodoc
abstract class _$$AuthenticatingAuthStateImplCopyWith<$Res> {
  factory _$$AuthenticatingAuthStateImplCopyWith(
          _$AuthenticatingAuthStateImpl value,
          $Res Function(_$AuthenticatingAuthStateImpl) then) =
      __$$AuthenticatingAuthStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthenticatingAuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatingAuthStateImpl>
    implements _$$AuthenticatingAuthStateImplCopyWith<$Res> {
  __$$AuthenticatingAuthStateImplCopyWithImpl(
      _$AuthenticatingAuthStateImpl _value,
      $Res Function(_$AuthenticatingAuthStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthenticatingAuthStateImpl implements AuthenticatingAuthState {
  const _$AuthenticatingAuthStateImpl();

  @override
  String toString() {
    return 'AuthState.authenticating()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatingAuthStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(AuthUser user, String accessToken) authenticated,
    required TResult Function() localAuthenticated,
    required TResult Function() authenticating,
    required TResult Function(Failure? failure) unauthenticated,
  }) {
    return authenticating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(AuthUser user, String accessToken)? authenticated,
    TResult? Function()? localAuthenticated,
    TResult? Function()? authenticating,
    TResult? Function(Failure? failure)? unauthenticated,
  }) {
    return authenticating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(AuthUser user, String accessToken)? authenticated,
    TResult Function()? localAuthenticated,
    TResult Function()? authenticating,
    TResult Function(Failure? failure)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticating != null) {
      return authenticating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownAuthState value) unknown,
    required TResult Function(AuthenticatedAuthState value) authenticated,
    required TResult Function(LocalAuthenticatedAuthState value)
        localAuthenticated,
    required TResult Function(AuthenticatingAuthState value) authenticating,
    required TResult Function(UnauthenticatedAuthState value) unauthenticated,
  }) {
    return authenticating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknownAuthState value)? unknown,
    TResult? Function(AuthenticatedAuthState value)? authenticated,
    TResult? Function(LocalAuthenticatedAuthState value)? localAuthenticated,
    TResult? Function(AuthenticatingAuthState value)? authenticating,
    TResult? Function(UnauthenticatedAuthState value)? unauthenticated,
  }) {
    return authenticating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownAuthState value)? unknown,
    TResult Function(AuthenticatedAuthState value)? authenticated,
    TResult Function(LocalAuthenticatedAuthState value)? localAuthenticated,
    TResult Function(AuthenticatingAuthState value)? authenticating,
    TResult Function(UnauthenticatedAuthState value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticating != null) {
      return authenticating(this);
    }
    return orElse();
  }
}

abstract class AuthenticatingAuthState implements AuthState {
  const factory AuthenticatingAuthState() = _$AuthenticatingAuthStateImpl;
}

/// @nodoc
abstract class _$$UnauthenticatedAuthStateImplCopyWith<$Res> {
  factory _$$UnauthenticatedAuthStateImplCopyWith(
          _$UnauthenticatedAuthStateImpl value,
          $Res Function(_$UnauthenticatedAuthStateImpl) then) =
      __$$UnauthenticatedAuthStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure? failure});
}

/// @nodoc
class __$$UnauthenticatedAuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnauthenticatedAuthStateImpl>
    implements _$$UnauthenticatedAuthStateImplCopyWith<$Res> {
  __$$UnauthenticatedAuthStateImplCopyWithImpl(
      _$UnauthenticatedAuthStateImpl _value,
      $Res Function(_$UnauthenticatedAuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$UnauthenticatedAuthStateImpl(
      freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$UnauthenticatedAuthStateImpl implements UnauthenticatedAuthState {
  const _$UnauthenticatedAuthStateImpl([this.failure]);

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'AuthState.unauthenticated(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthenticatedAuthStateImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthenticatedAuthStateImplCopyWith<_$UnauthenticatedAuthStateImpl>
      get copyWith => __$$UnauthenticatedAuthStateImplCopyWithImpl<
          _$UnauthenticatedAuthStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(AuthUser user, String accessToken) authenticated,
    required TResult Function() localAuthenticated,
    required TResult Function() authenticating,
    required TResult Function(Failure? failure) unauthenticated,
  }) {
    return unauthenticated(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(AuthUser user, String accessToken)? authenticated,
    TResult? Function()? localAuthenticated,
    TResult? Function()? authenticating,
    TResult? Function(Failure? failure)? unauthenticated,
  }) {
    return unauthenticated?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(AuthUser user, String accessToken)? authenticated,
    TResult Function()? localAuthenticated,
    TResult Function()? authenticating,
    TResult Function(Failure? failure)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownAuthState value) unknown,
    required TResult Function(AuthenticatedAuthState value) authenticated,
    required TResult Function(LocalAuthenticatedAuthState value)
        localAuthenticated,
    required TResult Function(AuthenticatingAuthState value) authenticating,
    required TResult Function(UnauthenticatedAuthState value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknownAuthState value)? unknown,
    TResult? Function(AuthenticatedAuthState value)? authenticated,
    TResult? Function(LocalAuthenticatedAuthState value)? localAuthenticated,
    TResult? Function(AuthenticatingAuthState value)? authenticating,
    TResult? Function(UnauthenticatedAuthState value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownAuthState value)? unknown,
    TResult Function(AuthenticatedAuthState value)? authenticated,
    TResult Function(LocalAuthenticatedAuthState value)? localAuthenticated,
    TResult Function(AuthenticatingAuthState value)? authenticating,
    TResult Function(UnauthenticatedAuthState value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class UnauthenticatedAuthState implements AuthState {
  const factory UnauthenticatedAuthState([final Failure? failure]) =
      _$UnauthenticatedAuthStateImpl;

  Failure? get failure;
  @JsonKey(ignore: true)
  _$$UnauthenticatedAuthStateImplCopyWith<_$UnauthenticatedAuthStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
