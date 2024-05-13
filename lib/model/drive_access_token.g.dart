// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drive_access_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriveAccessTokenImpl _$$DriveAccessTokenImplFromJson(
        Map<String, dynamic> json) =>
    _$DriveAccessTokenImpl(
      accessToken: json['access_token'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
      issuedAt: DateTime.parse(json['issued_at'] as String),
      scopes:
          (json['scopes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$DriveAccessTokenImplToJson(
        _$DriveAccessTokenImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
      'issued_at': instance.issuedAt.toIso8601String(),
      'scopes': instance.scopes,
    };
