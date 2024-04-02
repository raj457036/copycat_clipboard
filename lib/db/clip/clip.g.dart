// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClipImpl _$$ClipImplFromJson(Map<String, dynamic> json) => _$ClipImpl(
      localId: json['localId'] as int? ?? 0,
      id: json['id'] as String?,
      created: DateTime.parse(json['created'] as String),
      lastSynced:
          const DateTimeConverter().fromJson(json['lastSynced'] as int?),
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$ClipImplToJson(_$ClipImpl instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'id': instance.id,
      'created': instance.created.toIso8601String(),
      'lastSynced': const DateTimeConverter().toJson(instance.lastSynced),
      'text': instance.text,
    };
