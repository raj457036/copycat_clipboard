import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/constants/strings/strings.dart';
import 'package:clipboard/db/base.dart';
import 'package:clipboard/db/json_converters/datetime_converters.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/enums/platform_os.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart' as p;
import "package:universal_io/io.dart";

part 'clipboard_item.freezed.dart';
part 'clipboard_item.g.dart';

final specialSymbols = RegExp(r"[-_|]");

@freezed
@Collection(ignore: {'copyWith'})
class ClipboardItem with _$ClipboardItem, IsarIdMixin {
  ClipboardItem._();

  factory ClipboardItem({
    @JsonKey(name: "id", includeToJson: false) int? serverId,
    @JsonKey(includeFromJson: false, includeToJson: false) DateTime? lastSynced,
    @JsonKey(includeFromJson: false, includeToJson: false) String? localPath,
    @JsonKey(name: "created") @DateTimeConverter() required DateTime created,
    @JsonKey(name: "modified") @DateTimeConverter() required DateTime modified,
    String? deviceId,
    @Enumerated(EnumType.name) required ClipItemType type,
    @Default(kLocalUserId) String userId,
    String? title,
    String? description,
    @DateTimeConverter() DateTime? deletedAt,
    @Default(false) bool encrypted,
    // Text related
    String? text,
    String? url,
    @Enumerated(EnumType.name) TextCategory? textCategory,
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

    // Collection
    @JsonKey(name: "collectionId") int? serverCollectionId,
    @JsonKey(includeFromJson: false, includeToJson: false) int? collectionId,

    // local only
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool localOnly,

    // Stats
    @Default(0) int copiedCount,
    @DateTimeConverter() DateTime? lastCopied,

    // non persistant state
    @ignore
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool downloading,
    @ignore
    @JsonKey(includeFromJson: false, includeToJson: false)
    double? downloadProgress,
    @ignore
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool uploading,
    @ignore
    @JsonKey(includeFromJson: false, includeToJson: false)
    double? uploadProgress,
    @ignore
    @JsonKey(includeFromJson: false, includeToJson: false)
    Failure? failure,

    /// This clip is manually triggered to upload, sync or persist.
    @ignore
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool userIntent,
  }) = _ClipboardItem;

  factory ClipboardItem.fromJson(Map<String, dynamic> json) =>
      _$ClipboardItemFromJson(json);

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get titleWords =>
      Isar.splitWords((title ?? '').replaceAll(specialSymbols, " "));

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get descriptionWords =>
      Isar.splitWords((description ?? '').replaceAll(specialSymbols, " "));

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get urlWords =>
      Isar.splitWords((url ?? '').replaceAll(specialSymbols, " "));

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get textWord =>
      Isar.splitWords((text ?? '').replaceAll(specialSymbols, " "));

  @Index()
  String get textCategoryWord => textCategory?.name ?? "";

  @Index()
  String get typeWord => type.name;

  @Index()
  String get mimetypeWord => fileMimeType ?? 'text';

  factory ClipboardItem.fromText(
    String text, {
    String? userId,
    String? sourceUrl,
    String? sourceApp,
    TextCategory? category,
  }) {
    return ClipboardItem(
      text: text,
      userId: userId ?? kLocalUserId,
      created: now(),
      modified: now(),
      type: ClipItemType.text,
      os: currentPlatformOS(),
      sourceUrl: sourceUrl,
      sourceApp: sourceApp,
      textCategory: category,
    );
  }

  factory ClipboardItem.fromMedia(
    String filePath, {
    String? userId,
    String? fileName,
    String? fileMimeType,
    String? fileExtension,
    int? fileSize, // in Bytes
    String? blurHash, // only for image
    String? sourceUrl,
    String? sourceApp,
  }) {
    return ClipboardItem(
      created: now(),
      modified: now(),
      type: ClipItemType.media,
      localPath: filePath,
      userId: userId ?? kLocalUserId,
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
    String filePath, {
    String? userId,
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
      created: now(),
      modified: now(),
      title: fileName ?? basename,
      type: ClipItemType.file,
      localPath: filePath,
      userId: userId ?? kLocalUserId,
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
    Uri uri, {
    String? userId,
    String? title,
    String? description,
    String? sourceUrl,
    String? sourceApp,
  }) {
    return ClipboardItem(
      url: Uri.decodeFull(uri.toString()),
      created: now(),
      modified: now(),
      title: title,
      description: description,
      type: ClipItemType.url,
      userId: userId ?? kLocalUserId,
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
      logger.w("Couldn't delete file! $e");
    }
  }

  @ignore
  bool get isSynced => lastSynced != null;

  @ignore
  bool get inCache =>
      ((type == ClipItemType.file || type == ClipItemType.media) &&
          localPath != null) ||
      type == ClipItemType.text ||
      type == ClipItemType.url;

  @ignore
  String? get rootDir => type == ClipItemType.file || type == ClipItemType.media
      ? '${type.name}s'
      : null;

  ClipboardItem assignUserId([String? newUserId]) {
    if (newUserId != null && newUserId != userId) {
      return copyWith(userId: newUserId)..applyId(this);
    }
    return this;
  }

  ClipboardItem syncDone([Failure? failure]) {
    return copyWith(
      downloading: false,
      uploading: false,
      failure: failure,
    )..applyId(this);
  }

  @ignore
  bool get needDownload =>
      (type == ClipItemType.file || type == ClipItemType.media) &&
      serverId != null &&
      driveFileId != null &&
      localPath == null;

  @ignore
  bool get isSyncing => uploading || downloading;
}
