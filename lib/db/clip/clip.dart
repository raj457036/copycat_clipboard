import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'clip.freezed.dart';
part 'clip.g.dart';

enum ClipType {
  @JsonValue("text")
  text,
  @JsonValue("url")
  url,
  @JsonValue("file")
  file,
  @JsonValue("image")
  image,
}

@freezed
@Collection(ignore: {'copyWith'})
class Clip with _$Clip {
  const Clip._();

  Id get id => Isar.autoIncrement;

  const factory Clip({
    /// common properties
    String? serverId,
    DateTime? lastSynced,
    required DateTime created,
    required DateTime modified,
    required String title,

    // specific properties

    /// text, path, url
    String? value,
    @Enumerated(EnumType.name) ClipType? clipType,
  }) = _Clip;

  factory Clip.fromJson(Map<String, dynamic> json) => _$ClipFromJson(json);
}
