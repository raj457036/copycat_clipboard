// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clipboard_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClipboardItem {

@JsonKey(includeToJson: false, includeFromJson: false) int? get id;@JsonKey(name: "id", includeToJson: false) int? get serverId;@JsonKey(includeFromJson: false, includeToJson: false) DateTime? get lastSynced;@JsonKey(includeFromJson: false, includeToJson: false) String? get localPath;@JsonKey(name: "created")@DateTimeConverter() DateTime get created;@JsonKey(name: "modified")@DateTimeConverter() DateTime get modified; String? get deviceId; ClipItemType get type; String get userId; String? get title; String? get description;@DateTimeConverter() DateTime? get deletedAt; bool get locked; bool get encrypted; String? get iv;@JsonKey(name: "enc_mode") String? get encMode; String? get text;@JsonKey(name: "p_data") String? get richData; String? get url; TextCategory? get textCategory;@JsonKey(includeFromJson: false, includeToJson: false) String? get linkPreviewTitle;@JsonKey(includeFromJson: false, includeToJson: false) String? get linkPreviewDescription;@JsonKey(includeFromJson: false, includeToJson: false) String? get linkPreviewImageUrl; String? get fileName; String? get fileMimeType; String? get fileExtension; String? get driveFileId; int? get fileSize; String? get imgBlurHash; String? get sourceUrl; String? get sourceApp; String? get sourceId; PlatformOS get os;@JsonKey(name: "collectionId") int? get serverCollectionId;@JsonKey(includeFromJson: false, includeToJson: false) int? get collectionId;@JsonKey(includeFromJson: false, includeToJson: false) bool get localOnly; int get copiedCount;@DateTimeConverter() DateTime? get lastCopied;@JsonKey(includeFromJson: false, includeToJson: false) bool get downloading;@JsonKey(includeFromJson: false, includeToJson: false) double? get downloadProgress;@JsonKey(includeFromJson: false, includeToJson: false) bool get uploading;@JsonKey(includeFromJson: false, includeToJson: false) double? get uploadProgress;@JsonKey(includeFromJson: false, includeToJson: false) Failure? get failure;/// This clip is manually triggered to upload, sync or persist.
@JsonKey(includeFromJson: false, includeToJson: false) bool get userIntent;/// This clip was loaded as a lightweight preview: [text] may be truncated
/// and [richData] is omitted. The full content must be fetched from DB
/// before copying or pasting to avoid data loss.
@JsonKey(includeFromJson: false, includeToJson: false) bool get previewOnly;/// Whether this clip currently has a pending entry in the sync outbox.
/// Populated by the data layer; not persisted.
@JsonKey(includeFromJson: false, includeToJson: false) bool get isQueued;/// Short ID assigned at creation on the originating
/// device. Used to deduplicate clips arriving from different sources.
/// Persisted locally and round-tripped through the server.
@JsonKey(name: "origin_id") String? get originId;
/// Create a copy of ClipboardItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClipboardItemCopyWith<ClipboardItem> get copyWith => _$ClipboardItemCopyWithImpl<ClipboardItem>(this as ClipboardItem, _$identity);

  /// Serializes this ClipboardItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClipboardItem&&(identical(other.id, id) || other.id == id)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.lastSynced, lastSynced) || other.lastSynced == lastSynced)&&(identical(other.localPath, localPath) || other.localPath == localPath)&&(identical(other.created, created) || other.created == created)&&(identical(other.modified, modified) || other.modified == modified)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.type, type) || other.type == type)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.locked, locked) || other.locked == locked)&&(identical(other.encrypted, encrypted) || other.encrypted == encrypted)&&(identical(other.iv, iv) || other.iv == iv)&&(identical(other.encMode, encMode) || other.encMode == encMode)&&(identical(other.text, text) || other.text == text)&&(identical(other.richData, richData) || other.richData == richData)&&(identical(other.url, url) || other.url == url)&&(identical(other.textCategory, textCategory) || other.textCategory == textCategory)&&(identical(other.linkPreviewTitle, linkPreviewTitle) || other.linkPreviewTitle == linkPreviewTitle)&&(identical(other.linkPreviewDescription, linkPreviewDescription) || other.linkPreviewDescription == linkPreviewDescription)&&(identical(other.linkPreviewImageUrl, linkPreviewImageUrl) || other.linkPreviewImageUrl == linkPreviewImageUrl)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileMimeType, fileMimeType) || other.fileMimeType == fileMimeType)&&(identical(other.fileExtension, fileExtension) || other.fileExtension == fileExtension)&&(identical(other.driveFileId, driveFileId) || other.driveFileId == driveFileId)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.imgBlurHash, imgBlurHash) || other.imgBlurHash == imgBlurHash)&&(identical(other.sourceUrl, sourceUrl) || other.sourceUrl == sourceUrl)&&(identical(other.sourceApp, sourceApp) || other.sourceApp == sourceApp)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.os, os) || other.os == os)&&(identical(other.serverCollectionId, serverCollectionId) || other.serverCollectionId == serverCollectionId)&&(identical(other.collectionId, collectionId) || other.collectionId == collectionId)&&(identical(other.localOnly, localOnly) || other.localOnly == localOnly)&&(identical(other.copiedCount, copiedCount) || other.copiedCount == copiedCount)&&(identical(other.lastCopied, lastCopied) || other.lastCopied == lastCopied)&&(identical(other.downloading, downloading) || other.downloading == downloading)&&(identical(other.downloadProgress, downloadProgress) || other.downloadProgress == downloadProgress)&&(identical(other.uploading, uploading) || other.uploading == uploading)&&(identical(other.uploadProgress, uploadProgress) || other.uploadProgress == uploadProgress)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.userIntent, userIntent) || other.userIntent == userIntent)&&(identical(other.previewOnly, previewOnly) || other.previewOnly == previewOnly)&&(identical(other.isQueued, isQueued) || other.isQueued == isQueued)&&(identical(other.originId, originId) || other.originId == originId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,serverId,lastSynced,localPath,created,modified,deviceId,type,userId,title,description,deletedAt,locked,encrypted,iv,encMode,text,richData,url,textCategory,linkPreviewTitle,linkPreviewDescription,linkPreviewImageUrl,fileName,fileMimeType,fileExtension,driveFileId,fileSize,imgBlurHash,sourceUrl,sourceApp,sourceId,os,serverCollectionId,collectionId,localOnly,copiedCount,lastCopied,downloading,downloadProgress,uploading,uploadProgress,failure,userIntent,previewOnly,isQueued,originId]);

@override
String toString() {
  return 'ClipboardItem(id: $id, serverId: $serverId, lastSynced: $lastSynced, localPath: $localPath, created: $created, modified: $modified, deviceId: $deviceId, type: $type, userId: $userId, title: $title, description: $description, deletedAt: $deletedAt, locked: $locked, encrypted: $encrypted, iv: $iv, encMode: $encMode, text: $text, richData: $richData, url: $url, textCategory: $textCategory, linkPreviewTitle: $linkPreviewTitle, linkPreviewDescription: $linkPreviewDescription, linkPreviewImageUrl: $linkPreviewImageUrl, fileName: $fileName, fileMimeType: $fileMimeType, fileExtension: $fileExtension, driveFileId: $driveFileId, fileSize: $fileSize, imgBlurHash: $imgBlurHash, sourceUrl: $sourceUrl, sourceApp: $sourceApp, sourceId: $sourceId, os: $os, serverCollectionId: $serverCollectionId, collectionId: $collectionId, localOnly: $localOnly, copiedCount: $copiedCount, lastCopied: $lastCopied, downloading: $downloading, downloadProgress: $downloadProgress, uploading: $uploading, uploadProgress: $uploadProgress, failure: $failure, userIntent: $userIntent, previewOnly: $previewOnly, isQueued: $isQueued, originId: $originId)';
}


}

/// @nodoc
abstract mixin class $ClipboardItemCopyWith<$Res>  {
  factory $ClipboardItemCopyWith(ClipboardItem value, $Res Function(ClipboardItem) _then) = _$ClipboardItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false, includeFromJson: false) int? id,@JsonKey(name: "id", includeToJson: false) int? serverId,@JsonKey(includeFromJson: false, includeToJson: false) DateTime? lastSynced,@JsonKey(includeFromJson: false, includeToJson: false) String? localPath,@JsonKey(name: "created")@DateTimeConverter() DateTime created,@JsonKey(name: "modified")@DateTimeConverter() DateTime modified, String? deviceId, ClipItemType type, String userId, String? title, String? description,@DateTimeConverter() DateTime? deletedAt, bool locked, bool encrypted, String? iv,@JsonKey(name: "enc_mode") String? encMode, String? text,@JsonKey(name: "p_data") String? richData, String? url, TextCategory? textCategory,@JsonKey(includeFromJson: false, includeToJson: false) String? linkPreviewTitle,@JsonKey(includeFromJson: false, includeToJson: false) String? linkPreviewDescription,@JsonKey(includeFromJson: false, includeToJson: false) String? linkPreviewImageUrl, String? fileName, String? fileMimeType, String? fileExtension, String? driveFileId, int? fileSize, String? imgBlurHash, String? sourceUrl, String? sourceApp, String? sourceId, PlatformOS os,@JsonKey(name: "collectionId") int? serverCollectionId,@JsonKey(includeFromJson: false, includeToJson: false) int? collectionId,@JsonKey(includeFromJson: false, includeToJson: false) bool localOnly, int copiedCount,@DateTimeConverter() DateTime? lastCopied,@JsonKey(includeFromJson: false, includeToJson: false) bool downloading,@JsonKey(includeFromJson: false, includeToJson: false) double? downloadProgress,@JsonKey(includeFromJson: false, includeToJson: false) bool uploading,@JsonKey(includeFromJson: false, includeToJson: false) double? uploadProgress,@JsonKey(includeFromJson: false, includeToJson: false) Failure? failure,@JsonKey(includeFromJson: false, includeToJson: false) bool userIntent,@JsonKey(includeFromJson: false, includeToJson: false) bool previewOnly,@JsonKey(includeFromJson: false, includeToJson: false) bool isQueued,@JsonKey(name: "origin_id") String? originId
});




}
/// @nodoc
class _$ClipboardItemCopyWithImpl<$Res>
    implements $ClipboardItemCopyWith<$Res> {
  _$ClipboardItemCopyWithImpl(this._self, this._then);

  final ClipboardItem _self;
  final $Res Function(ClipboardItem) _then;

/// Create a copy of ClipboardItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? serverId = freezed,Object? lastSynced = freezed,Object? localPath = freezed,Object? created = null,Object? modified = null,Object? deviceId = freezed,Object? type = null,Object? userId = null,Object? title = freezed,Object? description = freezed,Object? deletedAt = freezed,Object? locked = null,Object? encrypted = null,Object? iv = freezed,Object? encMode = freezed,Object? text = freezed,Object? richData = freezed,Object? url = freezed,Object? textCategory = freezed,Object? linkPreviewTitle = freezed,Object? linkPreviewDescription = freezed,Object? linkPreviewImageUrl = freezed,Object? fileName = freezed,Object? fileMimeType = freezed,Object? fileExtension = freezed,Object? driveFileId = freezed,Object? fileSize = freezed,Object? imgBlurHash = freezed,Object? sourceUrl = freezed,Object? sourceApp = freezed,Object? sourceId = freezed,Object? os = null,Object? serverCollectionId = freezed,Object? collectionId = freezed,Object? localOnly = null,Object? copiedCount = null,Object? lastCopied = freezed,Object? downloading = null,Object? downloadProgress = freezed,Object? uploading = null,Object? uploadProgress = freezed,Object? failure = freezed,Object? userIntent = null,Object? previewOnly = null,Object? isQueued = null,Object? originId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,lastSynced: freezed == lastSynced ? _self.lastSynced : lastSynced // ignore: cast_nullable_to_non_nullable
as DateTime?,localPath: freezed == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String?,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime,modified: null == modified ? _self.modified : modified // ignore: cast_nullable_to_non_nullable
as DateTime,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ClipItemType,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,locked: null == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool,encrypted: null == encrypted ? _self.encrypted : encrypted // ignore: cast_nullable_to_non_nullable
as bool,iv: freezed == iv ? _self.iv : iv // ignore: cast_nullable_to_non_nullable
as String?,encMode: freezed == encMode ? _self.encMode : encMode // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,richData: freezed == richData ? _self.richData : richData // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,textCategory: freezed == textCategory ? _self.textCategory : textCategory // ignore: cast_nullable_to_non_nullable
as TextCategory?,linkPreviewTitle: freezed == linkPreviewTitle ? _self.linkPreviewTitle : linkPreviewTitle // ignore: cast_nullable_to_non_nullable
as String?,linkPreviewDescription: freezed == linkPreviewDescription ? _self.linkPreviewDescription : linkPreviewDescription // ignore: cast_nullable_to_non_nullable
as String?,linkPreviewImageUrl: freezed == linkPreviewImageUrl ? _self.linkPreviewImageUrl : linkPreviewImageUrl // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,fileMimeType: freezed == fileMimeType ? _self.fileMimeType : fileMimeType // ignore: cast_nullable_to_non_nullable
as String?,fileExtension: freezed == fileExtension ? _self.fileExtension : fileExtension // ignore: cast_nullable_to_non_nullable
as String?,driveFileId: freezed == driveFileId ? _self.driveFileId : driveFileId // ignore: cast_nullable_to_non_nullable
as String?,fileSize: freezed == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int?,imgBlurHash: freezed == imgBlurHash ? _self.imgBlurHash : imgBlurHash // ignore: cast_nullable_to_non_nullable
as String?,sourceUrl: freezed == sourceUrl ? _self.sourceUrl : sourceUrl // ignore: cast_nullable_to_non_nullable
as String?,sourceApp: freezed == sourceApp ? _self.sourceApp : sourceApp // ignore: cast_nullable_to_non_nullable
as String?,sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String?,os: null == os ? _self.os : os // ignore: cast_nullable_to_non_nullable
as PlatformOS,serverCollectionId: freezed == serverCollectionId ? _self.serverCollectionId : serverCollectionId // ignore: cast_nullable_to_non_nullable
as int?,collectionId: freezed == collectionId ? _self.collectionId : collectionId // ignore: cast_nullable_to_non_nullable
as int?,localOnly: null == localOnly ? _self.localOnly : localOnly // ignore: cast_nullable_to_non_nullable
as bool,copiedCount: null == copiedCount ? _self.copiedCount : copiedCount // ignore: cast_nullable_to_non_nullable
as int,lastCopied: freezed == lastCopied ? _self.lastCopied : lastCopied // ignore: cast_nullable_to_non_nullable
as DateTime?,downloading: null == downloading ? _self.downloading : downloading // ignore: cast_nullable_to_non_nullable
as bool,downloadProgress: freezed == downloadProgress ? _self.downloadProgress : downloadProgress // ignore: cast_nullable_to_non_nullable
as double?,uploading: null == uploading ? _self.uploading : uploading // ignore: cast_nullable_to_non_nullable
as bool,uploadProgress: freezed == uploadProgress ? _self.uploadProgress : uploadProgress // ignore: cast_nullable_to_non_nullable
as double?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,userIntent: null == userIntent ? _self.userIntent : userIntent // ignore: cast_nullable_to_non_nullable
as bool,previewOnly: null == previewOnly ? _self.previewOnly : previewOnly // ignore: cast_nullable_to_non_nullable
as bool,isQueued: null == isQueued ? _self.isQueued : isQueued // ignore: cast_nullable_to_non_nullable
as bool,originId: freezed == originId ? _self.originId : originId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClipboardItem].
extension ClipboardItemPatterns on ClipboardItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClipboardItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClipboardItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClipboardItem value)  $default,){
final _that = this;
switch (_that) {
case _ClipboardItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClipboardItem value)?  $default,){
final _that = this;
switch (_that) {
case _ClipboardItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false, includeFromJson: false)  int? id, @JsonKey(name: "id", includeToJson: false)  int? serverId, @JsonKey(includeFromJson: false, includeToJson: false)  DateTime? lastSynced, @JsonKey(includeFromJson: false, includeToJson: false)  String? localPath, @JsonKey(name: "created")@DateTimeConverter()  DateTime created, @JsonKey(name: "modified")@DateTimeConverter()  DateTime modified,  String? deviceId,  ClipItemType type,  String userId,  String? title,  String? description, @DateTimeConverter()  DateTime? deletedAt,  bool locked,  bool encrypted,  String? iv, @JsonKey(name: "enc_mode")  String? encMode,  String? text, @JsonKey(name: "p_data")  String? richData,  String? url,  TextCategory? textCategory, @JsonKey(includeFromJson: false, includeToJson: false)  String? linkPreviewTitle, @JsonKey(includeFromJson: false, includeToJson: false)  String? linkPreviewDescription, @JsonKey(includeFromJson: false, includeToJson: false)  String? linkPreviewImageUrl,  String? fileName,  String? fileMimeType,  String? fileExtension,  String? driveFileId,  int? fileSize,  String? imgBlurHash,  String? sourceUrl,  String? sourceApp,  String? sourceId,  PlatformOS os, @JsonKey(name: "collectionId")  int? serverCollectionId, @JsonKey(includeFromJson: false, includeToJson: false)  int? collectionId, @JsonKey(includeFromJson: false, includeToJson: false)  bool localOnly,  int copiedCount, @DateTimeConverter()  DateTime? lastCopied, @JsonKey(includeFromJson: false, includeToJson: false)  bool downloading, @JsonKey(includeFromJson: false, includeToJson: false)  double? downloadProgress, @JsonKey(includeFromJson: false, includeToJson: false)  bool uploading, @JsonKey(includeFromJson: false, includeToJson: false)  double? uploadProgress, @JsonKey(includeFromJson: false, includeToJson: false)  Failure? failure, @JsonKey(includeFromJson: false, includeToJson: false)  bool userIntent, @JsonKey(includeFromJson: false, includeToJson: false)  bool previewOnly, @JsonKey(includeFromJson: false, includeToJson: false)  bool isQueued, @JsonKey(name: "origin_id")  String? originId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClipboardItem() when $default != null:
return $default(_that.id,_that.serverId,_that.lastSynced,_that.localPath,_that.created,_that.modified,_that.deviceId,_that.type,_that.userId,_that.title,_that.description,_that.deletedAt,_that.locked,_that.encrypted,_that.iv,_that.encMode,_that.text,_that.richData,_that.url,_that.textCategory,_that.linkPreviewTitle,_that.linkPreviewDescription,_that.linkPreviewImageUrl,_that.fileName,_that.fileMimeType,_that.fileExtension,_that.driveFileId,_that.fileSize,_that.imgBlurHash,_that.sourceUrl,_that.sourceApp,_that.sourceId,_that.os,_that.serverCollectionId,_that.collectionId,_that.localOnly,_that.copiedCount,_that.lastCopied,_that.downloading,_that.downloadProgress,_that.uploading,_that.uploadProgress,_that.failure,_that.userIntent,_that.previewOnly,_that.isQueued,_that.originId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false, includeFromJson: false)  int? id, @JsonKey(name: "id", includeToJson: false)  int? serverId, @JsonKey(includeFromJson: false, includeToJson: false)  DateTime? lastSynced, @JsonKey(includeFromJson: false, includeToJson: false)  String? localPath, @JsonKey(name: "created")@DateTimeConverter()  DateTime created, @JsonKey(name: "modified")@DateTimeConverter()  DateTime modified,  String? deviceId,  ClipItemType type,  String userId,  String? title,  String? description, @DateTimeConverter()  DateTime? deletedAt,  bool locked,  bool encrypted,  String? iv, @JsonKey(name: "enc_mode")  String? encMode,  String? text, @JsonKey(name: "p_data")  String? richData,  String? url,  TextCategory? textCategory, @JsonKey(includeFromJson: false, includeToJson: false)  String? linkPreviewTitle, @JsonKey(includeFromJson: false, includeToJson: false)  String? linkPreviewDescription, @JsonKey(includeFromJson: false, includeToJson: false)  String? linkPreviewImageUrl,  String? fileName,  String? fileMimeType,  String? fileExtension,  String? driveFileId,  int? fileSize,  String? imgBlurHash,  String? sourceUrl,  String? sourceApp,  String? sourceId,  PlatformOS os, @JsonKey(name: "collectionId")  int? serverCollectionId, @JsonKey(includeFromJson: false, includeToJson: false)  int? collectionId, @JsonKey(includeFromJson: false, includeToJson: false)  bool localOnly,  int copiedCount, @DateTimeConverter()  DateTime? lastCopied, @JsonKey(includeFromJson: false, includeToJson: false)  bool downloading, @JsonKey(includeFromJson: false, includeToJson: false)  double? downloadProgress, @JsonKey(includeFromJson: false, includeToJson: false)  bool uploading, @JsonKey(includeFromJson: false, includeToJson: false)  double? uploadProgress, @JsonKey(includeFromJson: false, includeToJson: false)  Failure? failure, @JsonKey(includeFromJson: false, includeToJson: false)  bool userIntent, @JsonKey(includeFromJson: false, includeToJson: false)  bool previewOnly, @JsonKey(includeFromJson: false, includeToJson: false)  bool isQueued, @JsonKey(name: "origin_id")  String? originId)  $default,) {final _that = this;
switch (_that) {
case _ClipboardItem():
return $default(_that.id,_that.serverId,_that.lastSynced,_that.localPath,_that.created,_that.modified,_that.deviceId,_that.type,_that.userId,_that.title,_that.description,_that.deletedAt,_that.locked,_that.encrypted,_that.iv,_that.encMode,_that.text,_that.richData,_that.url,_that.textCategory,_that.linkPreviewTitle,_that.linkPreviewDescription,_that.linkPreviewImageUrl,_that.fileName,_that.fileMimeType,_that.fileExtension,_that.driveFileId,_that.fileSize,_that.imgBlurHash,_that.sourceUrl,_that.sourceApp,_that.sourceId,_that.os,_that.serverCollectionId,_that.collectionId,_that.localOnly,_that.copiedCount,_that.lastCopied,_that.downloading,_that.downloadProgress,_that.uploading,_that.uploadProgress,_that.failure,_that.userIntent,_that.previewOnly,_that.isQueued,_that.originId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false, includeFromJson: false)  int? id, @JsonKey(name: "id", includeToJson: false)  int? serverId, @JsonKey(includeFromJson: false, includeToJson: false)  DateTime? lastSynced, @JsonKey(includeFromJson: false, includeToJson: false)  String? localPath, @JsonKey(name: "created")@DateTimeConverter()  DateTime created, @JsonKey(name: "modified")@DateTimeConverter()  DateTime modified,  String? deviceId,  ClipItemType type,  String userId,  String? title,  String? description, @DateTimeConverter()  DateTime? deletedAt,  bool locked,  bool encrypted,  String? iv, @JsonKey(name: "enc_mode")  String? encMode,  String? text, @JsonKey(name: "p_data")  String? richData,  String? url,  TextCategory? textCategory, @JsonKey(includeFromJson: false, includeToJson: false)  String? linkPreviewTitle, @JsonKey(includeFromJson: false, includeToJson: false)  String? linkPreviewDescription, @JsonKey(includeFromJson: false, includeToJson: false)  String? linkPreviewImageUrl,  String? fileName,  String? fileMimeType,  String? fileExtension,  String? driveFileId,  int? fileSize,  String? imgBlurHash,  String? sourceUrl,  String? sourceApp,  String? sourceId,  PlatformOS os, @JsonKey(name: "collectionId")  int? serverCollectionId, @JsonKey(includeFromJson: false, includeToJson: false)  int? collectionId, @JsonKey(includeFromJson: false, includeToJson: false)  bool localOnly,  int copiedCount, @DateTimeConverter()  DateTime? lastCopied, @JsonKey(includeFromJson: false, includeToJson: false)  bool downloading, @JsonKey(includeFromJson: false, includeToJson: false)  double? downloadProgress, @JsonKey(includeFromJson: false, includeToJson: false)  bool uploading, @JsonKey(includeFromJson: false, includeToJson: false)  double? uploadProgress, @JsonKey(includeFromJson: false, includeToJson: false)  Failure? failure, @JsonKey(includeFromJson: false, includeToJson: false)  bool userIntent, @JsonKey(includeFromJson: false, includeToJson: false)  bool previewOnly, @JsonKey(includeFromJson: false, includeToJson: false)  bool isQueued, @JsonKey(name: "origin_id")  String? originId)?  $default,) {final _that = this;
switch (_that) {
case _ClipboardItem() when $default != null:
return $default(_that.id,_that.serverId,_that.lastSynced,_that.localPath,_that.created,_that.modified,_that.deviceId,_that.type,_that.userId,_that.title,_that.description,_that.deletedAt,_that.locked,_that.encrypted,_that.iv,_that.encMode,_that.text,_that.richData,_that.url,_that.textCategory,_that.linkPreviewTitle,_that.linkPreviewDescription,_that.linkPreviewImageUrl,_that.fileName,_that.fileMimeType,_that.fileExtension,_that.driveFileId,_that.fileSize,_that.imgBlurHash,_that.sourceUrl,_that.sourceApp,_that.sourceId,_that.os,_that.serverCollectionId,_that.collectionId,_that.localOnly,_that.copiedCount,_that.lastCopied,_that.downloading,_that.downloadProgress,_that.uploading,_that.uploadProgress,_that.failure,_that.userIntent,_that.previewOnly,_that.isQueued,_that.originId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClipboardItem extends ClipboardItem {
   _ClipboardItem({@JsonKey(includeToJson: false, includeFromJson: false) this.id, @JsonKey(name: "id", includeToJson: false) this.serverId, @JsonKey(includeFromJson: false, includeToJson: false) this.lastSynced, @JsonKey(includeFromJson: false, includeToJson: false) this.localPath, @JsonKey(name: "created")@DateTimeConverter() required this.created, @JsonKey(name: "modified")@DateTimeConverter() required this.modified, this.deviceId, required this.type, this.userId = kLocalUserId, this.title, this.description, @DateTimeConverter() this.deletedAt, this.locked = false, this.encrypted = false, this.iv, @JsonKey(name: "enc_mode") this.encMode, this.text, @JsonKey(name: "p_data") this.richData, this.url, this.textCategory, @JsonKey(includeFromJson: false, includeToJson: false) this.linkPreviewTitle, @JsonKey(includeFromJson: false, includeToJson: false) this.linkPreviewDescription, @JsonKey(includeFromJson: false, includeToJson: false) this.linkPreviewImageUrl, this.fileName, this.fileMimeType, this.fileExtension, this.driveFileId, this.fileSize, this.imgBlurHash, this.sourceUrl, this.sourceApp, this.sourceId, required this.os, @JsonKey(name: "collectionId") this.serverCollectionId, @JsonKey(includeFromJson: false, includeToJson: false) this.collectionId, @JsonKey(includeFromJson: false, includeToJson: false) this.localOnly = false, this.copiedCount = 0, @DateTimeConverter() this.lastCopied, @JsonKey(includeFromJson: false, includeToJson: false) this.downloading = false, @JsonKey(includeFromJson: false, includeToJson: false) this.downloadProgress, @JsonKey(includeFromJson: false, includeToJson: false) this.uploading = false, @JsonKey(includeFromJson: false, includeToJson: false) this.uploadProgress, @JsonKey(includeFromJson: false, includeToJson: false) this.failure, @JsonKey(includeFromJson: false, includeToJson: false) this.userIntent = false, @JsonKey(includeFromJson: false, includeToJson: false) this.previewOnly = false, @JsonKey(includeFromJson: false, includeToJson: false) this.isQueued = false, @JsonKey(name: "origin_id") this.originId}): super._();
  factory _ClipboardItem.fromJson(Map<String, dynamic> json) => _$ClipboardItemFromJson(json);

@override@JsonKey(includeToJson: false, includeFromJson: false) final  int? id;
@override@JsonKey(name: "id", includeToJson: false) final  int? serverId;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  DateTime? lastSynced;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  String? localPath;
@override@JsonKey(name: "created")@DateTimeConverter() final  DateTime created;
@override@JsonKey(name: "modified")@DateTimeConverter() final  DateTime modified;
@override final  String? deviceId;
@override final  ClipItemType type;
@override@JsonKey() final  String userId;
@override final  String? title;
@override final  String? description;
@override@DateTimeConverter() final  DateTime? deletedAt;
@override@JsonKey() final  bool locked;
@override@JsonKey() final  bool encrypted;
@override final  String? iv;
@override@JsonKey(name: "enc_mode") final  String? encMode;
@override final  String? text;
@override@JsonKey(name: "p_data") final  String? richData;
@override final  String? url;
@override final  TextCategory? textCategory;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  String? linkPreviewTitle;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  String? linkPreviewDescription;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  String? linkPreviewImageUrl;
@override final  String? fileName;
@override final  String? fileMimeType;
@override final  String? fileExtension;
@override final  String? driveFileId;
@override final  int? fileSize;
@override final  String? imgBlurHash;
@override final  String? sourceUrl;
@override final  String? sourceApp;
@override final  String? sourceId;
@override final  PlatformOS os;
@override@JsonKey(name: "collectionId") final  int? serverCollectionId;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  int? collectionId;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  bool localOnly;
@override@JsonKey() final  int copiedCount;
@override@DateTimeConverter() final  DateTime? lastCopied;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  bool downloading;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  double? downloadProgress;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  bool uploading;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  double? uploadProgress;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  Failure? failure;
/// This clip is manually triggered to upload, sync or persist.
@override@JsonKey(includeFromJson: false, includeToJson: false) final  bool userIntent;
/// This clip was loaded as a lightweight preview: [text] may be truncated
/// and [richData] is omitted. The full content must be fetched from DB
/// before copying or pasting to avoid data loss.
@override@JsonKey(includeFromJson: false, includeToJson: false) final  bool previewOnly;
/// Whether this clip currently has a pending entry in the sync outbox.
/// Populated by the data layer; not persisted.
@override@JsonKey(includeFromJson: false, includeToJson: false) final  bool isQueued;
/// Short ID assigned at creation on the originating
/// device. Used to deduplicate clips arriving from different sources.
/// Persisted locally and round-tripped through the server.
@override@JsonKey(name: "origin_id") final  String? originId;

/// Create a copy of ClipboardItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClipboardItemCopyWith<_ClipboardItem> get copyWith => __$ClipboardItemCopyWithImpl<_ClipboardItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClipboardItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClipboardItem&&(identical(other.id, id) || other.id == id)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.lastSynced, lastSynced) || other.lastSynced == lastSynced)&&(identical(other.localPath, localPath) || other.localPath == localPath)&&(identical(other.created, created) || other.created == created)&&(identical(other.modified, modified) || other.modified == modified)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.type, type) || other.type == type)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.locked, locked) || other.locked == locked)&&(identical(other.encrypted, encrypted) || other.encrypted == encrypted)&&(identical(other.iv, iv) || other.iv == iv)&&(identical(other.encMode, encMode) || other.encMode == encMode)&&(identical(other.text, text) || other.text == text)&&(identical(other.richData, richData) || other.richData == richData)&&(identical(other.url, url) || other.url == url)&&(identical(other.textCategory, textCategory) || other.textCategory == textCategory)&&(identical(other.linkPreviewTitle, linkPreviewTitle) || other.linkPreviewTitle == linkPreviewTitle)&&(identical(other.linkPreviewDescription, linkPreviewDescription) || other.linkPreviewDescription == linkPreviewDescription)&&(identical(other.linkPreviewImageUrl, linkPreviewImageUrl) || other.linkPreviewImageUrl == linkPreviewImageUrl)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileMimeType, fileMimeType) || other.fileMimeType == fileMimeType)&&(identical(other.fileExtension, fileExtension) || other.fileExtension == fileExtension)&&(identical(other.driveFileId, driveFileId) || other.driveFileId == driveFileId)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.imgBlurHash, imgBlurHash) || other.imgBlurHash == imgBlurHash)&&(identical(other.sourceUrl, sourceUrl) || other.sourceUrl == sourceUrl)&&(identical(other.sourceApp, sourceApp) || other.sourceApp == sourceApp)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.os, os) || other.os == os)&&(identical(other.serverCollectionId, serverCollectionId) || other.serverCollectionId == serverCollectionId)&&(identical(other.collectionId, collectionId) || other.collectionId == collectionId)&&(identical(other.localOnly, localOnly) || other.localOnly == localOnly)&&(identical(other.copiedCount, copiedCount) || other.copiedCount == copiedCount)&&(identical(other.lastCopied, lastCopied) || other.lastCopied == lastCopied)&&(identical(other.downloading, downloading) || other.downloading == downloading)&&(identical(other.downloadProgress, downloadProgress) || other.downloadProgress == downloadProgress)&&(identical(other.uploading, uploading) || other.uploading == uploading)&&(identical(other.uploadProgress, uploadProgress) || other.uploadProgress == uploadProgress)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.userIntent, userIntent) || other.userIntent == userIntent)&&(identical(other.previewOnly, previewOnly) || other.previewOnly == previewOnly)&&(identical(other.isQueued, isQueued) || other.isQueued == isQueued)&&(identical(other.originId, originId) || other.originId == originId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,serverId,lastSynced,localPath,created,modified,deviceId,type,userId,title,description,deletedAt,locked,encrypted,iv,encMode,text,richData,url,textCategory,linkPreviewTitle,linkPreviewDescription,linkPreviewImageUrl,fileName,fileMimeType,fileExtension,driveFileId,fileSize,imgBlurHash,sourceUrl,sourceApp,sourceId,os,serverCollectionId,collectionId,localOnly,copiedCount,lastCopied,downloading,downloadProgress,uploading,uploadProgress,failure,userIntent,previewOnly,isQueued,originId]);

@override
String toString() {
  return 'ClipboardItem(id: $id, serverId: $serverId, lastSynced: $lastSynced, localPath: $localPath, created: $created, modified: $modified, deviceId: $deviceId, type: $type, userId: $userId, title: $title, description: $description, deletedAt: $deletedAt, locked: $locked, encrypted: $encrypted, iv: $iv, encMode: $encMode, text: $text, richData: $richData, url: $url, textCategory: $textCategory, linkPreviewTitle: $linkPreviewTitle, linkPreviewDescription: $linkPreviewDescription, linkPreviewImageUrl: $linkPreviewImageUrl, fileName: $fileName, fileMimeType: $fileMimeType, fileExtension: $fileExtension, driveFileId: $driveFileId, fileSize: $fileSize, imgBlurHash: $imgBlurHash, sourceUrl: $sourceUrl, sourceApp: $sourceApp, sourceId: $sourceId, os: $os, serverCollectionId: $serverCollectionId, collectionId: $collectionId, localOnly: $localOnly, copiedCount: $copiedCount, lastCopied: $lastCopied, downloading: $downloading, downloadProgress: $downloadProgress, uploading: $uploading, uploadProgress: $uploadProgress, failure: $failure, userIntent: $userIntent, previewOnly: $previewOnly, isQueued: $isQueued, originId: $originId)';
}


}

/// @nodoc
abstract mixin class _$ClipboardItemCopyWith<$Res> implements $ClipboardItemCopyWith<$Res> {
  factory _$ClipboardItemCopyWith(_ClipboardItem value, $Res Function(_ClipboardItem) _then) = __$ClipboardItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false, includeFromJson: false) int? id,@JsonKey(name: "id", includeToJson: false) int? serverId,@JsonKey(includeFromJson: false, includeToJson: false) DateTime? lastSynced,@JsonKey(includeFromJson: false, includeToJson: false) String? localPath,@JsonKey(name: "created")@DateTimeConverter() DateTime created,@JsonKey(name: "modified")@DateTimeConverter() DateTime modified, String? deviceId, ClipItemType type, String userId, String? title, String? description,@DateTimeConverter() DateTime? deletedAt, bool locked, bool encrypted, String? iv,@JsonKey(name: "enc_mode") String? encMode, String? text,@JsonKey(name: "p_data") String? richData, String? url, TextCategory? textCategory,@JsonKey(includeFromJson: false, includeToJson: false) String? linkPreviewTitle,@JsonKey(includeFromJson: false, includeToJson: false) String? linkPreviewDescription,@JsonKey(includeFromJson: false, includeToJson: false) String? linkPreviewImageUrl, String? fileName, String? fileMimeType, String? fileExtension, String? driveFileId, int? fileSize, String? imgBlurHash, String? sourceUrl, String? sourceApp, String? sourceId, PlatformOS os,@JsonKey(name: "collectionId") int? serverCollectionId,@JsonKey(includeFromJson: false, includeToJson: false) int? collectionId,@JsonKey(includeFromJson: false, includeToJson: false) bool localOnly, int copiedCount,@DateTimeConverter() DateTime? lastCopied,@JsonKey(includeFromJson: false, includeToJson: false) bool downloading,@JsonKey(includeFromJson: false, includeToJson: false) double? downloadProgress,@JsonKey(includeFromJson: false, includeToJson: false) bool uploading,@JsonKey(includeFromJson: false, includeToJson: false) double? uploadProgress,@JsonKey(includeFromJson: false, includeToJson: false) Failure? failure,@JsonKey(includeFromJson: false, includeToJson: false) bool userIntent,@JsonKey(includeFromJson: false, includeToJson: false) bool previewOnly,@JsonKey(includeFromJson: false, includeToJson: false) bool isQueued,@JsonKey(name: "origin_id") String? originId
});




}
/// @nodoc
class __$ClipboardItemCopyWithImpl<$Res>
    implements _$ClipboardItemCopyWith<$Res> {
  __$ClipboardItemCopyWithImpl(this._self, this._then);

  final _ClipboardItem _self;
  final $Res Function(_ClipboardItem) _then;

/// Create a copy of ClipboardItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? serverId = freezed,Object? lastSynced = freezed,Object? localPath = freezed,Object? created = null,Object? modified = null,Object? deviceId = freezed,Object? type = null,Object? userId = null,Object? title = freezed,Object? description = freezed,Object? deletedAt = freezed,Object? locked = null,Object? encrypted = null,Object? iv = freezed,Object? encMode = freezed,Object? text = freezed,Object? richData = freezed,Object? url = freezed,Object? textCategory = freezed,Object? linkPreviewTitle = freezed,Object? linkPreviewDescription = freezed,Object? linkPreviewImageUrl = freezed,Object? fileName = freezed,Object? fileMimeType = freezed,Object? fileExtension = freezed,Object? driveFileId = freezed,Object? fileSize = freezed,Object? imgBlurHash = freezed,Object? sourceUrl = freezed,Object? sourceApp = freezed,Object? sourceId = freezed,Object? os = null,Object? serverCollectionId = freezed,Object? collectionId = freezed,Object? localOnly = null,Object? copiedCount = null,Object? lastCopied = freezed,Object? downloading = null,Object? downloadProgress = freezed,Object? uploading = null,Object? uploadProgress = freezed,Object? failure = freezed,Object? userIntent = null,Object? previewOnly = null,Object? isQueued = null,Object? originId = freezed,}) {
  return _then(_ClipboardItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,lastSynced: freezed == lastSynced ? _self.lastSynced : lastSynced // ignore: cast_nullable_to_non_nullable
as DateTime?,localPath: freezed == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String?,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime,modified: null == modified ? _self.modified : modified // ignore: cast_nullable_to_non_nullable
as DateTime,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ClipItemType,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,locked: null == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool,encrypted: null == encrypted ? _self.encrypted : encrypted // ignore: cast_nullable_to_non_nullable
as bool,iv: freezed == iv ? _self.iv : iv // ignore: cast_nullable_to_non_nullable
as String?,encMode: freezed == encMode ? _self.encMode : encMode // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,richData: freezed == richData ? _self.richData : richData // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,textCategory: freezed == textCategory ? _self.textCategory : textCategory // ignore: cast_nullable_to_non_nullable
as TextCategory?,linkPreviewTitle: freezed == linkPreviewTitle ? _self.linkPreviewTitle : linkPreviewTitle // ignore: cast_nullable_to_non_nullable
as String?,linkPreviewDescription: freezed == linkPreviewDescription ? _self.linkPreviewDescription : linkPreviewDescription // ignore: cast_nullable_to_non_nullable
as String?,linkPreviewImageUrl: freezed == linkPreviewImageUrl ? _self.linkPreviewImageUrl : linkPreviewImageUrl // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,fileMimeType: freezed == fileMimeType ? _self.fileMimeType : fileMimeType // ignore: cast_nullable_to_non_nullable
as String?,fileExtension: freezed == fileExtension ? _self.fileExtension : fileExtension // ignore: cast_nullable_to_non_nullable
as String?,driveFileId: freezed == driveFileId ? _self.driveFileId : driveFileId // ignore: cast_nullable_to_non_nullable
as String?,fileSize: freezed == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int?,imgBlurHash: freezed == imgBlurHash ? _self.imgBlurHash : imgBlurHash // ignore: cast_nullable_to_non_nullable
as String?,sourceUrl: freezed == sourceUrl ? _self.sourceUrl : sourceUrl // ignore: cast_nullable_to_non_nullable
as String?,sourceApp: freezed == sourceApp ? _self.sourceApp : sourceApp // ignore: cast_nullable_to_non_nullable
as String?,sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String?,os: null == os ? _self.os : os // ignore: cast_nullable_to_non_nullable
as PlatformOS,serverCollectionId: freezed == serverCollectionId ? _self.serverCollectionId : serverCollectionId // ignore: cast_nullable_to_non_nullable
as int?,collectionId: freezed == collectionId ? _self.collectionId : collectionId // ignore: cast_nullable_to_non_nullable
as int?,localOnly: null == localOnly ? _self.localOnly : localOnly // ignore: cast_nullable_to_non_nullable
as bool,copiedCount: null == copiedCount ? _self.copiedCount : copiedCount // ignore: cast_nullable_to_non_nullable
as int,lastCopied: freezed == lastCopied ? _self.lastCopied : lastCopied // ignore: cast_nullable_to_non_nullable
as DateTime?,downloading: null == downloading ? _self.downloading : downloading // ignore: cast_nullable_to_non_nullable
as bool,downloadProgress: freezed == downloadProgress ? _self.downloadProgress : downloadProgress // ignore: cast_nullable_to_non_nullable
as double?,uploading: null == uploading ? _self.uploading : uploading // ignore: cast_nullable_to_non_nullable
as bool,uploadProgress: freezed == uploadProgress ? _self.uploadProgress : uploadProgress // ignore: cast_nullable_to_non_nullable
as double?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,userIntent: null == userIntent ? _self.userIntent : userIntent // ignore: cast_nullable_to_non_nullable
as bool,previewOnly: null == previewOnly ? _self.previewOnly : previewOnly // ignore: cast_nullable_to_non_nullable
as bool,isQueued: null == isQueued ? _self.isQueued : isQueued // ignore: cast_nullable_to_non_nullable
as bool,originId: freezed == originId ? _self.originId : originId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
