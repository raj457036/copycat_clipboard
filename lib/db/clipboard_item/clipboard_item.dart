import 'dart:io';

import 'package:clipboard/common/logging.dart';
import 'package:clipboard/db/base.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart' as p;

part 'clipboard_item.freezed.dart';
part 'clipboard_item.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ClipboardItem with _$ClipboardItem, IsarIdMixin {
  ClipboardItem._();

  factory ClipboardItem({
    @JsonKey(name: "\$id", includeToJson: false) String? serverId,
    @JsonKey(includeFromJson: false, includeToJson: false) DateTime? lastSynced,
    @JsonKey(includeFromJson: false, includeToJson: false) String? localPath,
    @JsonKey(name: "\$createdAt") required DateTime created,
    @JsonKey(name: "\$updatedAt") required DateTime modified,
    @Enumerated(EnumType.name) required ClipItemType type,
    required String userId,
    required String title,
    String? value,
    String? serverPath,
    String? description,
    DateTime? deletedAt,
    int? size,
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
    String? fileName,
  }) {
    final basename = p.basename(filePath);
    return ClipboardItem(
      value: preview ?? basename,
      created: DateTime.now(),
      modified: DateTime.now(),
      title: fileName ?? basename,
      type: isImage ? ClipItemType.image : ClipItemType.file,
      localPath: filePath,
      userId: userId,
    );
  }

  factory ClipboardItem.fromURL(String userId, String url) {
    return ClipboardItem(
      value: url,
      created: DateTime.now(),
      modified: DateTime.now(),
      title: url.substring(0, 35),
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

  bool get isSynced => lastSynced != null;

  File? getFile() => localPath != null ? File(localPath!) : null;
}
