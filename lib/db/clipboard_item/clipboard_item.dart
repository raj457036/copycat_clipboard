import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'clipboard_item.freezed.dart';
part 'clipboard_item.g.dart';

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

@freezed
@Collection(ignore: {'copyWith'})
class ClipboardItem with _$ClipboardItem {
  const ClipboardItem._();

  Id get id => Isar.autoIncrement;

  const factory ClipboardItem({
    /// common properties
    String? serverId,
    DateTime? lastSynced,
    required DateTime created,
    required DateTime modified,
    required String title,
    String? localPath,

    /// text, path, url
    String? value,
    @Enumerated(EnumType.name) required ClipItemType type,
  }) = _ClipboardItem;

  factory ClipboardItem.fromJson(Map<String, dynamic> json) =>
      _$ClipboardItemFromJson(json);

  factory ClipboardItem.fromText(String text) {
    return ClipboardItem(
      value: text,
      created: DateTime.now(),
      modified: DateTime.now(),
      title: "Text",
      type: ClipItemType.text,
    );
  }
}
