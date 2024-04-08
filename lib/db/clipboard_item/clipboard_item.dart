import 'dart:io';

import 'package:clipboard/common/logging.dart';
import 'package:clipboard/db/base.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart' as p;

part 'clipboard_item.freezed.dart';
part 'clipboard_item.g.dart';

const _supportedUriSchemas = {
  "http",
  "https",
  "ftp",
  "file",
  "mailto",
  "tel",
  "data",
  "ws",
  "wss",
  "ldap",
  "urn",
  "git",
  "ssh",
  "irc",
  "news"
};

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
class ClipboardItem with _$ClipboardItem, IsarIdMixin {
  ClipboardItem._();

  factory ClipboardItem({
    @JsonKey(name: "\$id", includeToJson: false) String? serverId,
    @JsonKey(includeFromJson: false, includeToJson: false) DateTime? lastSynced,
    String? value,
    @JsonKey(includeFromJson: false, includeToJson: false) String? localPath,
    String? serverPath,
    required String userId,
    @JsonKey(name: "\$createdAt") required DateTime created,
    @JsonKey(name: "\$updatedAt") required DateTime modified,
    required String title,
    String? description,
    @Enumerated(EnumType.name) required ClipItemType type,
    DateTime? deletedAt,
  }) = _ClipboardItem;

  factory ClipboardItem.fromJson(Map<String, dynamic> json) =>
      _$ClipboardItemFromJson(json);

  factory ClipboardItem.fromText(String userId, String text) {
    return ClipboardItem(
      value: text,
      created: DateTime.now(),
      modified: DateTime.now(),
      title: "Text",
      type: ClipItemType.text,
      userId: userId,
    );
  }

  factory ClipboardItem.fromFile(
    String userId,
    String filePath, {
    bool isImage = false,
    String? preview,
  }) {
    return ClipboardItem(
      value: preview ?? filePath,
      created: DateTime.now(),
      modified: DateTime.now(),
      title: p.basename(filePath),
      type: isImage ? ClipItemType.image : ClipItemType.file,
      localPath: filePath,
      userId: userId,
    );
  }

  factory ClipboardItem.fromUri(String userId, Uri uri) {
    if (!_supportedUriSchemas.contains(uri.scheme)) {
      return ClipboardItem.fromText(userId, uri.toString());
    }

    return ClipboardItem(
      value: uri.toString(),
      created: DateTime.now(),
      modified: DateTime.now(),
      title: uri.host,
      type: ClipItemType.url,
      userId: userId,
    );
  }

  /// Removes the associated file.
  Future<void> cleanUp() async {
    try {
      if (localPath != null && type == ClipItemType.file ||
          type == ClipItemType.image) {
        final file = File(localPath!);
        if (await file.exists()) {
          await file.delete();
        }
      }
    } catch (e) {
      logger.warning("Couldn't delete file! $e");
    }
  }

  String? get fileExtension =>
      localPath != null ? p.extension(localPath!) : null;

  File? getFile() => localPath != null ? File(localPath!) : null;
}
