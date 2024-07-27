// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drive_setup_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DriveSetupState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool waiting) unknown,
    required TResult Function() fetching,
    required TResult Function(String code, List<String> scopes) verifyingCode,
    required TResult Function() refreshingToken,
    required TResult Function(DriveAccessToken token) setupDone,
    required TResult Function(Failure failure) setupError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool waiting)? unknown,
    TResult? Function()? fetching,
    TResult? Function(String code, List<String> scopes)? verifyingCode,
    TResult? Function()? refreshingToken,
    TResult? Function(DriveAccessToken token)? setupDone,
    TResult? Function(Failure failure)? setupError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool waiting)? unknown,
    TResult Function()? fetching,
    TResult Function(String code, List<String> scopes)? verifyingCode,
    TResult Function()? refreshingToken,
    TResult Function(DriveAccessToken token)? setupDone,
    TResult Function(Failure failure)? setupError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DriveSetupUnknown value) unknown,
    required TResult Function(DriveSetupFetching value) fetching,
    required TResult Function(DriveSetupVerifyingCode value) verifyingCode,
    required TResult Function(DriveSetupRefreshingToken value) refreshingToken,
    required TResult Function(DriveSetupDone value) setupDone,
    required TResult Function(DriveSetupError value) setupError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DriveSetupUnknown value)? unknown,
    TResult? Function(DriveSetupFetching value)? fetching,
    TResult? Function(DriveSetupVerifyingCode value)? verifyingCode,
    TResult? Function(DriveSetupRefreshingToken value)? refreshingToken,
    TResult? Function(DriveSetupDone value)? setupDone,
    TResult? Function(DriveSetupError value)? setupError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DriveSetupUnknown value)? unknown,
    TResult Function(DriveSetupFetching value)? fetching,
    TResult Function(DriveSetupVerifyingCode value)? verifyingCode,
    TResult Function(DriveSetupRefreshingToken value)? refreshingToken,
    TResult Function(DriveSetupDone value)? setupDone,
    TResult Function(DriveSetupError value)? setupError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriveSetupStateCopyWith<$Res> {
  factory $DriveSetupStateCopyWith(
          DriveSetupState value, $Res Function(DriveSetupState) then) =
      _$DriveSetupStateCopyWithImpl<$Res, DriveSetupState>;
}

/// @nodoc
class _$DriveSetupStateCopyWithImpl<$Res, $Val extends DriveSetupState>
    implements $DriveSetupStateCopyWith<$Res> {
  _$DriveSetupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DriveSetupUnknownImplCopyWith<$Res> {
  factory _$$DriveSetupUnknownImplCopyWith(_$DriveSetupUnknownImpl value,
          $Res Function(_$DriveSetupUnknownImpl) then) =
      __$$DriveSetupUnknownImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool waiting});
}

/// @nodoc
class __$$DriveSetupUnknownImplCopyWithImpl<$Res>
    extends _$DriveSetupStateCopyWithImpl<$Res, _$DriveSetupUnknownImpl>
    implements _$$DriveSetupUnknownImplCopyWith<$Res> {
  __$$DriveSetupUnknownImplCopyWithImpl(_$DriveSetupUnknownImpl _value,
      $Res Function(_$DriveSetupUnknownImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? waiting = null,
  }) {
    return _then(_$DriveSetupUnknownImpl(
      waiting: null == waiting
          ? _value.waiting
          : waiting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DriveSetupUnknownImpl implements DriveSetupUnknown {
  const _$DriveSetupUnknownImpl({this.waiting = false});

  @override
  @JsonKey()
  final bool waiting;

  @override
  String toString() {
    return 'DriveSetupState.unknown(waiting: $waiting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriveSetupUnknownImpl &&
            (identical(other.waiting, waiting) || other.waiting == waiting));
  }

  @override
  int get hashCode => Object.hash(runtimeType, waiting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriveSetupUnknownImplCopyWith<_$DriveSetupUnknownImpl> get copyWith =>
      __$$DriveSetupUnknownImplCopyWithImpl<_$DriveSetupUnknownImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool waiting) unknown,
    required TResult Function() fetching,
    required TResult Function(String code, List<String> scopes) verifyingCode,
    required TResult Function() refreshingToken,
    required TResult Function(DriveAccessToken token) setupDone,
    required TResult Function(Failure failure) setupError,
  }) {
    return unknown(waiting);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool waiting)? unknown,
    TResult? Function()? fetching,
    TResult? Function(String code, List<String> scopes)? verifyingCode,
    TResult? Function()? refreshingToken,
    TResult? Function(DriveAccessToken token)? setupDone,
    TResult? Function(Failure failure)? setupError,
  }) {
    return unknown?.call(waiting);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool waiting)? unknown,
    TResult Function()? fetching,
    TResult Function(String code, List<String> scopes)? verifyingCode,
    TResult Function()? refreshingToken,
    TResult Function(DriveAccessToken token)? setupDone,
    TResult Function(Failure failure)? setupError,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(waiting);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DriveSetupUnknown value) unknown,
    required TResult Function(DriveSetupFetching value) fetching,
    required TResult Function(DriveSetupVerifyingCode value) verifyingCode,
    required TResult Function(DriveSetupRefreshingToken value) refreshingToken,
    required TResult Function(DriveSetupDone value) setupDone,
    required TResult Function(DriveSetupError value) setupError,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DriveSetupUnknown value)? unknown,
    TResult? Function(DriveSetupFetching value)? fetching,
    TResult? Function(DriveSetupVerifyingCode value)? verifyingCode,
    TResult? Function(DriveSetupRefreshingToken value)? refreshingToken,
    TResult? Function(DriveSetupDone value)? setupDone,
    TResult? Function(DriveSetupError value)? setupError,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DriveSetupUnknown value)? unknown,
    TResult Function(DriveSetupFetching value)? fetching,
    TResult Function(DriveSetupVerifyingCode value)? verifyingCode,
    TResult Function(DriveSetupRefreshingToken value)? refreshingToken,
    TResult Function(DriveSetupDone value)? setupDone,
    TResult Function(DriveSetupError value)? setupError,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class DriveSetupUnknown implements DriveSetupState {
  const factory DriveSetupUnknown({final bool waiting}) =
      _$DriveSetupUnknownImpl;

  bool get waiting;
  @JsonKey(ignore: true)
  _$$DriveSetupUnknownImplCopyWith<_$DriveSetupUnknownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DriveSetupFetchingImplCopyWith<$Res> {
  factory _$$DriveSetupFetchingImplCopyWith(_$DriveSetupFetchingImpl value,
          $Res Function(_$DriveSetupFetchingImpl) then) =
      __$$DriveSetupFetchingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DriveSetupFetchingImplCopyWithImpl<$Res>
    extends _$DriveSetupStateCopyWithImpl<$Res, _$DriveSetupFetchingImpl>
    implements _$$DriveSetupFetchingImplCopyWith<$Res> {
  __$$DriveSetupFetchingImplCopyWithImpl(_$DriveSetupFetchingImpl _value,
      $Res Function(_$DriveSetupFetchingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DriveSetupFetchingImpl implements DriveSetupFetching {
  const _$DriveSetupFetchingImpl();

  @override
  String toString() {
    return 'DriveSetupState.fetching()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DriveSetupFetchingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool waiting) unknown,
    required TResult Function() fetching,
    required TResult Function(String code, List<String> scopes) verifyingCode,
    required TResult Function() refreshingToken,
    required TResult Function(DriveAccessToken token) setupDone,
    required TResult Function(Failure failure) setupError,
  }) {
    return fetching();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool waiting)? unknown,
    TResult? Function()? fetching,
    TResult? Function(String code, List<String> scopes)? verifyingCode,
    TResult? Function()? refreshingToken,
    TResult? Function(DriveAccessToken token)? setupDone,
    TResult? Function(Failure failure)? setupError,
  }) {
    return fetching?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool waiting)? unknown,
    TResult Function()? fetching,
    TResult Function(String code, List<String> scopes)? verifyingCode,
    TResult Function()? refreshingToken,
    TResult Function(DriveAccessToken token)? setupDone,
    TResult Function(Failure failure)? setupError,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DriveSetupUnknown value) unknown,
    required TResult Function(DriveSetupFetching value) fetching,
    required TResult Function(DriveSetupVerifyingCode value) verifyingCode,
    required TResult Function(DriveSetupRefreshingToken value) refreshingToken,
    required TResult Function(DriveSetupDone value) setupDone,
    required TResult Function(DriveSetupError value) setupError,
  }) {
    return fetching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DriveSetupUnknown value)? unknown,
    TResult? Function(DriveSetupFetching value)? fetching,
    TResult? Function(DriveSetupVerifyingCode value)? verifyingCode,
    TResult? Function(DriveSetupRefreshingToken value)? refreshingToken,
    TResult? Function(DriveSetupDone value)? setupDone,
    TResult? Function(DriveSetupError value)? setupError,
  }) {
    return fetching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DriveSetupUnknown value)? unknown,
    TResult Function(DriveSetupFetching value)? fetching,
    TResult Function(DriveSetupVerifyingCode value)? verifyingCode,
    TResult Function(DriveSetupRefreshingToken value)? refreshingToken,
    TResult Function(DriveSetupDone value)? setupDone,
    TResult Function(DriveSetupError value)? setupError,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(this);
    }
    return orElse();
  }
}

abstract class DriveSetupFetching implements DriveSetupState {
  const factory DriveSetupFetching() = _$DriveSetupFetchingImpl;
}

/// @nodoc
abstract class _$$DriveSetupVerifyingCodeImplCopyWith<$Res> {
  factory _$$DriveSetupVerifyingCodeImplCopyWith(
          _$DriveSetupVerifyingCodeImpl value,
          $Res Function(_$DriveSetupVerifyingCodeImpl) then) =
      __$$DriveSetupVerifyingCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code, List<String> scopes});
}

/// @nodoc
class __$$DriveSetupVerifyingCodeImplCopyWithImpl<$Res>
    extends _$DriveSetupStateCopyWithImpl<$Res, _$DriveSetupVerifyingCodeImpl>
    implements _$$DriveSetupVerifyingCodeImplCopyWith<$Res> {
  __$$DriveSetupVerifyingCodeImplCopyWithImpl(
      _$DriveSetupVerifyingCodeImpl _value,
      $Res Function(_$DriveSetupVerifyingCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? scopes = null,
  }) {
    return _then(_$DriveSetupVerifyingCodeImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      scopes: null == scopes
          ? _value._scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$DriveSetupVerifyingCodeImpl implements DriveSetupVerifyingCode {
  const _$DriveSetupVerifyingCodeImpl(
      {required this.code, required final List<String> scopes})
      : _scopes = scopes;

  @override
  final String code;
  final List<String> _scopes;
  @override
  List<String> get scopes {
    if (_scopes is EqualUnmodifiableListView) return _scopes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scopes);
  }

  @override
  String toString() {
    return 'DriveSetupState.verifyingCode(code: $code, scopes: $scopes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriveSetupVerifyingCodeImpl &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._scopes, _scopes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, code, const DeepCollectionEquality().hash(_scopes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriveSetupVerifyingCodeImplCopyWith<_$DriveSetupVerifyingCodeImpl>
      get copyWith => __$$DriveSetupVerifyingCodeImplCopyWithImpl<
          _$DriveSetupVerifyingCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool waiting) unknown,
    required TResult Function() fetching,
    required TResult Function(String code, List<String> scopes) verifyingCode,
    required TResult Function() refreshingToken,
    required TResult Function(DriveAccessToken token) setupDone,
    required TResult Function(Failure failure) setupError,
  }) {
    return verifyingCode(code, scopes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool waiting)? unknown,
    TResult? Function()? fetching,
    TResult? Function(String code, List<String> scopes)? verifyingCode,
    TResult? Function()? refreshingToken,
    TResult? Function(DriveAccessToken token)? setupDone,
    TResult? Function(Failure failure)? setupError,
  }) {
    return verifyingCode?.call(code, scopes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool waiting)? unknown,
    TResult Function()? fetching,
    TResult Function(String code, List<String> scopes)? verifyingCode,
    TResult Function()? refreshingToken,
    TResult Function(DriveAccessToken token)? setupDone,
    TResult Function(Failure failure)? setupError,
    required TResult orElse(),
  }) {
    if (verifyingCode != null) {
      return verifyingCode(code, scopes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DriveSetupUnknown value) unknown,
    required TResult Function(DriveSetupFetching value) fetching,
    required TResult Function(DriveSetupVerifyingCode value) verifyingCode,
    required TResult Function(DriveSetupRefreshingToken value) refreshingToken,
    required TResult Function(DriveSetupDone value) setupDone,
    required TResult Function(DriveSetupError value) setupError,
  }) {
    return verifyingCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DriveSetupUnknown value)? unknown,
    TResult? Function(DriveSetupFetching value)? fetching,
    TResult? Function(DriveSetupVerifyingCode value)? verifyingCode,
    TResult? Function(DriveSetupRefreshingToken value)? refreshingToken,
    TResult? Function(DriveSetupDone value)? setupDone,
    TResult? Function(DriveSetupError value)? setupError,
  }) {
    return verifyingCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DriveSetupUnknown value)? unknown,
    TResult Function(DriveSetupFetching value)? fetching,
    TResult Function(DriveSetupVerifyingCode value)? verifyingCode,
    TResult Function(DriveSetupRefreshingToken value)? refreshingToken,
    TResult Function(DriveSetupDone value)? setupDone,
    TResult Function(DriveSetupError value)? setupError,
    required TResult orElse(),
  }) {
    if (verifyingCode != null) {
      return verifyingCode(this);
    }
    return orElse();
  }
}

abstract class DriveSetupVerifyingCode implements DriveSetupState {
  const factory DriveSetupVerifyingCode(
      {required final String code,
      required final List<String> scopes}) = _$DriveSetupVerifyingCodeImpl;

  String get code;
  List<String> get scopes;
  @JsonKey(ignore: true)
  _$$DriveSetupVerifyingCodeImplCopyWith<_$DriveSetupVerifyingCodeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DriveSetupRefreshingTokenImplCopyWith<$Res> {
  factory _$$DriveSetupRefreshingTokenImplCopyWith(
          _$DriveSetupRefreshingTokenImpl value,
          $Res Function(_$DriveSetupRefreshingTokenImpl) then) =
      __$$DriveSetupRefreshingTokenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DriveSetupRefreshingTokenImplCopyWithImpl<$Res>
    extends _$DriveSetupStateCopyWithImpl<$Res, _$DriveSetupRefreshingTokenImpl>
    implements _$$DriveSetupRefreshingTokenImplCopyWith<$Res> {
  __$$DriveSetupRefreshingTokenImplCopyWithImpl(
      _$DriveSetupRefreshingTokenImpl _value,
      $Res Function(_$DriveSetupRefreshingTokenImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DriveSetupRefreshingTokenImpl implements DriveSetupRefreshingToken {
  const _$DriveSetupRefreshingTokenImpl();

  @override
  String toString() {
    return 'DriveSetupState.refreshingToken()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriveSetupRefreshingTokenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool waiting) unknown,
    required TResult Function() fetching,
    required TResult Function(String code, List<String> scopes) verifyingCode,
    required TResult Function() refreshingToken,
    required TResult Function(DriveAccessToken token) setupDone,
    required TResult Function(Failure failure) setupError,
  }) {
    return refreshingToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool waiting)? unknown,
    TResult? Function()? fetching,
    TResult? Function(String code, List<String> scopes)? verifyingCode,
    TResult? Function()? refreshingToken,
    TResult? Function(DriveAccessToken token)? setupDone,
    TResult? Function(Failure failure)? setupError,
  }) {
    return refreshingToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool waiting)? unknown,
    TResult Function()? fetching,
    TResult Function(String code, List<String> scopes)? verifyingCode,
    TResult Function()? refreshingToken,
    TResult Function(DriveAccessToken token)? setupDone,
    TResult Function(Failure failure)? setupError,
    required TResult orElse(),
  }) {
    if (refreshingToken != null) {
      return refreshingToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DriveSetupUnknown value) unknown,
    required TResult Function(DriveSetupFetching value) fetching,
    required TResult Function(DriveSetupVerifyingCode value) verifyingCode,
    required TResult Function(DriveSetupRefreshingToken value) refreshingToken,
    required TResult Function(DriveSetupDone value) setupDone,
    required TResult Function(DriveSetupError value) setupError,
  }) {
    return refreshingToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DriveSetupUnknown value)? unknown,
    TResult? Function(DriveSetupFetching value)? fetching,
    TResult? Function(DriveSetupVerifyingCode value)? verifyingCode,
    TResult? Function(DriveSetupRefreshingToken value)? refreshingToken,
    TResult? Function(DriveSetupDone value)? setupDone,
    TResult? Function(DriveSetupError value)? setupError,
  }) {
    return refreshingToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DriveSetupUnknown value)? unknown,
    TResult Function(DriveSetupFetching value)? fetching,
    TResult Function(DriveSetupVerifyingCode value)? verifyingCode,
    TResult Function(DriveSetupRefreshingToken value)? refreshingToken,
    TResult Function(DriveSetupDone value)? setupDone,
    TResult Function(DriveSetupError value)? setupError,
    required TResult orElse(),
  }) {
    if (refreshingToken != null) {
      return refreshingToken(this);
    }
    return orElse();
  }
}

abstract class DriveSetupRefreshingToken implements DriveSetupState {
  const factory DriveSetupRefreshingToken() = _$DriveSetupRefreshingTokenImpl;
}

/// @nodoc
abstract class _$$DriveSetupDoneImplCopyWith<$Res> {
  factory _$$DriveSetupDoneImplCopyWith(_$DriveSetupDoneImpl value,
          $Res Function(_$DriveSetupDoneImpl) then) =
      __$$DriveSetupDoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DriveAccessToken token});

  $DriveAccessTokenCopyWith<$Res> get token;
}

/// @nodoc
class __$$DriveSetupDoneImplCopyWithImpl<$Res>
    extends _$DriveSetupStateCopyWithImpl<$Res, _$DriveSetupDoneImpl>
    implements _$$DriveSetupDoneImplCopyWith<$Res> {
  __$$DriveSetupDoneImplCopyWithImpl(
      _$DriveSetupDoneImpl _value, $Res Function(_$DriveSetupDoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$DriveSetupDoneImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as DriveAccessToken,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DriveAccessTokenCopyWith<$Res> get token {
    return $DriveAccessTokenCopyWith<$Res>(_value.token, (value) {
      return _then(_value.copyWith(token: value));
    });
  }
}

/// @nodoc

class _$DriveSetupDoneImpl implements DriveSetupDone {
  const _$DriveSetupDoneImpl({required this.token});

  @override
  final DriveAccessToken token;

  @override
  String toString() {
    return 'DriveSetupState.setupDone(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriveSetupDoneImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriveSetupDoneImplCopyWith<_$DriveSetupDoneImpl> get copyWith =>
      __$$DriveSetupDoneImplCopyWithImpl<_$DriveSetupDoneImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool waiting) unknown,
    required TResult Function() fetching,
    required TResult Function(String code, List<String> scopes) verifyingCode,
    required TResult Function() refreshingToken,
    required TResult Function(DriveAccessToken token) setupDone,
    required TResult Function(Failure failure) setupError,
  }) {
    return setupDone(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool waiting)? unknown,
    TResult? Function()? fetching,
    TResult? Function(String code, List<String> scopes)? verifyingCode,
    TResult? Function()? refreshingToken,
    TResult? Function(DriveAccessToken token)? setupDone,
    TResult? Function(Failure failure)? setupError,
  }) {
    return setupDone?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool waiting)? unknown,
    TResult Function()? fetching,
    TResult Function(String code, List<String> scopes)? verifyingCode,
    TResult Function()? refreshingToken,
    TResult Function(DriveAccessToken token)? setupDone,
    TResult Function(Failure failure)? setupError,
    required TResult orElse(),
  }) {
    if (setupDone != null) {
      return setupDone(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DriveSetupUnknown value) unknown,
    required TResult Function(DriveSetupFetching value) fetching,
    required TResult Function(DriveSetupVerifyingCode value) verifyingCode,
    required TResult Function(DriveSetupRefreshingToken value) refreshingToken,
    required TResult Function(DriveSetupDone value) setupDone,
    required TResult Function(DriveSetupError value) setupError,
  }) {
    return setupDone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DriveSetupUnknown value)? unknown,
    TResult? Function(DriveSetupFetching value)? fetching,
    TResult? Function(DriveSetupVerifyingCode value)? verifyingCode,
    TResult? Function(DriveSetupRefreshingToken value)? refreshingToken,
    TResult? Function(DriveSetupDone value)? setupDone,
    TResult? Function(DriveSetupError value)? setupError,
  }) {
    return setupDone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DriveSetupUnknown value)? unknown,
    TResult Function(DriveSetupFetching value)? fetching,
    TResult Function(DriveSetupVerifyingCode value)? verifyingCode,
    TResult Function(DriveSetupRefreshingToken value)? refreshingToken,
    TResult Function(DriveSetupDone value)? setupDone,
    TResult Function(DriveSetupError value)? setupError,
    required TResult orElse(),
  }) {
    if (setupDone != null) {
      return setupDone(this);
    }
    return orElse();
  }
}

abstract class DriveSetupDone implements DriveSetupState {
  const factory DriveSetupDone({required final DriveAccessToken token}) =
      _$DriveSetupDoneImpl;

  DriveAccessToken get token;
  @JsonKey(ignore: true)
  _$$DriveSetupDoneImplCopyWith<_$DriveSetupDoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DriveSetupErrorImplCopyWith<$Res> {
  factory _$$DriveSetupErrorImplCopyWith(_$DriveSetupErrorImpl value,
          $Res Function(_$DriveSetupErrorImpl) then) =
      __$$DriveSetupErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$DriveSetupErrorImplCopyWithImpl<$Res>
    extends _$DriveSetupStateCopyWithImpl<$Res, _$DriveSetupErrorImpl>
    implements _$$DriveSetupErrorImplCopyWith<$Res> {
  __$$DriveSetupErrorImplCopyWithImpl(
      _$DriveSetupErrorImpl _value, $Res Function(_$DriveSetupErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$DriveSetupErrorImpl(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$DriveSetupErrorImpl implements DriveSetupError {
  const _$DriveSetupErrorImpl({required this.failure});

  @override
  final Failure failure;

  @override
  String toString() {
    return 'DriveSetupState.setupError(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriveSetupErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriveSetupErrorImplCopyWith<_$DriveSetupErrorImpl> get copyWith =>
      __$$DriveSetupErrorImplCopyWithImpl<_$DriveSetupErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool waiting) unknown,
    required TResult Function() fetching,
    required TResult Function(String code, List<String> scopes) verifyingCode,
    required TResult Function() refreshingToken,
    required TResult Function(DriveAccessToken token) setupDone,
    required TResult Function(Failure failure) setupError,
  }) {
    return setupError(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool waiting)? unknown,
    TResult? Function()? fetching,
    TResult? Function(String code, List<String> scopes)? verifyingCode,
    TResult? Function()? refreshingToken,
    TResult? Function(DriveAccessToken token)? setupDone,
    TResult? Function(Failure failure)? setupError,
  }) {
    return setupError?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool waiting)? unknown,
    TResult Function()? fetching,
    TResult Function(String code, List<String> scopes)? verifyingCode,
    TResult Function()? refreshingToken,
    TResult Function(DriveAccessToken token)? setupDone,
    TResult Function(Failure failure)? setupError,
    required TResult orElse(),
  }) {
    if (setupError != null) {
      return setupError(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DriveSetupUnknown value) unknown,
    required TResult Function(DriveSetupFetching value) fetching,
    required TResult Function(DriveSetupVerifyingCode value) verifyingCode,
    required TResult Function(DriveSetupRefreshingToken value) refreshingToken,
    required TResult Function(DriveSetupDone value) setupDone,
    required TResult Function(DriveSetupError value) setupError,
  }) {
    return setupError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DriveSetupUnknown value)? unknown,
    TResult? Function(DriveSetupFetching value)? fetching,
    TResult? Function(DriveSetupVerifyingCode value)? verifyingCode,
    TResult? Function(DriveSetupRefreshingToken value)? refreshingToken,
    TResult? Function(DriveSetupDone value)? setupDone,
    TResult? Function(DriveSetupError value)? setupError,
  }) {
    return setupError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DriveSetupUnknown value)? unknown,
    TResult Function(DriveSetupFetching value)? fetching,
    TResult Function(DriveSetupVerifyingCode value)? verifyingCode,
    TResult Function(DriveSetupRefreshingToken value)? refreshingToken,
    TResult Function(DriveSetupDone value)? setupDone,
    TResult Function(DriveSetupError value)? setupError,
    required TResult orElse(),
  }) {
    if (setupError != null) {
      return setupError(this);
    }
    return orElse();
  }
}

abstract class DriveSetupError implements DriveSetupState {
  const factory DriveSetupError({required final Failure failure}) =
      _$DriveSetupErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$DriveSetupErrorImplCopyWith<_$DriveSetupErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
