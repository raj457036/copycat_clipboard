import 'package:freezed_annotation/freezed_annotation.dart';

enum ClipItemType {
  @JsonValue("text")
  text,
  @JsonValue("media")
  media, // image, video, audio
  @JsonValue("file")
  file,
  @JsonValue("url")
  url,
}
