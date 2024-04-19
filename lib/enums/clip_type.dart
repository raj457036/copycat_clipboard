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

enum TextCategory {
  @JsonValue("color")
  color,
  @JsonValue("email")
  email,
  @JsonValue("phone")
  phone,
}

const colorTextCategory = "color";
const emailTextCategory = "email";
const phoneTextCategory = "phone";
