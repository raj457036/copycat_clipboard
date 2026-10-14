// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_clipboard_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types, experimental_member_use

extension GetIsarClipboardItemCollection on Isar {
  IsarCollection<IsarClipboardItem> get isarClipboardItems => this.collection();
}

const IsarClipboardItemSchema = CollectionSchema(
  name: r'ClipboardItem',
  id: 7228975801377184843,
  properties: {
    r'collectionId': PropertySchema(
      id: 0,
      name: r'collectionId',
      type: IsarType.long,
    ),
    r'copiedCount': PropertySchema(
      id: 1,
      name: r'copiedCount',
      type: IsarType.long,
    ),
    r'created': PropertySchema(
      id: 2,
      name: r'created',
      type: IsarType.dateTime,
    ),
    r'deletedAt': PropertySchema(
      id: 3,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 4,
      name: r'description',
      type: IsarType.string,
    ),
    r'deviceId': PropertySchema(
      id: 5,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'driveFileId': PropertySchema(
      id: 6,
      name: r'driveFileId',
      type: IsarType.string,
    ),
    r'encMode': PropertySchema(id: 7, name: r'encMode', type: IsarType.string),
    r'encrypted': PropertySchema(
      id: 8,
      name: r'encrypted',
      type: IsarType.bool,
    ),
    r'fileExtension': PropertySchema(
      id: 9,
      name: r'fileExtension',
      type: IsarType.string,
    ),
    r'fileMimeType': PropertySchema(
      id: 10,
      name: r'fileMimeType',
      type: IsarType.string,
    ),
    r'fileName': PropertySchema(
      id: 11,
      name: r'fileName',
      type: IsarType.string,
    ),
    r'fileSize': PropertySchema(id: 12, name: r'fileSize', type: IsarType.long),
    r'imgBlurHash': PropertySchema(
      id: 13,
      name: r'imgBlurHash',
      type: IsarType.string,
    ),
    r'iv': PropertySchema(id: 14, name: r'iv', type: IsarType.string),
    r'lastCopied': PropertySchema(
      id: 15,
      name: r'lastCopied',
      type: IsarType.dateTime,
    ),
    r'lastSynced': PropertySchema(
      id: 16,
      name: r'lastSynced',
      type: IsarType.dateTime,
    ),
    r'linkPreviewDescription': PropertySchema(
      id: 17,
      name: r'linkPreviewDescription',
      type: IsarType.string,
    ),
    r'linkPreviewImageUrl': PropertySchema(
      id: 18,
      name: r'linkPreviewImageUrl',
      type: IsarType.string,
    ),
    r'linkPreviewTitle': PropertySchema(
      id: 19,
      name: r'linkPreviewTitle',
      type: IsarType.string,
    ),
    r'localOnly': PropertySchema(
      id: 20,
      name: r'localOnly',
      type: IsarType.bool,
    ),
    r'localPath': PropertySchema(
      id: 21,
      name: r'localPath',
      type: IsarType.string,
    ),
    r'locked': PropertySchema(id: 22, name: r'locked', type: IsarType.bool),
    r'modified': PropertySchema(
      id: 23,
      name: r'modified',
      type: IsarType.dateTime,
    ),
    r'originId': PropertySchema(
      id: 24,
      name: r'originId',
      type: IsarType.string,
    ),
    r'os': PropertySchema(
      id: 25,
      name: r'os',
      type: IsarType.string,
      enumMap: _IsarClipboardItemosEnumValueMap,
    ),
    r'richData': PropertySchema(
      id: 26,
      name: r'richData',
      type: IsarType.string,
    ),
    r'searchTokens': PropertySchema(
      id: 27,
      name: r'searchTokens',
      type: IsarType.stringList,
    ),
    r'serverCollectionId': PropertySchema(
      id: 28,
      name: r'serverCollectionId',
      type: IsarType.long,
    ),
    r'serverId': PropertySchema(id: 29, name: r'serverId', type: IsarType.long),
    r'sourceApp': PropertySchema(
      id: 30,
      name: r'sourceApp',
      type: IsarType.string,
    ),
    r'sourceId': PropertySchema(
      id: 31,
      name: r'sourceId',
      type: IsarType.string,
    ),
    r'sourceUrl': PropertySchema(
      id: 32,
      name: r'sourceUrl',
      type: IsarType.string,
    ),
    r'text': PropertySchema(id: 33, name: r'text', type: IsarType.string),
    r'textCategory': PropertySchema(
      id: 34,
      name: r'textCategory',
      type: IsarType.string,
      enumMap: _IsarClipboardItemtextCategoryEnumValueMap,
    ),
    r'title': PropertySchema(id: 35, name: r'title', type: IsarType.string),
    r'type': PropertySchema(
      id: 36,
      name: r'type',
      type: IsarType.string,
      enumMap: _IsarClipboardItemtypeEnumValueMap,
    ),
    r'url': PropertySchema(id: 37, name: r'url', type: IsarType.string),
    r'userId': PropertySchema(id: 38, name: r'userId', type: IsarType.string),
  },

  estimateSize: _isarClipboardItemEstimateSize,
  serialize: _isarClipboardItemSerialize,
  deserialize: _isarClipboardItemDeserialize,
  deserializeProp: _isarClipboardItemDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'serverId': IndexSchema(
      id: -7950187970872907662,
      name: r'serverId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'serverId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'type': IndexSchema(
      id: 5117122708147080838,
      name: r'type',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'type',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'deletedAt': IndexSchema(
      id: -8969437169173379604,
      name: r'deletedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'deletedAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'locked': IndexSchema(
      id: 497338535767934804,
      name: r'locked',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'locked',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'encrypted': IndexSchema(
      id: -5171473955020626441,
      name: r'encrypted',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'encrypted',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'textCategory': IndexSchema(
      id: -1046666033776057913,
      name: r'textCategory',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'textCategory',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'sourceId': IndexSchema(
      id: 2155220942429093580,
      name: r'sourceId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'sourceId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'serverCollectionId': IndexSchema(
      id: -546079356141212449,
      name: r'serverCollectionId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'serverCollectionId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'collectionId': IndexSchema(
      id: -7489395134515229581,
      name: r'collectionId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'collectionId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'originId': IndexSchema(
      id: 6997121843849413747,
      name: r'originId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'originId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'searchTokens': IndexSchema(
      id: 2062148741461982474,
      name: r'searchTokens',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'searchTokens',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _isarClipboardItemGetId,
  getLinks: _isarClipboardItemGetLinks,
  attach: _isarClipboardItemAttach,
  version: '3.4.1',
);

int _isarClipboardItemEstimateSize(
  IsarClipboardItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.deviceId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.driveFileId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.encMode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fileExtension;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fileMimeType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fileName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imgBlurHash;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.iv;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.linkPreviewDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.linkPreviewImageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.linkPreviewTitle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.localPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.originId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.os.name.length * 3;
  {
    final value = object.richData;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.searchTokens.length * 3;
  {
    for (var i = 0; i < object.searchTokens.length; i++) {
      final value = object.searchTokens[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.sourceApp;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sourceId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sourceUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.text;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.textCategory;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.type.name.length * 3;
  {
    final value = object.url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _isarClipboardItemSerialize(
  IsarClipboardItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.collectionId);
  writer.writeLong(offsets[1], object.copiedCount);
  writer.writeDateTime(offsets[2], object.created);
  writer.writeDateTime(offsets[3], object.deletedAt);
  writer.writeString(offsets[4], object.description);
  writer.writeString(offsets[5], object.deviceId);
  writer.writeString(offsets[6], object.driveFileId);
  writer.writeString(offsets[7], object.encMode);
  writer.writeBool(offsets[8], object.encrypted);
  writer.writeString(offsets[9], object.fileExtension);
  writer.writeString(offsets[10], object.fileMimeType);
  writer.writeString(offsets[11], object.fileName);
  writer.writeLong(offsets[12], object.fileSize);
  writer.writeString(offsets[13], object.imgBlurHash);
  writer.writeString(offsets[14], object.iv);
  writer.writeDateTime(offsets[15], object.lastCopied);
  writer.writeDateTime(offsets[16], object.lastSynced);
  writer.writeString(offsets[17], object.linkPreviewDescription);
  writer.writeString(offsets[18], object.linkPreviewImageUrl);
  writer.writeString(offsets[19], object.linkPreviewTitle);
  writer.writeBool(offsets[20], object.localOnly);
  writer.writeString(offsets[21], object.localPath);
  writer.writeBool(offsets[22], object.locked);
  writer.writeDateTime(offsets[23], object.modified);
  writer.writeString(offsets[24], object.originId);
  writer.writeString(offsets[25], object.os.name);
  writer.writeString(offsets[26], object.richData);
  writer.writeStringList(offsets[27], object.searchTokens);
  writer.writeLong(offsets[28], object.serverCollectionId);
  writer.writeLong(offsets[29], object.serverId);
  writer.writeString(offsets[30], object.sourceApp);
  writer.writeString(offsets[31], object.sourceId);
  writer.writeString(offsets[32], object.sourceUrl);
  writer.writeString(offsets[33], object.text);
  writer.writeString(offsets[34], object.textCategory?.name);
  writer.writeString(offsets[35], object.title);
  writer.writeString(offsets[36], object.type.name);
  writer.writeString(offsets[37], object.url);
  writer.writeString(offsets[38], object.userId);
}

IsarClipboardItem _isarClipboardItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarClipboardItem();
  object.collectionId = reader.readLongOrNull(offsets[0]);
  object.copiedCount = reader.readLong(offsets[1]);
  object.created = reader.readDateTime(offsets[2]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[3]);
  object.description = reader.readStringOrNull(offsets[4]);
  object.deviceId = reader.readStringOrNull(offsets[5]);
  object.driveFileId = reader.readStringOrNull(offsets[6]);
  object.encMode = reader.readStringOrNull(offsets[7]);
  object.encrypted = reader.readBool(offsets[8]);
  object.fileExtension = reader.readStringOrNull(offsets[9]);
  object.fileMimeType = reader.readStringOrNull(offsets[10]);
  object.fileName = reader.readStringOrNull(offsets[11]);
  object.fileSize = reader.readLongOrNull(offsets[12]);
  object.imgBlurHash = reader.readStringOrNull(offsets[13]);
  object.isarId = id;
  object.iv = reader.readStringOrNull(offsets[14]);
  object.lastCopied = reader.readDateTimeOrNull(offsets[15]);
  object.lastSynced = reader.readDateTimeOrNull(offsets[16]);
  object.linkPreviewDescription = reader.readStringOrNull(offsets[17]);
  object.linkPreviewImageUrl = reader.readStringOrNull(offsets[18]);
  object.linkPreviewTitle = reader.readStringOrNull(offsets[19]);
  object.localOnly = reader.readBool(offsets[20]);
  object.localPath = reader.readStringOrNull(offsets[21]);
  object.locked = reader.readBool(offsets[22]);
  object.modified = reader.readDateTime(offsets[23]);
  object.originId = reader.readStringOrNull(offsets[24]);
  object.os =
      _IsarClipboardItemosValueEnumMap[reader.readStringOrNull(offsets[25])] ??
      PlatformOS.android;
  object.richData = reader.readStringOrNull(offsets[26]);
  object.serverCollectionId = reader.readLongOrNull(offsets[28]);
  object.serverId = reader.readLongOrNull(offsets[29]);
  object.sourceApp = reader.readStringOrNull(offsets[30]);
  object.sourceId = reader.readStringOrNull(offsets[31]);
  object.sourceUrl = reader.readStringOrNull(offsets[32]);
  object.text = reader.readStringOrNull(offsets[33]);
  object.textCategory =
      _IsarClipboardItemtextCategoryValueEnumMap[reader.readStringOrNull(
        offsets[34],
      )];
  object.title = reader.readStringOrNull(offsets[35]);
  object.type =
      _IsarClipboardItemtypeValueEnumMap[reader.readStringOrNull(
        offsets[36],
      )] ??
      ClipItemType.text;
  object.url = reader.readStringOrNull(offsets[37]);
  object.userId = reader.readString(offsets[38]);
  return object;
}

P _isarClipboardItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readBool(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readBool(offset)) as P;
    case 23:
      return (reader.readDateTime(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (_IsarClipboardItemosValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              PlatformOS.android)
          as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (reader.readStringList(offset) ?? []) as P;
    case 28:
      return (reader.readLongOrNull(offset)) as P;
    case 29:
      return (reader.readLongOrNull(offset)) as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    case 31:
      return (reader.readStringOrNull(offset)) as P;
    case 32:
      return (reader.readStringOrNull(offset)) as P;
    case 33:
      return (reader.readStringOrNull(offset)) as P;
    case 34:
      return (_IsarClipboardItemtextCategoryValueEnumMap[reader
              .readStringOrNull(offset)])
          as P;
    case 35:
      return (reader.readStringOrNull(offset)) as P;
    case 36:
      return (_IsarClipboardItemtypeValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              ClipItemType.text)
          as P;
    case 37:
      return (reader.readStringOrNull(offset)) as P;
    case 38:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarClipboardItemosEnumValueMap = {
  r'android': r'android',
  r'ios': r'ios',
  r'macos': r'macos',
  r'windows': r'windows',
  r'linux': r'linux',
};
const _IsarClipboardItemosValueEnumMap = {
  r'android': PlatformOS.android,
  r'ios': PlatformOS.ios,
  r'macos': PlatformOS.macos,
  r'windows': PlatformOS.windows,
  r'linux': PlatformOS.linux,
};
const _IsarClipboardItemtextCategoryEnumValueMap = {
  r'color': r'color',
  r'email': r'email',
  r'phone': r'phone',
  r'struct': r'struct',
};
const _IsarClipboardItemtextCategoryValueEnumMap = {
  r'color': TextCategory.color,
  r'email': TextCategory.email,
  r'phone': TextCategory.phone,
  r'struct': TextCategory.struct,
};
const _IsarClipboardItemtypeEnumValueMap = {
  r'text': r'text',
  r'media': r'media',
  r'file': r'file',
  r'url': r'url',
};
const _IsarClipboardItemtypeValueEnumMap = {
  r'text': ClipItemType.text,
  r'media': ClipItemType.media,
  r'file': ClipItemType.file,
  r'url': ClipItemType.url,
};

Id _isarClipboardItemGetId(IsarClipboardItem object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _isarClipboardItemGetLinks(
  IsarClipboardItem object,
) {
  return [];
}

void _isarClipboardItemAttach(
  IsarCollection<dynamic> col,
  Id id,
  IsarClipboardItem object,
) {
  object.isarId = id;
}

extension IsarClipboardItemQueryWhereSort
    on QueryBuilder<IsarClipboardItem, IsarClipboardItem, QWhere> {
  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhere>
  anyServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'serverId'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhere>
  anyDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'deletedAt'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhere> anyLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'locked'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhere>
  anyEncrypted() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'encrypted'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhere>
  anyServerCollectionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'serverCollectionId'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhere>
  anyCollectionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'collectionId'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhere>
  anySearchTokensElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'searchTokens'),
      );
    });
  }
}

extension IsarClipboardItemQueryWhere
    on QueryBuilder<IsarClipboardItem, IsarClipboardItem, QWhereClause> {
  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerIsarId,
          includeLower: includeLower,
          upper: upperIsarId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [null]),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'serverId',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  serverIdEqualTo(int? serverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [serverId]),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  serverIdNotEqualTo(int? serverId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serverId',
                lower: [],
                upper: [serverId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serverId',
                lower: [serverId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serverId',
                lower: [serverId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serverId',
                lower: [],
                upper: [serverId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  serverIdGreaterThan(int? serverId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'serverId',
          lower: [serverId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  serverIdLessThan(int? serverId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'serverId',
          lower: [],
          upper: [serverId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  serverIdBetween(
    int? lowerServerId,
    int? upperServerId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'serverId',
          lower: [lowerServerId],
          includeLower: includeLower,
          upper: [upperServerId],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  typeEqualTo(ClipItemType type) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'type', value: [type]),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  typeNotEqualTo(ClipItemType type) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'type',
                lower: [],
                upper: [type],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'type',
                lower: [type],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'type',
                lower: [type],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'type',
                lower: [],
                upper: [type],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'deletedAt', value: [null]),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'deletedAt',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  deletedAtEqualTo(DateTime? deletedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'deletedAt', value: [deletedAt]),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  deletedAtNotEqualTo(DateTime? deletedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'deletedAt',
                lower: [],
                upper: [deletedAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'deletedAt',
                lower: [deletedAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'deletedAt',
                lower: [deletedAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'deletedAt',
                lower: [],
                upper: [deletedAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  deletedAtGreaterThan(DateTime? deletedAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'deletedAt',
          lower: [deletedAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  deletedAtLessThan(DateTime? deletedAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'deletedAt',
          lower: [],
          upper: [deletedAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  deletedAtBetween(
    DateTime? lowerDeletedAt,
    DateTime? upperDeletedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'deletedAt',
          lower: [lowerDeletedAt],
          includeLower: includeLower,
          upper: [upperDeletedAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  lockedEqualTo(bool locked) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'locked', value: [locked]),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  lockedNotEqualTo(bool locked) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'locked',
                lower: [],
                upper: [locked],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'locked',
                lower: [locked],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'locked',
                lower: [locked],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'locked',
                lower: [],
                upper: [locked],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  encryptedEqualTo(bool encrypted) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'encrypted', value: [encrypted]),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  encryptedNotEqualTo(bool encrypted) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'encrypted',
                lower: [],
                upper: [encrypted],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'encrypted',
                lower: [encrypted],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'encrypted',
                lower: [encrypted],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'encrypted',
                lower: [],
                upper: [encrypted],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  textCategoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'textCategory', value: [null]),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  textCategoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'textCategory',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  textCategoryEqualTo(TextCategory? textCategory) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'textCategory',
          value: [textCategory],
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  textCategoryNotEqualTo(TextCategory? textCategory) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'textCategory',
                lower: [],
                upper: [textCategory],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'textCategory',
                lower: [textCategory],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'textCategory',
                lower: [textCategory],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'textCategory',
                lower: [],
                upper: [textCategory],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  sourceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'sourceId', value: [null]),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  sourceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'sourceId',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  sourceIdEqualTo(String? sourceId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'sourceId', value: [sourceId]),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  sourceIdNotEqualTo(String? sourceId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sourceId',
                lower: [],
                upper: [sourceId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sourceId',
                lower: [sourceId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sourceId',
                lower: [sourceId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sourceId',
                lower: [],
                upper: [sourceId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  serverCollectionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'serverCollectionId',
          value: [null],
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  serverCollectionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'serverCollectionId',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  serverCollectionIdEqualTo(int? serverCollectionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'serverCollectionId',
          value: [serverCollectionId],
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  serverCollectionIdNotEqualTo(int? serverCollectionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serverCollectionId',
                lower: [],
                upper: [serverCollectionId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serverCollectionId',
                lower: [serverCollectionId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serverCollectionId',
                lower: [serverCollectionId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serverCollectionId',
                lower: [],
                upper: [serverCollectionId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  serverCollectionIdGreaterThan(
    int? serverCollectionId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'serverCollectionId',
          lower: [serverCollectionId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  serverCollectionIdLessThan(int? serverCollectionId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'serverCollectionId',
          lower: [],
          upper: [serverCollectionId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  serverCollectionIdBetween(
    int? lowerServerCollectionId,
    int? upperServerCollectionId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'serverCollectionId',
          lower: [lowerServerCollectionId],
          includeLower: includeLower,
          upper: [upperServerCollectionId],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  collectionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'collectionId', value: [null]),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  collectionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'collectionId',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  collectionIdEqualTo(int? collectionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'collectionId',
          value: [collectionId],
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  collectionIdNotEqualTo(int? collectionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'collectionId',
                lower: [],
                upper: [collectionId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'collectionId',
                lower: [collectionId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'collectionId',
                lower: [collectionId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'collectionId',
                lower: [],
                upper: [collectionId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  collectionIdGreaterThan(int? collectionId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'collectionId',
          lower: [collectionId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  collectionIdLessThan(int? collectionId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'collectionId',
          lower: [],
          upper: [collectionId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  collectionIdBetween(
    int? lowerCollectionId,
    int? upperCollectionId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'collectionId',
          lower: [lowerCollectionId],
          includeLower: includeLower,
          upper: [upperCollectionId],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  originIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'originId', value: [null]),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  originIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'originId',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  originIdEqualTo(String? originId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'originId', value: [originId]),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  originIdNotEqualTo(String? originId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'originId',
                lower: [],
                upper: [originId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'originId',
                lower: [originId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'originId',
                lower: [originId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'originId',
                lower: [],
                upper: [originId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  searchTokensElementEqualTo(String searchTokensElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'searchTokens',
          value: [searchTokensElement],
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  searchTokensElementNotEqualTo(String searchTokensElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'searchTokens',
                lower: [],
                upper: [searchTokensElement],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'searchTokens',
                lower: [searchTokensElement],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'searchTokens',
                lower: [searchTokensElement],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'searchTokens',
                lower: [],
                upper: [searchTokensElement],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  searchTokensElementGreaterThan(
    String searchTokensElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'searchTokens',
          lower: [searchTokensElement],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  searchTokensElementLessThan(
    String searchTokensElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'searchTokens',
          lower: [],
          upper: [searchTokensElement],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  searchTokensElementBetween(
    String lowerSearchTokensElement,
    String upperSearchTokensElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'searchTokens',
          lower: [lowerSearchTokensElement],
          includeLower: includeLower,
          upper: [upperSearchTokensElement],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  searchTokensElementStartsWith(String SearchTokensElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'searchTokens',
          lower: [SearchTokensElementPrefix],
          upper: ['$SearchTokensElementPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  searchTokensElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'searchTokens', value: ['']),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterWhereClause>
  searchTokensElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'searchTokens',
                upper: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'searchTokens',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'searchTokens',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'searchTokens',
                upper: [''],
              ),
            );
      }
    });
  }
}

extension IsarClipboardItemQueryFilter
    on QueryBuilder<IsarClipboardItem, IsarClipboardItem, QFilterCondition> {
  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  collectionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'collectionId'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  collectionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'collectionId'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  collectionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'collectionId', value: value),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  collectionIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'collectionId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  collectionIdLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'collectionId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  collectionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'collectionId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  copiedCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'copiedCount', value: value),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  copiedCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'copiedCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  copiedCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'copiedCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  copiedCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'copiedCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  createdEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'created', value: value),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  createdGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'created',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  createdLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'created',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  createdBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'created',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'deletedAt'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'deletedAt'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'deletedAt', value: value),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  deletedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'deletedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  deletedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'deletedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  deletedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'deletedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'description'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'description'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  descriptionEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'description',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  descriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  descriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'description',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  deviceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'deviceId'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  deviceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'deviceId'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  deviceIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'deviceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  deviceIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'deviceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  deviceIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'deviceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  deviceIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'deviceId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  deviceIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'deviceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  deviceIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'deviceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'deviceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'deviceId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'deviceId', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'deviceId', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  driveFileIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'driveFileId'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  driveFileIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'driveFileId'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  driveFileIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'driveFileId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  driveFileIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'driveFileId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  driveFileIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'driveFileId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  driveFileIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'driveFileId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  driveFileIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'driveFileId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  driveFileIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'driveFileId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  driveFileIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'driveFileId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  driveFileIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'driveFileId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  driveFileIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'driveFileId', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  driveFileIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'driveFileId', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  encModeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'encMode'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  encModeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'encMode'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  encModeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'encMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  encModeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'encMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  encModeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'encMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  encModeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'encMode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  encModeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'encMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  encModeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'encMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  encModeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'encMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  encModeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'encMode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  encModeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'encMode', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  encModeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'encMode', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  encryptedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'encrypted', value: value),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileExtensionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'fileExtension'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileExtensionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'fileExtension'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileExtensionEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'fileExtension',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileExtensionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'fileExtension',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileExtensionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'fileExtension',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileExtensionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'fileExtension',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileExtensionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'fileExtension',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileExtensionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'fileExtension',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileExtensionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'fileExtension',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileExtensionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'fileExtension',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileExtensionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fileExtension', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileExtensionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'fileExtension', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileMimeTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'fileMimeType'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileMimeTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'fileMimeType'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileMimeTypeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'fileMimeType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileMimeTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'fileMimeType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileMimeTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'fileMimeType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileMimeTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'fileMimeType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileMimeTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'fileMimeType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileMimeTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'fileMimeType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileMimeTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'fileMimeType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileMimeTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'fileMimeType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileMimeTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fileMimeType', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileMimeTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'fileMimeType', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'fileName'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'fileName'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'fileName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'fileName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'fileName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'fileName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'fileName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'fileName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'fileName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'fileName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fileName', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'fileName', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'fileSize'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'fileSize'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileSizeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fileSize', value: value),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileSizeGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'fileSize',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileSizeLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'fileSize',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  fileSizeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'fileSize',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  imgBlurHashIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'imgBlurHash'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  imgBlurHashIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'imgBlurHash'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  imgBlurHashEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'imgBlurHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  imgBlurHashGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'imgBlurHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  imgBlurHashLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'imgBlurHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  imgBlurHashBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'imgBlurHash',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  imgBlurHashStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'imgBlurHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  imgBlurHashEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'imgBlurHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  imgBlurHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'imgBlurHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  imgBlurHashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'imgBlurHash',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  imgBlurHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'imgBlurHash', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  imgBlurHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'imgBlurHash', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  isarIdGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'isarId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  isarIdLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'isarId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'isarId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  ivIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'iv'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  ivIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'iv'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  ivEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'iv',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  ivGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'iv',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  ivLessThan(String? value, {bool include = false, bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'iv',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  ivBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'iv',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  ivStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'iv',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  ivEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'iv',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  ivContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'iv',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  ivMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'iv',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  ivIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'iv', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  ivIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'iv', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  lastCopiedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastCopied'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  lastCopiedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastCopied'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  lastCopiedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastCopied', value: value),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  lastCopiedGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastCopied',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  lastCopiedLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastCopied',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  lastCopiedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastCopied',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  lastSyncedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastSynced'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  lastSyncedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastSynced'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  lastSyncedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastSynced', value: value),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  lastSyncedGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastSynced',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  lastSyncedLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastSynced',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  lastSyncedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastSynced',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'linkPreviewDescription'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'linkPreviewDescription'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewDescriptionEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'linkPreviewDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'linkPreviewDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'linkPreviewDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'linkPreviewDescription',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewDescriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'linkPreviewDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewDescriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'linkPreviewDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'linkPreviewDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'linkPreviewDescription',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'linkPreviewDescription', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'linkPreviewDescription',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewImageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'linkPreviewImageUrl'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewImageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'linkPreviewImageUrl'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewImageUrlEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'linkPreviewImageUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewImageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'linkPreviewImageUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewImageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'linkPreviewImageUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewImageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'linkPreviewImageUrl',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewImageUrlStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'linkPreviewImageUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewImageUrlEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'linkPreviewImageUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewImageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'linkPreviewImageUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewImageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'linkPreviewImageUrl',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewImageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'linkPreviewImageUrl', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewImageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'linkPreviewImageUrl',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'linkPreviewTitle'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'linkPreviewTitle'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewTitleEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'linkPreviewTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewTitleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'linkPreviewTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewTitleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'linkPreviewTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewTitleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'linkPreviewTitle',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewTitleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'linkPreviewTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewTitleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'linkPreviewTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'linkPreviewTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'linkPreviewTitle',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'linkPreviewTitle', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  linkPreviewTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'linkPreviewTitle', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  localOnlyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'localOnly', value: value),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  localPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'localPath'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  localPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'localPath'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  localPathEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'localPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  localPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'localPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  localPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'localPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  localPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'localPath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  localPathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'localPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  localPathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'localPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  localPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'localPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  localPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'localPath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  localPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'localPath', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  localPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'localPath', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  lockedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'locked', value: value),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  modifiedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'modified', value: value),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  modifiedGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'modified',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  modifiedLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'modified',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  modifiedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'modified',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  originIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'originId'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  originIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'originId'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  originIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'originId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  originIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'originId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  originIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'originId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  originIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'originId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  originIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'originId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  originIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'originId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  originIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'originId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  originIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'originId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  originIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'originId', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  originIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'originId', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  osEqualTo(PlatformOS value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'os',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  osGreaterThan(
    PlatformOS value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'os',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  osLessThan(
    PlatformOS value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'os',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  osBetween(
    PlatformOS lower,
    PlatformOS upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'os',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  osStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'os',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  osEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'os',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  osContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'os',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  osMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'os',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  osIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'os', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  osIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'os', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  richDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'richData'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  richDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'richData'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  richDataEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'richData',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  richDataGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'richData',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  richDataLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'richData',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  richDataBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'richData',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  richDataStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'richData',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  richDataEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'richData',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  richDataContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'richData',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  richDataMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'richData',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  richDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'richData', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  richDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'richData', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  searchTokensElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'searchTokens',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  searchTokensElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'searchTokens',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  searchTokensElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'searchTokens',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  searchTokensElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'searchTokens',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  searchTokensElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'searchTokens',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  searchTokensElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'searchTokens',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  searchTokensElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'searchTokens',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  searchTokensElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'searchTokens',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  searchTokensElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'searchTokens', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  searchTokensElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'searchTokens', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  searchTokensLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'searchTokens', length, true, length, true);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  searchTokensIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'searchTokens', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  searchTokensIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'searchTokens', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  searchTokensLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'searchTokens', 0, true, length, include);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  searchTokensLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'searchTokens', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  searchTokensLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'searchTokens',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  serverCollectionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'serverCollectionId'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  serverCollectionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'serverCollectionId'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  serverCollectionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverCollectionId', value: value),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  serverCollectionIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'serverCollectionId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  serverCollectionIdLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'serverCollectionId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  serverCollectionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'serverCollectionId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  serverIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverId', value: value),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  serverIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'serverId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  serverIdLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'serverId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  serverIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'serverId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceAppIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sourceApp'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceAppIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sourceApp'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceAppEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sourceApp',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceAppGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sourceApp',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceAppLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sourceApp',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceAppBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sourceApp',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceAppStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sourceApp',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceAppEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sourceApp',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceAppContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sourceApp',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceAppMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sourceApp',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceAppIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sourceApp', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceAppIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sourceApp', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sourceId'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sourceId'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sourceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sourceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sourceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sourceId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sourceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sourceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sourceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sourceId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sourceId', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sourceId', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sourceUrl'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sourceUrl'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceUrlEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sourceUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sourceUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sourceUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sourceUrl',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceUrlStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sourceUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceUrlEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sourceUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sourceUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sourceUrl',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sourceUrl', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  sourceUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sourceUrl', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'text'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'text'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'text',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'text',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'text',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'text',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'text',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'text',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'text',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'text',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'text', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'text', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textCategoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'textCategory'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textCategoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'textCategory'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textCategoryEqualTo(TextCategory? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'textCategory',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textCategoryGreaterThan(
    TextCategory? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'textCategory',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textCategoryLessThan(
    TextCategory? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'textCategory',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textCategoryBetween(
    TextCategory? lower,
    TextCategory? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'textCategory',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textCategoryStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'textCategory',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textCategoryEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'textCategory',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'textCategory',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'textCategory',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'textCategory', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  textCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'textCategory', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'title'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'title'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  titleEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  titleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  titleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  typeEqualTo(ClipItemType value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  typeGreaterThan(
    ClipItemType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  typeLessThan(
    ClipItemType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  typeBetween(
    ClipItemType lower,
    ClipItemType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'type',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  typeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  typeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'type',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'url'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'url'),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  urlEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  urlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  urlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  urlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'url',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  urlStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  urlEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  urlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  urlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'url',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'url', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'url', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  userIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  userIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  userIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'userId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterFilterCondition>
  userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userId', value: ''),
      );
    });
  }
}

extension IsarClipboardItemQueryObject
    on QueryBuilder<IsarClipboardItem, IsarClipboardItem, QFilterCondition> {}

extension IsarClipboardItemQueryLinks
    on QueryBuilder<IsarClipboardItem, IsarClipboardItem, QFilterCondition> {}

extension IsarClipboardItemQuerySortBy
    on QueryBuilder<IsarClipboardItem, IsarClipboardItem, QSortBy> {
  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByCollectionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionId', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByCollectionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionId', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByCopiedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copiedCount', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByCopiedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copiedCount', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByDriveFileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driveFileId', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByDriveFileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driveFileId', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByEncMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encMode', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByEncModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encMode', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByEncrypted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encrypted', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByEncryptedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encrypted', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByFileExtension() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileExtension', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByFileExtensionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileExtension', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByFileMimeType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileMimeType', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByFileMimeTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileMimeType', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByFileSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSize', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByFileSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSize', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByImgBlurHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imgBlurHash', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByImgBlurHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imgBlurHash', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy> sortByIv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iv', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByIvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iv', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByLastCopied() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCopied', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByLastCopiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCopied', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByLastSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSynced', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByLastSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSynced', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByLinkPreviewDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkPreviewDescription', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByLinkPreviewDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkPreviewDescription', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByLinkPreviewImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkPreviewImageUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByLinkPreviewImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkPreviewImageUrl', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByLinkPreviewTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkPreviewTitle', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByLinkPreviewTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkPreviewTitle', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByLocalOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localOnly', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByLocalOnlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localOnly', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByLockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByOriginId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originId', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByOriginIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originId', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy> sortByOs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'os', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByOsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'os', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByRichData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'richData', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByRichDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'richData', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByServerCollectionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverCollectionId', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByServerCollectionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverCollectionId', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortBySourceApp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceApp', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortBySourceAppDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceApp', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortBySourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortBySourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortBySourceUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortBySourceUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByTextCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textCategory', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByTextCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textCategory', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension IsarClipboardItemQuerySortThenBy
    on QueryBuilder<IsarClipboardItem, IsarClipboardItem, QSortThenBy> {
  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByCollectionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionId', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByCollectionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionId', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByCopiedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copiedCount', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByCopiedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copiedCount', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByDriveFileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driveFileId', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByDriveFileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driveFileId', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByEncMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encMode', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByEncModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encMode', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByEncrypted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encrypted', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByEncryptedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encrypted', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByFileExtension() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileExtension', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByFileExtensionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileExtension', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByFileMimeType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileMimeType', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByFileMimeTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileMimeType', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByFileSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSize', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByFileSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSize', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByImgBlurHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imgBlurHash', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByImgBlurHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imgBlurHash', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy> thenByIv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iv', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByIvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iv', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByLastCopied() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCopied', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByLastCopiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCopied', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByLastSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSynced', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByLastSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSynced', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByLinkPreviewDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkPreviewDescription', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByLinkPreviewDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkPreviewDescription', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByLinkPreviewImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkPreviewImageUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByLinkPreviewImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkPreviewImageUrl', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByLinkPreviewTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkPreviewTitle', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByLinkPreviewTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkPreviewTitle', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByLocalOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localOnly', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByLocalOnlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localOnly', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByLockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByOriginId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originId', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByOriginIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originId', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy> thenByOs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'os', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByOsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'os', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByRichData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'richData', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByRichDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'richData', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByServerCollectionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverCollectionId', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByServerCollectionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverCollectionId', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenBySourceApp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceApp', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenBySourceAppDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceApp', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenBySourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenBySourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenBySourceUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenBySourceUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByTextCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textCategory', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByTextCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textCategory', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QAfterSortBy>
  thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension IsarClipboardItemQueryWhereDistinct
    on QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct> {
  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByCollectionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'collectionId');
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByCopiedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'copiedCount');
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'created');
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByDriveFileId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driveFileId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByEncMode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'encMode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByEncrypted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'encrypted');
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByFileExtension({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'fileExtension',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByFileMimeType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileMimeType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByFileName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByFileSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileSize');
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByImgBlurHash({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imgBlurHash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct> distinctByIv({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iv', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByLastCopied() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastCopied');
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByLastSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSynced');
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByLinkPreviewDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'linkPreviewDescription',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByLinkPreviewImageUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'linkPreviewImageUrl',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByLinkPreviewTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'linkPreviewTitle',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByLocalOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localOnly');
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByLocalPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locked');
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modified');
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByOriginId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct> distinctByOs({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'os', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByRichData({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'richData', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctBySearchTokens() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'searchTokens');
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByServerCollectionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverCollectionId');
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId');
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctBySourceApp({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceApp', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctBySourceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctBySourceUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct> distinctByText({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByTextCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'textCategory', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct> distinctByType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct> distinctByUrl({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarClipboardItem, IsarClipboardItem, QDistinct>
  distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension IsarClipboardItemQueryProperty
    on QueryBuilder<IsarClipboardItem, IsarClipboardItem, QQueryProperty> {
  QueryBuilder<IsarClipboardItem, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<IsarClipboardItem, int?, QQueryOperations>
  collectionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'collectionId');
    });
  }

  QueryBuilder<IsarClipboardItem, int, QQueryOperations> copiedCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'copiedCount');
    });
  }

  QueryBuilder<IsarClipboardItem, DateTime, QQueryOperations>
  createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'created');
    });
  }

  QueryBuilder<IsarClipboardItem, DateTime?, QQueryOperations>
  deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations>
  descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations>
  deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations>
  driveFileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driveFileId');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations> encModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'encMode');
    });
  }

  QueryBuilder<IsarClipboardItem, bool, QQueryOperations> encryptedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'encrypted');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations>
  fileExtensionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileExtension');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations>
  fileMimeTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileMimeType');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations>
  fileNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileName');
    });
  }

  QueryBuilder<IsarClipboardItem, int?, QQueryOperations> fileSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileSize');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations>
  imgBlurHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imgBlurHash');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations> ivProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iv');
    });
  }

  QueryBuilder<IsarClipboardItem, DateTime?, QQueryOperations>
  lastCopiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastCopied');
    });
  }

  QueryBuilder<IsarClipboardItem, DateTime?, QQueryOperations>
  lastSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSynced');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations>
  linkPreviewDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkPreviewDescription');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations>
  linkPreviewImageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkPreviewImageUrl');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations>
  linkPreviewTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkPreviewTitle');
    });
  }

  QueryBuilder<IsarClipboardItem, bool, QQueryOperations> localOnlyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localOnly');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations>
  localPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localPath');
    });
  }

  QueryBuilder<IsarClipboardItem, bool, QQueryOperations> lockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locked');
    });
  }

  QueryBuilder<IsarClipboardItem, DateTime, QQueryOperations>
  modifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modified');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations>
  originIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originId');
    });
  }

  QueryBuilder<IsarClipboardItem, PlatformOS, QQueryOperations> osProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'os');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations>
  richDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'richData');
    });
  }

  QueryBuilder<IsarClipboardItem, List<String>, QQueryOperations>
  searchTokensProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'searchTokens');
    });
  }

  QueryBuilder<IsarClipboardItem, int?, QQueryOperations>
  serverCollectionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverCollectionId');
    });
  }

  QueryBuilder<IsarClipboardItem, int?, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations>
  sourceAppProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceApp');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations>
  sourceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceId');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations>
  sourceUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceUrl');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }

  QueryBuilder<IsarClipboardItem, TextCategory?, QQueryOperations>
  textCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'textCategory');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<IsarClipboardItem, ClipItemType, QQueryOperations>
  typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<IsarClipboardItem, String?, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }

  QueryBuilder<IsarClipboardItem, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
