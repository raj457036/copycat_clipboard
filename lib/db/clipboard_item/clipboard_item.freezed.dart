// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clipboard_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClipboardItem _$ClipboardItemFromJson(Map<String, dynamic> json) {
  return _ClipboardItem.fromJson(json);
}

/// @nodoc
mixin _$ClipboardItem {
  @JsonKey(name: "id", includeToJson: false)
  @Index()
  int? get serverId => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  DateTime? get lastSynced => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get localPath => throw _privateConstructorUsedError;
  @JsonKey(name: "created")
  @DateTimeConverter()
  DateTime get created => throw _privateConstructorUsedError;
  @JsonKey(name: "modified")
  @DateTimeConverter()
  DateTime get modified => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  @Enumerated(EnumType.name)
  ClipItemType get type => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  bool get encrypted => throw _privateConstructorUsedError; // Text related
  String? get text => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  @Enumerated(EnumType.name)
  TextCategory? get textCategory =>
      throw _privateConstructorUsedError; // Files related
  String? get fileName => throw _privateConstructorUsedError;
  String? get fileMimeType => throw _privateConstructorUsedError;
  String? get fileExtension => throw _privateConstructorUsedError;
  String? get driveFileId => throw _privateConstructorUsedError;
  int? get fileSize => throw _privateConstructorUsedError; // in KB
  String? get imgBlurHash =>
      throw _privateConstructorUsedError; // only for image
// Source Information
  String? get sourceUrl => throw _privateConstructorUsedError;
  String? get sourceApp => throw _privateConstructorUsedError;
  @Enumerated(EnumType.name)
  PlatformOS get os => throw _privateConstructorUsedError; // Collection
  @JsonKey(name: "collectionId")
  int? get serverCollectionId => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get collectionId => throw _privateConstructorUsedError; // local only
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get localOnly => throw _privateConstructorUsedError; // Stats
  int get copiedCount => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get lastCopied =>
      throw _privateConstructorUsedError; // non persistant state
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get downloading => throw _privateConstructorUsedError;
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  double? get downloadProgress => throw _privateConstructorUsedError;
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get uploading => throw _privateConstructorUsedError;
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  double? get uploadProgress => throw _privateConstructorUsedError;
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  Failure? get failure => throw _privateConstructorUsedError;

  /// This clip is manually triggered to upload, sync or persist.
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get userIntent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClipboardItemCopyWith<ClipboardItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClipboardItemCopyWith<$Res> {
  factory $ClipboardItemCopyWith(
          ClipboardItem value, $Res Function(ClipboardItem) then) =
      _$ClipboardItemCopyWithImpl<$Res, ClipboardItem>;
  @useResult
  $Res call(
      {@JsonKey(name: "id", includeToJson: false) @Index() int? serverId,
      @JsonKey(includeFromJson: false, includeToJson: false)
      DateTime? lastSynced,
      @JsonKey(includeFromJson: false, includeToJson: false) String? localPath,
      @JsonKey(name: "created") @DateTimeConverter() DateTime created,
      @JsonKey(name: "modified") @DateTimeConverter() DateTime modified,
      String? deviceId,
      @Enumerated(EnumType.name) ClipItemType type,
      String userId,
      String? title,
      String? description,
      @DateTimeConverter() DateTime? deletedAt,
      bool encrypted,
      String? text,
      String? url,
      @Enumerated(EnumType.name) TextCategory? textCategory,
      String? fileName,
      String? fileMimeType,
      String? fileExtension,
      String? driveFileId,
      int? fileSize,
      String? imgBlurHash,
      String? sourceUrl,
      String? sourceApp,
      @Enumerated(EnumType.name) PlatformOS os,
      @JsonKey(name: "collectionId") int? serverCollectionId,
      @JsonKey(includeFromJson: false, includeToJson: false) int? collectionId,
      @JsonKey(includeFromJson: false, includeToJson: false) bool localOnly,
      int copiedCount,
      @DateTimeConverter() DateTime? lastCopied,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      bool downloading,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      double? downloadProgress,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      bool uploading,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      double? uploadProgress,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      Failure? failure,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      bool userIntent});
}

/// @nodoc
class _$ClipboardItemCopyWithImpl<$Res, $Val extends ClipboardItem>
    implements $ClipboardItemCopyWith<$Res> {
  _$ClipboardItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverId = freezed,
    Object? lastSynced = freezed,
    Object? localPath = freezed,
    Object? created = null,
    Object? modified = null,
    Object? deviceId = freezed,
    Object? type = null,
    Object? userId = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? deletedAt = freezed,
    Object? encrypted = null,
    Object? text = freezed,
    Object? url = freezed,
    Object? textCategory = freezed,
    Object? fileName = freezed,
    Object? fileMimeType = freezed,
    Object? fileExtension = freezed,
    Object? driveFileId = freezed,
    Object? fileSize = freezed,
    Object? imgBlurHash = freezed,
    Object? sourceUrl = freezed,
    Object? sourceApp = freezed,
    Object? os = null,
    Object? serverCollectionId = freezed,
    Object? collectionId = freezed,
    Object? localOnly = null,
    Object? copiedCount = null,
    Object? lastCopied = freezed,
    Object? downloading = null,
    Object? downloadProgress = freezed,
    Object? uploading = null,
    Object? uploadProgress = freezed,
    Object? failure = freezed,
    Object? userIntent = null,
  }) {
    return _then(_value.copyWith(
      serverId: freezed == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastSynced: freezed == lastSynced
          ? _value.lastSynced
          : lastSynced // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      localPath: freezed == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String?,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modified: null == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ClipItemType,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      encrypted: null == encrypted
          ? _value.encrypted
          : encrypted // ignore: cast_nullable_to_non_nullable
              as bool,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      textCategory: freezed == textCategory
          ? _value.textCategory
          : textCategory // ignore: cast_nullable_to_non_nullable
              as TextCategory?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      fileMimeType: freezed == fileMimeType
          ? _value.fileMimeType
          : fileMimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      fileExtension: freezed == fileExtension
          ? _value.fileExtension
          : fileExtension // ignore: cast_nullable_to_non_nullable
              as String?,
      driveFileId: freezed == driveFileId
          ? _value.driveFileId
          : driveFileId // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: freezed == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int?,
      imgBlurHash: freezed == imgBlurHash
          ? _value.imgBlurHash
          : imgBlurHash // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceUrl: freezed == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceApp: freezed == sourceApp
          ? _value.sourceApp
          : sourceApp // ignore: cast_nullable_to_non_nullable
              as String?,
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as PlatformOS,
      serverCollectionId: freezed == serverCollectionId
          ? _value.serverCollectionId
          : serverCollectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      collectionId: freezed == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      localOnly: null == localOnly
          ? _value.localOnly
          : localOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      copiedCount: null == copiedCount
          ? _value.copiedCount
          : copiedCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastCopied: freezed == lastCopied
          ? _value.lastCopied
          : lastCopied // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      downloading: null == downloading
          ? _value.downloading
          : downloading // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadProgress: freezed == downloadProgress
          ? _value.downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as double?,
      uploading: null == uploading
          ? _value.uploading
          : uploading // ignore: cast_nullable_to_non_nullable
              as bool,
      uploadProgress: freezed == uploadProgress
          ? _value.uploadProgress
          : uploadProgress // ignore: cast_nullable_to_non_nullable
              as double?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      userIntent: null == userIntent
          ? _value.userIntent
          : userIntent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClipboardItemImplCopyWith<$Res>
    implements $ClipboardItemCopyWith<$Res> {
  factory _$$ClipboardItemImplCopyWith(
          _$ClipboardItemImpl value, $Res Function(_$ClipboardItemImpl) then) =
      __$$ClipboardItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id", includeToJson: false) @Index() int? serverId,
      @JsonKey(includeFromJson: false, includeToJson: false)
      DateTime? lastSynced,
      @JsonKey(includeFromJson: false, includeToJson: false) String? localPath,
      @JsonKey(name: "created") @DateTimeConverter() DateTime created,
      @JsonKey(name: "modified") @DateTimeConverter() DateTime modified,
      String? deviceId,
      @Enumerated(EnumType.name) ClipItemType type,
      String userId,
      String? title,
      String? description,
      @DateTimeConverter() DateTime? deletedAt,
      bool encrypted,
      String? text,
      String? url,
      @Enumerated(EnumType.name) TextCategory? textCategory,
      String? fileName,
      String? fileMimeType,
      String? fileExtension,
      String? driveFileId,
      int? fileSize,
      String? imgBlurHash,
      String? sourceUrl,
      String? sourceApp,
      @Enumerated(EnumType.name) PlatformOS os,
      @JsonKey(name: "collectionId") int? serverCollectionId,
      @JsonKey(includeFromJson: false, includeToJson: false) int? collectionId,
      @JsonKey(includeFromJson: false, includeToJson: false) bool localOnly,
      int copiedCount,
      @DateTimeConverter() DateTime? lastCopied,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      bool downloading,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      double? downloadProgress,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      bool uploading,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      double? uploadProgress,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      Failure? failure,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      bool userIntent});
}

/// @nodoc
class __$$ClipboardItemImplCopyWithImpl<$Res>
    extends _$ClipboardItemCopyWithImpl<$Res, _$ClipboardItemImpl>
    implements _$$ClipboardItemImplCopyWith<$Res> {
  __$$ClipboardItemImplCopyWithImpl(
      _$ClipboardItemImpl _value, $Res Function(_$ClipboardItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverId = freezed,
    Object? lastSynced = freezed,
    Object? localPath = freezed,
    Object? created = null,
    Object? modified = null,
    Object? deviceId = freezed,
    Object? type = null,
    Object? userId = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? deletedAt = freezed,
    Object? encrypted = null,
    Object? text = freezed,
    Object? url = freezed,
    Object? textCategory = freezed,
    Object? fileName = freezed,
    Object? fileMimeType = freezed,
    Object? fileExtension = freezed,
    Object? driveFileId = freezed,
    Object? fileSize = freezed,
    Object? imgBlurHash = freezed,
    Object? sourceUrl = freezed,
    Object? sourceApp = freezed,
    Object? os = null,
    Object? serverCollectionId = freezed,
    Object? collectionId = freezed,
    Object? localOnly = null,
    Object? copiedCount = null,
    Object? lastCopied = freezed,
    Object? downloading = null,
    Object? downloadProgress = freezed,
    Object? uploading = null,
    Object? uploadProgress = freezed,
    Object? failure = freezed,
    Object? userIntent = null,
  }) {
    return _then(_$ClipboardItemImpl(
      serverId: freezed == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastSynced: freezed == lastSynced
          ? _value.lastSynced
          : lastSynced // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      localPath: freezed == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String?,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modified: null == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ClipItemType,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      encrypted: null == encrypted
          ? _value.encrypted
          : encrypted // ignore: cast_nullable_to_non_nullable
              as bool,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      textCategory: freezed == textCategory
          ? _value.textCategory
          : textCategory // ignore: cast_nullable_to_non_nullable
              as TextCategory?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      fileMimeType: freezed == fileMimeType
          ? _value.fileMimeType
          : fileMimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      fileExtension: freezed == fileExtension
          ? _value.fileExtension
          : fileExtension // ignore: cast_nullable_to_non_nullable
              as String?,
      driveFileId: freezed == driveFileId
          ? _value.driveFileId
          : driveFileId // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: freezed == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int?,
      imgBlurHash: freezed == imgBlurHash
          ? _value.imgBlurHash
          : imgBlurHash // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceUrl: freezed == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceApp: freezed == sourceApp
          ? _value.sourceApp
          : sourceApp // ignore: cast_nullable_to_non_nullable
              as String?,
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as PlatformOS,
      serverCollectionId: freezed == serverCollectionId
          ? _value.serverCollectionId
          : serverCollectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      collectionId: freezed == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      localOnly: null == localOnly
          ? _value.localOnly
          : localOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      copiedCount: null == copiedCount
          ? _value.copiedCount
          : copiedCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastCopied: freezed == lastCopied
          ? _value.lastCopied
          : lastCopied // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      downloading: null == downloading
          ? _value.downloading
          : downloading // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadProgress: freezed == downloadProgress
          ? _value.downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as double?,
      uploading: null == uploading
          ? _value.uploading
          : uploading // ignore: cast_nullable_to_non_nullable
              as bool,
      uploadProgress: freezed == uploadProgress
          ? _value.uploadProgress
          : uploadProgress // ignore: cast_nullable_to_non_nullable
              as double?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      userIntent: null == userIntent
          ? _value.userIntent
          : userIntent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClipboardItemImpl extends _ClipboardItem {
  _$ClipboardItemImpl(
      {@JsonKey(name: "id", includeToJson: false) @Index() this.serverId,
      @JsonKey(includeFromJson: false, includeToJson: false) this.lastSynced,
      @JsonKey(includeFromJson: false, includeToJson: false) this.localPath,
      @JsonKey(name: "created") @DateTimeConverter() required this.created,
      @JsonKey(name: "modified") @DateTimeConverter() required this.modified,
      this.deviceId,
      @Enumerated(EnumType.name) required this.type,
      this.userId = kLocalUserId,
      this.title,
      this.description,
      @DateTimeConverter() this.deletedAt,
      this.encrypted = false,
      this.text,
      this.url,
      @Enumerated(EnumType.name) this.textCategory,
      this.fileName,
      this.fileMimeType,
      this.fileExtension,
      this.driveFileId,
      this.fileSize,
      this.imgBlurHash,
      this.sourceUrl,
      this.sourceApp,
      @Enumerated(EnumType.name) required this.os,
      @JsonKey(name: "collectionId") this.serverCollectionId,
      @JsonKey(includeFromJson: false, includeToJson: false) this.collectionId,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.localOnly = false,
      this.copiedCount = 0,
      @DateTimeConverter() this.lastCopied,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.downloading = false,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.downloadProgress,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.uploading = false,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.uploadProgress,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.failure,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.userIntent = false})
      : super._();

  factory _$ClipboardItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClipboardItemImplFromJson(json);

  @override
  @JsonKey(name: "id", includeToJson: false)
  @Index()
  final int? serverId;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final DateTime? lastSynced;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? localPath;
  @override
  @JsonKey(name: "created")
  @DateTimeConverter()
  final DateTime created;
  @override
  @JsonKey(name: "modified")
  @DateTimeConverter()
  final DateTime modified;
  @override
  final String? deviceId;
  @override
  @Enumerated(EnumType.name)
  final ClipItemType type;
  @override
  @JsonKey()
  final String userId;
  @override
  final String? title;
  @override
  final String? description;
  @override
  @DateTimeConverter()
  final DateTime? deletedAt;
  @override
  @JsonKey()
  final bool encrypted;
// Text related
  @override
  final String? text;
  @override
  final String? url;
  @override
  @Enumerated(EnumType.name)
  final TextCategory? textCategory;
// Files related
  @override
  final String? fileName;
  @override
  final String? fileMimeType;
  @override
  final String? fileExtension;
  @override
  final String? driveFileId;
  @override
  final int? fileSize;
// in KB
  @override
  final String? imgBlurHash;
// only for image
// Source Information
  @override
  final String? sourceUrl;
  @override
  final String? sourceApp;
  @override
  @Enumerated(EnumType.name)
  final PlatformOS os;
// Collection
  @override
  @JsonKey(name: "collectionId")
  final int? serverCollectionId;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int? collectionId;
// local only
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool localOnly;
// Stats
  @override
  @JsonKey()
  final int copiedCount;
  @override
  @DateTimeConverter()
  final DateTime? lastCopied;
// non persistant state
  @override
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool downloading;
  @override
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  final double? downloadProgress;
  @override
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool uploading;
  @override
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  final double? uploadProgress;
  @override
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Failure? failure;

  /// This clip is manually triggered to upload, sync or persist.
  @override
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool userIntent;

  @override
  String toString() {
    return 'ClipboardItem(serverId: $serverId, lastSynced: $lastSynced, localPath: $localPath, created: $created, modified: $modified, deviceId: $deviceId, type: $type, userId: $userId, title: $title, description: $description, deletedAt: $deletedAt, encrypted: $encrypted, text: $text, url: $url, textCategory: $textCategory, fileName: $fileName, fileMimeType: $fileMimeType, fileExtension: $fileExtension, driveFileId: $driveFileId, fileSize: $fileSize, imgBlurHash: $imgBlurHash, sourceUrl: $sourceUrl, sourceApp: $sourceApp, os: $os, serverCollectionId: $serverCollectionId, collectionId: $collectionId, localOnly: $localOnly, copiedCount: $copiedCount, lastCopied: $lastCopied, downloading: $downloading, downloadProgress: $downloadProgress, uploading: $uploading, uploadProgress: $uploadProgress, failure: $failure, userIntent: $userIntent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClipboardItemImpl &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId) &&
            (identical(other.lastSynced, lastSynced) ||
                other.lastSynced == lastSynced) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.modified, modified) ||
                other.modified == modified) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.encrypted, encrypted) ||
                other.encrypted == encrypted) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.textCategory, textCategory) ||
                other.textCategory == textCategory) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileMimeType, fileMimeType) ||
                other.fileMimeType == fileMimeType) &&
            (identical(other.fileExtension, fileExtension) ||
                other.fileExtension == fileExtension) &&
            (identical(other.driveFileId, driveFileId) ||
                other.driveFileId == driveFileId) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.imgBlurHash, imgBlurHash) ||
                other.imgBlurHash == imgBlurHash) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl) &&
            (identical(other.sourceApp, sourceApp) ||
                other.sourceApp == sourceApp) &&
            (identical(other.os, os) || other.os == os) &&
            (identical(other.serverCollectionId, serverCollectionId) ||
                other.serverCollectionId == serverCollectionId) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.localOnly, localOnly) ||
                other.localOnly == localOnly) &&
            (identical(other.copiedCount, copiedCount) ||
                other.copiedCount == copiedCount) &&
            (identical(other.lastCopied, lastCopied) ||
                other.lastCopied == lastCopied) &&
            (identical(other.downloading, downloading) ||
                other.downloading == downloading) &&
            (identical(other.downloadProgress, downloadProgress) ||
                other.downloadProgress == downloadProgress) &&
            (identical(other.uploading, uploading) ||
                other.uploading == uploading) &&
            (identical(other.uploadProgress, uploadProgress) ||
                other.uploadProgress == uploadProgress) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.userIntent, userIntent) ||
                other.userIntent == userIntent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        serverId,
        lastSynced,
        localPath,
        created,
        modified,
        deviceId,
        type,
        userId,
        title,
        description,
        deletedAt,
        encrypted,
        text,
        url,
        textCategory,
        fileName,
        fileMimeType,
        fileExtension,
        driveFileId,
        fileSize,
        imgBlurHash,
        sourceUrl,
        sourceApp,
        os,
        serverCollectionId,
        collectionId,
        localOnly,
        copiedCount,
        lastCopied,
        downloading,
        downloadProgress,
        uploading,
        uploadProgress,
        failure,
        userIntent
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClipboardItemImplCopyWith<_$ClipboardItemImpl> get copyWith =>
      __$$ClipboardItemImplCopyWithImpl<_$ClipboardItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClipboardItemImplToJson(
      this,
    );
  }
}

abstract class _ClipboardItem extends ClipboardItem {
  factory _ClipboardItem(
      {@JsonKey(name: "id", includeToJson: false) @Index() final int? serverId,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final DateTime? lastSynced,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final String? localPath,
      @JsonKey(name: "created")
      @DateTimeConverter()
      required final DateTime created,
      @JsonKey(name: "modified")
      @DateTimeConverter()
      required final DateTime modified,
      final String? deviceId,
      @Enumerated(EnumType.name) required final ClipItemType type,
      final String userId,
      final String? title,
      final String? description,
      @DateTimeConverter() final DateTime? deletedAt,
      final bool encrypted,
      final String? text,
      final String? url,
      @Enumerated(EnumType.name) final TextCategory? textCategory,
      final String? fileName,
      final String? fileMimeType,
      final String? fileExtension,
      final String? driveFileId,
      final int? fileSize,
      final String? imgBlurHash,
      final String? sourceUrl,
      final String? sourceApp,
      @Enumerated(EnumType.name) required final PlatformOS os,
      @JsonKey(name: "collectionId") final int? serverCollectionId,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final int? collectionId,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final bool localOnly,
      final int copiedCount,
      @DateTimeConverter() final DateTime? lastCopied,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      final bool downloading,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      final double? downloadProgress,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      final bool uploading,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      final double? uploadProgress,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Failure? failure,
      @ignore
      @JsonKey(includeFromJson: false, includeToJson: false)
      final bool userIntent}) = _$ClipboardItemImpl;
  _ClipboardItem._() : super._();

  factory _ClipboardItem.fromJson(Map<String, dynamic> json) =
      _$ClipboardItemImpl.fromJson;

  @override
  @JsonKey(name: "id", includeToJson: false)
  @Index()
  int? get serverId;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  DateTime? get lastSynced;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get localPath;
  @override
  @JsonKey(name: "created")
  @DateTimeConverter()
  DateTime get created;
  @override
  @JsonKey(name: "modified")
  @DateTimeConverter()
  DateTime get modified;
  @override
  String? get deviceId;
  @override
  @Enumerated(EnumType.name)
  ClipItemType get type;
  @override
  String get userId;
  @override
  String? get title;
  @override
  String? get description;
  @override
  @DateTimeConverter()
  DateTime? get deletedAt;
  @override
  bool get encrypted;
  @override // Text related
  String? get text;
  @override
  String? get url;
  @override
  @Enumerated(EnumType.name)
  TextCategory? get textCategory;
  @override // Files related
  String? get fileName;
  @override
  String? get fileMimeType;
  @override
  String? get fileExtension;
  @override
  String? get driveFileId;
  @override
  int? get fileSize;
  @override // in KB
  String? get imgBlurHash;
  @override // only for image
// Source Information
  String? get sourceUrl;
  @override
  String? get sourceApp;
  @override
  @Enumerated(EnumType.name)
  PlatformOS get os;
  @override // Collection
  @JsonKey(name: "collectionId")
  int? get serverCollectionId;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get collectionId;
  @override // local only
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get localOnly;
  @override // Stats
  int get copiedCount;
  @override
  @DateTimeConverter()
  DateTime? get lastCopied;
  @override // non persistant state
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get downloading;
  @override
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  double? get downloadProgress;
  @override
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get uploading;
  @override
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  double? get uploadProgress;
  @override
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  Failure? get failure;
  @override

  /// This clip is manually triggered to upload, sync or persist.
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get userIntent;
  @override
  @JsonKey(ignore: true)
  _$$ClipboardItemImplCopyWith<_$ClipboardItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
