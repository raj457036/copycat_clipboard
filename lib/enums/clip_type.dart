import 'package:freezed_annotation/freezed_annotation.dart';

enum ClipItemType {
  @JsonValue("text")
  text,
  @JsonValue("url")
  url,
  @JsonValue("file")
  file,
  @JsonValue("image")
  image,
}
