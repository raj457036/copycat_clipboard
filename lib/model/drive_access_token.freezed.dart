// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drive_access_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DriveAccessToken _$DriveAccessTokenFromJson(Map<String, dynamic> json) {
  return _DriveAccessToken.fromJson(json);
}

/// @nodoc
mixin _$DriveAccessToken {
  @JsonKey(name: "access_token")
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: "expires_in")
  int get expiresIn => throw _privateConstructorUsedError;
  @JsonKey(name: "issued_at")
  DateTime get issuedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "scopes")
  List<String> get scopes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriveAccessTokenCopyWith<DriveAccessToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriveAccessTokenCopyWith<$Res> {
  factory $DriveAccessTokenCopyWith(
          DriveAccessToken value, $Res Function(DriveAccessToken) then) =
      _$DriveAccessTokenCopyWithImpl<$Res, DriveAccessToken>;
  @useResult
  $Res call(
      {@JsonKey(name: "access_token") String accessToken,
      @JsonKey(name: "expires_in") int expiresIn,
      @JsonKey(name: "issued_at") DateTime issuedAt,
      @JsonKey(name: "scopes") List<String> scopes});
}

/// @nodoc
class _$DriveAccessTokenCopyWithImpl<$Res, $Val extends DriveAccessToken>
    implements $DriveAccessTokenCopyWith<$Res> {
  _$DriveAccessTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? expiresIn = null,
    Object? issuedAt = null,
    Object? scopes = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      issuedAt: null == issuedAt
          ? _value.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scopes: null == scopes
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriveAccessTokenImplCopyWith<$Res>
    implements $DriveAccessTokenCopyWith<$Res> {
  factory _$$DriveAccessTokenImplCopyWith(_$DriveAccessTokenImpl value,
          $Res Function(_$DriveAccessTokenImpl) then) =
      __$$DriveAccessTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "access_token") String accessToken,
      @JsonKey(name: "expires_in") int expiresIn,
      @JsonKey(name: "issued_at") DateTime issuedAt,
      @JsonKey(name: "scopes") List<String> scopes});
}

/// @nodoc
class __$$DriveAccessTokenImplCopyWithImpl<$Res>
    extends _$DriveAccessTokenCopyWithImpl<$Res, _$DriveAccessTokenImpl>
    implements _$$DriveAccessTokenImplCopyWith<$Res> {
  __$$DriveAccessTokenImplCopyWithImpl(_$DriveAccessTokenImpl _value,
      $Res Function(_$DriveAccessTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? expiresIn = null,
    Object? issuedAt = null,
    Object? scopes = null,
  }) {
    return _then(_$DriveAccessTokenImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      issuedAt: null == issuedAt
          ? _value.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scopes: null == scopes
          ? _value._scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriveAccessTokenImpl extends _DriveAccessToken {
  _$DriveAccessTokenImpl(
      {@JsonKey(name: "access_token") required this.accessToken,
      @JsonKey(name: "expires_in") required this.expiresIn,
      @JsonKey(name: "issued_at") required this.issuedAt,
      @JsonKey(name: "scopes") required final List<String> scopes})
      : _scopes = scopes,
        super._();

  factory _$DriveAccessTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriveAccessTokenImplFromJson(json);

  @override
  @JsonKey(name: "access_token")
  final String accessToken;
  @override
  @JsonKey(name: "expires_in")
  final int expiresIn;
  @override
  @JsonKey(name: "issued_at")
  final DateTime issuedAt;
  final List<String> _scopes;
  @override
  @JsonKey(name: "scopes")
  List<String> get scopes {
    if (_scopes is EqualUnmodifiableListView) return _scopes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scopes);
  }

  @override
  String toString() {
    return 'DriveAccessToken(accessToken: $accessToken, expiresIn: $expiresIn, issuedAt: $issuedAt, scopes: $scopes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriveAccessTokenImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.issuedAt, issuedAt) ||
                other.issuedAt == issuedAt) &&
            const DeepCollectionEquality().equals(other._scopes, _scopes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, expiresIn, issuedAt,
      const DeepCollectionEquality().hash(_scopes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriveAccessTokenImplCopyWith<_$DriveAccessTokenImpl> get copyWith =>
      __$$DriveAccessTokenImplCopyWithImpl<_$DriveAccessTokenImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriveAccessTokenImplToJson(
      this,
    );
  }
}

abstract class _DriveAccessToken extends DriveAccessToken {
  factory _DriveAccessToken(
          {@JsonKey(name: "access_token") required final String accessToken,
          @JsonKey(name: "expires_in") required final int expiresIn,
          @JsonKey(name: "issued_at") required final DateTime issuedAt,
          @JsonKey(name: "scopes") required final List<String> scopes}) =
      _$DriveAccessTokenImpl;
  _DriveAccessToken._() : super._();

  factory _DriveAccessToken.fromJson(Map<String, dynamic> json) =
      _$DriveAccessTokenImpl.fromJson;

  @override
  @JsonKey(name: "access_token")
  String get accessToken;
  @override
  @JsonKey(name: "expires_in")
  int get expiresIn;
  @override
  @JsonKey(name: "issued_at")
  DateTime get issuedAt;
  @override
  @JsonKey(name: "scopes")
  List<String> get scopes;
  @override
  @JsonKey(ignore: true)
  _$$DriveAccessTokenImplCopyWith<_$DriveAccessTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
