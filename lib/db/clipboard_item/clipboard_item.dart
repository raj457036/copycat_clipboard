import 'dart:io';

import 'package:clipboard/common/logging.dart';
import 'package:clipboard/db/base.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/enums/platform_os.dart';
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
    String? title,
    String? description,
    DateTime? deletedAt,
    @Default(false) bool encrypted,
    // Text related
    String? text,
    String? url,
    // Files related
    String? fileName,
    String? fileMimeType,
    String? fileExtension,
    String? driveFileId,
    int? fileSize, // in KB
    String? imgBlurHash, // only for image

    // Source Information
    String? sourceUrl,
    String? sourceApp,
    @Enumerated(EnumType.name) required PlatformOS os,

    // local only
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool localOnly,

    // Stats
    @Default(0) int copiedCount,
    DateTime? lastCopied,

    // non persistant state
    @ignore
    @JsonKey(includeFromJson: false, includeToJson: false)
    bool? downloading,
    @ignore
    @JsonKey(includeFromJson: false, includeToJson: false)
    double? downloadProgress,
  }) = _ClipboardItem;

  factory ClipboardItem.fromJson(Map<String, dynamic> json) =>
      _$ClipboardItemFromJson(json);

  factory ClipboardItem.fromText(
    String userId,
    String text, {
    String? sourceUrl,
    String? sourceApp,
  }) {
    return ClipboardItem(
      text: text,
      created: DateTime.now(),
      modified: DateTime.now(),
      type: ClipItemType.text,
      userId: userId,
      os: currentPlatformOS(),
      sourceUrl: sourceUrl,
      sourceApp: sourceApp,
    );
  }

  factory ClipboardItem.fromMedia(
    String userId,
    String filePath, {
    String? fileName,
    String? fileMimeType,
    String? fileExtension,
    int? fileSize, // in KB
    String? blurHash, // only for image
    String? sourceUrl,
    String? sourceApp,
  }) {
    return ClipboardItem(
      created: DateTime.now(),
      modified: DateTime.now(),
      type: ClipItemType.media,
      localPath: filePath,
      userId: userId,
      fileName: fileName,
      fileExtension: fileExtension,
      fileSize: fileSize,
      fileMimeType: fileMimeType,
      imgBlurHash: blurHash,
      os: currentPlatformOS(),
      sourceUrl: sourceUrl,
      sourceApp: sourceApp,
    );
  }

  factory ClipboardItem.fromFile(
    String userId,
    String filePath, {
    String? preview,
    String? fileName,
    String? fileMimeType,
    String? fileExtension,
    int? fileSize, // in KB
    String? sourceUrl,
    String? sourceApp,
  }) {
    final basename = p.basename(filePath);

    return ClipboardItem(
      text: preview,
      created: DateTime.now(),
      modified: DateTime.now(),
      title: fileName ?? basename,
      type: ClipItemType.file,
      localPath: filePath,
      userId: userId,
      fileName: fileName,
      fileExtension: fileExtension,
      fileSize: fileSize,
      fileMimeType: fileMimeType,
      os: currentPlatformOS(),
      sourceUrl: sourceUrl,
      sourceApp: sourceApp,
    );
  }

  factory ClipboardItem.fromURL(
    String userId,
    Uri uri, {
    String? title,
    String? description,
    String? sourceUrl,
    String? sourceApp,
  }) {
    return ClipboardItem(
      url: uri.toString(),
      created: DateTime.now(),
      modified: DateTime.now(),
      title: title,
      description: description,
      type: ClipItemType.url,
      userId: userId,
      os: currentPlatformOS(),
      sourceUrl: sourceUrl,
      sourceApp: sourceApp,
    );
  }

  /// Removes the associated file.
  Future<void> cleanUp() async {
    try {
      if (localPath != null && type == ClipItemType.file ||
          type == ClipItemType.media) {
        final file = File(localPath!);
        if (await file.exists()) {
          await file.delete();
        }
      }
    } catch (e) {
      logger.warning("Couldn't delete file! $e");
    }
  }

  bool get isSynced => lastSynced != null;

  File? getLocalFile() => localPath != null ? File(localPath!) : null;

  String? get rootDir => type == ClipItemType.file || type == ClipItemType.media
      ? '${type.name}s'
      : null;
}
