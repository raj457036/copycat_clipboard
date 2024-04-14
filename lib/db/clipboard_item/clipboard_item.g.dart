// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clipboard_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetClipboardItemCollection on Isar {
  IsarCollection<ClipboardItem> get clipboardItems => this.collection();
}

const ClipboardItemSchema = CollectionSchema(
  name: r'ClipboardItem',
  id: 7228975801377184843,
  properties: {
    r'copiedCount': PropertySchema(
      id: 0,
      name: r'copiedCount',
      type: IsarType.long,
    ),
    r'created': PropertySchema(
      id: 1,
      name: r'created',
      type: IsarType.dateTime,
    ),
    r'deletedAt': PropertySchema(
      id: 2,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'driveFileId': PropertySchema(
      id: 4,
      name: r'driveFileId',
      type: IsarType.string,
    ),
    r'encrypted': PropertySchema(
      id: 5,
      name: r'encrypted',
      type: IsarType.bool,
    ),
    r'fileExtension': PropertySchema(
      id: 6,
      name: r'fileExtension',
      type: IsarType.string,
    ),
    r'fileMimeType': PropertySchema(
      id: 7,
      name: r'fileMimeType',
      type: IsarType.string,
    ),
    r'fileName': PropertySchema(
      id: 8,
      name: r'fileName',
      type: IsarType.string,
    ),
    r'fileSize': PropertySchema(
      id: 9,
      name: r'fileSize',
      type: IsarType.long,
    ),
    r'imgBlurHash': PropertySchema(
      id: 10,
      name: r'imgBlurHash',
      type: IsarType.string,
    ),
    r'isPersisted': PropertySchema(
      id: 11,
      name: r'isPersisted',
      type: IsarType.bool,
    ),
    r'isSynced': PropertySchema(
      id: 12,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'lastCopied': PropertySchema(
      id: 13,
      name: r'lastCopied',
      type: IsarType.dateTime,
    ),
    r'lastSynced': PropertySchema(
      id: 14,
      name: r'lastSynced',
      type: IsarType.dateTime,
    ),
    r'localOnly': PropertySchema(
      id: 15,
      name: r'localOnly',
      type: IsarType.bool,
    ),
    r'localPath': PropertySchema(
      id: 16,
      name: r'localPath',
      type: IsarType.string,
    ),
    r'modified': PropertySchema(
      id: 17,
      name: r'modified',
      type: IsarType.dateTime,
    ),
    r'os': PropertySchema(
      id: 18,
      name: r'os',
      type: IsarType.string,
      enumMap: _ClipboardItemosEnumValueMap,
    ),
    r'serverId': PropertySchema(
      id: 19,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'sourceApp': PropertySchema(
      id: 20,
      name: r'sourceApp',
      type: IsarType.string,
    ),
    r'sourceUrl': PropertySchema(
      id: 21,
      name: r'sourceUrl',
      type: IsarType.string,
    ),
    r'text': PropertySchema(
      id: 22,
      name: r'text',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 23,
      name: r'title',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 24,
      name: r'type',
      type: IsarType.string,
      enumMap: _ClipboardItemtypeEnumValueMap,
    ),
    r'url': PropertySchema(
      id: 25,
      name: r'url',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 26,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _clipboardItemEstimateSize,
  serialize: _clipboardItemSerialize,
  deserialize: _clipboardItemDeserialize,
  deserializeProp: _clipboardItemDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _clipboardItemGetId,
  getLinks: _clipboardItemGetLinks,
  attach: _clipboardItemAttach,
  version: '3.1.0+1',
);

int _clipboardItemEstimateSize(
  ClipboardItem object,
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
    final value = object.driveFileId;
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
    final value = object.localPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.os.name.length * 3;
  {
    final value = object.serverId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sourceApp;
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

void _clipboardItemSerialize(
  ClipboardItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.copiedCount);
  writer.writeDateTime(offsets[1], object.created);
  writer.writeDateTime(offsets[2], object.deletedAt);
  writer.writeString(offsets[3], object.description);
  writer.writeString(offsets[4], object.driveFileId);
  writer.writeBool(offsets[5], object.encrypted);
  writer.writeString(offsets[6], object.fileExtension);
  writer.writeString(offsets[7], object.fileMimeType);
  writer.writeString(offsets[8], object.fileName);
  writer.writeLong(offsets[9], object.fileSize);
  writer.writeString(offsets[10], object.imgBlurHash);
  writer.writeBool(offsets[11], object.isPersisted);
  writer.writeBool(offsets[12], object.isSynced);
  writer.writeDateTime(offsets[13], object.lastCopied);
  writer.writeDateTime(offsets[14], object.lastSynced);
  writer.writeBool(offsets[15], object.localOnly);
  writer.writeString(offsets[16], object.localPath);
  writer.writeDateTime(offsets[17], object.modified);
  writer.writeString(offsets[18], object.os.name);
  writer.writeString(offsets[19], object.serverId);
  writer.writeString(offsets[20], object.sourceApp);
  writer.writeString(offsets[21], object.sourceUrl);
  writer.writeString(offsets[22], object.text);
  writer.writeString(offsets[23], object.title);
  writer.writeString(offsets[24], object.type.name);
  writer.writeString(offsets[25], object.url);
  writer.writeString(offsets[26], object.userId);
}

ClipboardItem _clipboardItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ClipboardItem(
    copiedCount: reader.readLong(offsets[0]),
    created: reader.readDateTime(offsets[1]),
    deletedAt: reader.readDateTimeOrNull(offsets[2]),
    description: reader.readStringOrNull(offsets[3]),
    driveFileId: reader.readStringOrNull(offsets[4]),
    encrypted: reader.readBool(offsets[5]),
    fileExtension: reader.readStringOrNull(offsets[6]),
    fileMimeType: reader.readStringOrNull(offsets[7]),
    fileName: reader.readStringOrNull(offsets[8]),
    fileSize: reader.readLongOrNull(offsets[9]),
    imgBlurHash: reader.readStringOrNull(offsets[10]),
    lastCopied: reader.readDateTimeOrNull(offsets[13]),
    lastSynced: reader.readDateTimeOrNull(offsets[14]),
    localOnly: reader.readBool(offsets[15]),
    localPath: reader.readStringOrNull(offsets[16]),
    modified: reader.readDateTime(offsets[17]),
    os: _ClipboardItemosValueEnumMap[reader.readStringOrNull(offsets[18])] ??
        PlatformOS.android,
    serverId: reader.readStringOrNull(offsets[19]),
    sourceApp: reader.readStringOrNull(offsets[20]),
    sourceUrl: reader.readStringOrNull(offsets[21]),
    text: reader.readStringOrNull(offsets[22]),
    title: reader.readStringOrNull(offsets[23]),
    type:
        _ClipboardItemtypeValueEnumMap[reader.readStringOrNull(offsets[24])] ??
            ClipItemType.text,
    url: reader.readStringOrNull(offsets[25]),
    userId: reader.readString(offsets[26]),
  );
  object.id = id;
  return object;
}

P _clipboardItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readDateTime(offset)) as P;
    case 18:
      return (_ClipboardItemosValueEnumMap[reader.readStringOrNull(offset)] ??
          PlatformOS.android) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (_ClipboardItemtypeValueEnumMap[reader.readStringOrNull(offset)] ??
          ClipItemType.text) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    case 26:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ClipboardItemosEnumValueMap = {
  r'android': r'android',
  r'ios': r'ios',
  r'macos': r'macos',
  r'windows': r'windows',
};
const _ClipboardItemosValueEnumMap = {
  r'android': PlatformOS.android,
  r'ios': PlatformOS.ios,
  r'macos': PlatformOS.macos,
  r'windows': PlatformOS.windows,
};
const _ClipboardItemtypeEnumValueMap = {
  r'text': r'text',
  r'media': r'media',
  r'file': r'file',
  r'url': r'url',
};
const _ClipboardItemtypeValueEnumMap = {
  r'text': ClipItemType.text,
  r'media': ClipItemType.media,
  r'file': ClipItemType.file,
  r'url': ClipItemType.url,
};

Id _clipboardItemGetId(ClipboardItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _clipboardItemGetLinks(ClipboardItem object) {
  return [];
}

void _clipboardItemAttach(
    IsarCollection<dynamic> col, Id id, ClipboardItem object) {
  object.id = id;
}

extension ClipboardItemQueryWhereSort
    on QueryBuilder<ClipboardItem, ClipboardItem, QWhere> {
  QueryBuilder<ClipboardItem, ClipboardItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ClipboardItemQueryWhere
    on QueryBuilder<ClipboardItem, ClipboardItem, QWhereClause> {
  QueryBuilder<ClipboardItem, ClipboardItem, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ClipboardItemQueryFilter
    on QueryBuilder<ClipboardItem, ClipboardItem, QFilterCondition> {
  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      copiedCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'copiedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      copiedCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'copiedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      copiedCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'copiedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      copiedCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'copiedCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      createdEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      createdGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'created',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      createdLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'created',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      createdBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'created',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      deletedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      deletedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      deletedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deletedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      driveFileIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'driveFileId',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      driveFileIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'driveFileId',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      driveFileIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driveFileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      driveFileIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driveFileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      driveFileIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driveFileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      driveFileIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driveFileId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      driveFileIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'driveFileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      driveFileIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'driveFileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      driveFileIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driveFileId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      driveFileIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driveFileId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      driveFileIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driveFileId',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      driveFileIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driveFileId',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      encryptedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encrypted',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileExtensionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fileExtension',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileExtensionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fileExtension',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileExtensionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileExtension',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileExtensionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileExtension',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileExtensionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileExtension',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileExtensionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileExtension',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileExtensionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fileExtension',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileExtensionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fileExtension',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileExtensionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fileExtension',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileExtensionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fileExtension',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileExtensionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileExtension',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileExtensionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fileExtension',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileMimeTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fileMimeType',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileMimeTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fileMimeType',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileMimeTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileMimeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileMimeTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileMimeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileMimeTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileMimeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileMimeTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileMimeType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileMimeTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fileMimeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileMimeTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fileMimeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileMimeTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fileMimeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileMimeTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fileMimeType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileMimeTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileMimeType',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileMimeTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fileMimeType',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fileName',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fileName',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fileName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileName',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fileName',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fileSize',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fileSize',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileSizeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileSize',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileSizeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileSize',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileSizeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileSize',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      fileSizeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      imgBlurHashIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imgBlurHash',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      imgBlurHashIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imgBlurHash',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      imgBlurHashEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imgBlurHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      imgBlurHashGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imgBlurHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      imgBlurHashLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imgBlurHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      imgBlurHashBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imgBlurHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      imgBlurHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imgBlurHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      imgBlurHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imgBlurHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      imgBlurHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imgBlurHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      imgBlurHashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imgBlurHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      imgBlurHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imgBlurHash',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      imgBlurHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imgBlurHash',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      isPersistedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPersisted',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      lastCopiedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastCopied',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      lastCopiedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastCopied',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      lastCopiedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastCopied',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      lastCopiedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastCopied',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      lastCopiedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastCopied',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      lastCopiedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastCopied',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      lastSyncedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSynced',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      lastSyncedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSynced',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      lastSyncedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      lastSyncedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      lastSyncedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      lastSyncedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSynced',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      localOnlyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localOnly',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      localPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'localPath',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      localPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'localPath',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      localPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      localPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      localPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      localPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      localPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      localPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      localPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'localPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      localPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'localPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      localPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localPath',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      localPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'localPath',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      modifiedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modified',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      modifiedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'modified',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      modifiedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'modified',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      modifiedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'modified',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> osEqualTo(
    PlatformOS value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'os',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      osGreaterThan(
    PlatformOS value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'os',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> osLessThan(
    PlatformOS value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'os',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> osBetween(
    PlatformOS lower,
    PlatformOS upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'os',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      osStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'os',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> osEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'os',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> osContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'os',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> osMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'os',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      osIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'os',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      osIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'os',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serverId',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serverId',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      serverIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      serverIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      serverIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      serverIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serverId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      serverIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      serverIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      serverIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      serverIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serverId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverId',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serverId',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceAppIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceApp',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceAppIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceApp',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceAppEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceAppGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceAppLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceAppBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceApp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceAppStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceAppEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceAppContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceApp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceAppMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceApp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceAppIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceApp',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceAppIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceApp',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceUrl',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceUrl',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      sourceUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      textIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      textIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> textEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      textGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      textLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> textBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      textContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> textMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> typeEqualTo(
    ClipItemType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      typeGreaterThan(
    ClipItemType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      typeLessThan(
    ClipItemType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> typeBetween(
    ClipItemType lower,
    ClipItemType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      urlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> urlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> urlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension ClipboardItemQueryObject
    on QueryBuilder<ClipboardItem, ClipboardItem, QFilterCondition> {}

extension ClipboardItemQueryLinks
    on QueryBuilder<ClipboardItem, ClipboardItem, QFilterCondition> {}

extension ClipboardItemQuerySortBy
    on QueryBuilder<ClipboardItem, ClipboardItem, QSortBy> {
  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByCopiedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copiedCount', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByCopiedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copiedCount', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByDriveFileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driveFileId', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByDriveFileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driveFileId', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByEncrypted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encrypted', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByEncryptedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encrypted', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByFileExtension() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileExtension', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByFileExtensionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileExtension', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByFileMimeType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileMimeType', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByFileMimeTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileMimeType', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByFileSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSize', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByFileSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSize', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByImgBlurHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imgBlurHash', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByImgBlurHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imgBlurHash', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByIsPersisted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPersisted', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByIsPersistedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPersisted', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByLastCopied() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCopied', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByLastCopiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCopied', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByLastSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSynced', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByLastSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSynced', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByLocalOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localOnly', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByLocalOnlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localOnly', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByOs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'os', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByOsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'os', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortBySourceApp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceApp', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortBySourceAppDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceApp', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortBySourceUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      sortBySourceUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension ClipboardItemQuerySortThenBy
    on QueryBuilder<ClipboardItem, ClipboardItem, QSortThenBy> {
  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByCopiedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copiedCount', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByCopiedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copiedCount', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByDriveFileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driveFileId', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByDriveFileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driveFileId', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByEncrypted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encrypted', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByEncryptedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encrypted', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByFileExtension() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileExtension', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByFileExtensionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileExtension', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByFileMimeType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileMimeType', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByFileMimeTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileMimeType', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByFileSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSize', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByFileSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSize', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByImgBlurHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imgBlurHash', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByImgBlurHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imgBlurHash', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByIsPersisted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPersisted', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByIsPersistedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPersisted', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByLastCopied() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCopied', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByLastCopiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCopied', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByLastSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSynced', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByLastSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSynced', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByLocalOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localOnly', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByLocalOnlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localOnly', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByOs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'os', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByOsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'os', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenBySourceApp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceApp', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenBySourceAppDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceApp', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenBySourceUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy>
      thenBySourceUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension ClipboardItemQueryWhereDistinct
    on QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> {
  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct>
      distinctByCopiedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'copiedCount');
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'created');
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByDriveFileId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driveFileId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByEncrypted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'encrypted');
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByFileExtension(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileExtension',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByFileMimeType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileMimeType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByFileName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByFileSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileSize');
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByImgBlurHash(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imgBlurHash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct>
      distinctByIsPersisted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPersisted');
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByLastCopied() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastCopied');
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByLastSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSynced');
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByLocalOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localOnly');
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByLocalPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modified');
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByOs(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'os', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByServerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctBySourceApp(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceApp', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctBySourceUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipboardItem, ClipboardItem, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension ClipboardItemQueryProperty
    on QueryBuilder<ClipboardItem, ClipboardItem, QQueryProperty> {
  QueryBuilder<ClipboardItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ClipboardItem, int, QQueryOperations> copiedCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'copiedCount');
    });
  }

  QueryBuilder<ClipboardItem, DateTime, QQueryOperations> createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'created');
    });
  }

  QueryBuilder<ClipboardItem, DateTime?, QQueryOperations> deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<ClipboardItem, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<ClipboardItem, String?, QQueryOperations> driveFileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driveFileId');
    });
  }

  QueryBuilder<ClipboardItem, bool, QQueryOperations> encryptedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'encrypted');
    });
  }

  QueryBuilder<ClipboardItem, String?, QQueryOperations>
      fileExtensionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileExtension');
    });
  }

  QueryBuilder<ClipboardItem, String?, QQueryOperations>
      fileMimeTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileMimeType');
    });
  }

  QueryBuilder<ClipboardItem, String?, QQueryOperations> fileNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileName');
    });
  }

  QueryBuilder<ClipboardItem, int?, QQueryOperations> fileSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileSize');
    });
  }

  QueryBuilder<ClipboardItem, String?, QQueryOperations> imgBlurHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imgBlurHash');
    });
  }

  QueryBuilder<ClipboardItem, bool, QQueryOperations> isPersistedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPersisted');
    });
  }

  QueryBuilder<ClipboardItem, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<ClipboardItem, DateTime?, QQueryOperations>
      lastCopiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastCopied');
    });
  }

  QueryBuilder<ClipboardItem, DateTime?, QQueryOperations>
      lastSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSynced');
    });
  }

  QueryBuilder<ClipboardItem, bool, QQueryOperations> localOnlyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localOnly');
    });
  }

  QueryBuilder<ClipboardItem, String?, QQueryOperations> localPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localPath');
    });
  }

  QueryBuilder<ClipboardItem, DateTime, QQueryOperations> modifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modified');
    });
  }

  QueryBuilder<ClipboardItem, PlatformOS, QQueryOperations> osProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'os');
    });
  }

  QueryBuilder<ClipboardItem, String?, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<ClipboardItem, String?, QQueryOperations> sourceAppProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceApp');
    });
  }

  QueryBuilder<ClipboardItem, String?, QQueryOperations> sourceUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceUrl');
    });
  }

  QueryBuilder<ClipboardItem, String?, QQueryOperations> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }

  QueryBuilder<ClipboardItem, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<ClipboardItem, ClipItemType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<ClipboardItem, String?, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }

  QueryBuilder<ClipboardItem, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClipboardItemImpl _$$ClipboardItemImplFromJson(Map<String, dynamic> json) =>
    _$ClipboardItemImpl(
      serverId: json[r'$id'] as String?,
      created: DateTime.parse(json[r'$createdAt'] as String),
      modified: DateTime.parse(json[r'$updatedAt'] as String),
      type: $enumDecode(_$ClipItemTypeEnumMap, json['type']),
      userId: json['userId'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      encrypted: json['encrypted'] as bool? ?? false,
      text: json['text'] as String?,
      url: json['url'] as String?,
      fileName: json['fileName'] as String?,
      fileMimeType: json['fileMimeType'] as String?,
      fileExtension: json['fileExtension'] as String?,
      driveFileId: json['driveFileId'] as String?,
      fileSize: json['fileSize'] as int?,
      imgBlurHash: json['imgBlurHash'] as String?,
      sourceUrl: json['sourceUrl'] as String?,
      sourceApp: json['sourceApp'] as String?,
      os: $enumDecode(_$PlatformOSEnumMap, json['os']),
      copiedCount: json['copiedCount'] as int? ?? 0,
      lastCopied: json['lastCopied'] == null
          ? null
          : DateTime.parse(json['lastCopied'] as String),
    );

Map<String, dynamic> _$$ClipboardItemImplToJson(_$ClipboardItemImpl instance) =>
    <String, dynamic>{
      r'$createdAt': instance.created.toIso8601String(),
      r'$updatedAt': instance.modified.toIso8601String(),
      'type': _$ClipItemTypeEnumMap[instance.type]!,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'encrypted': instance.encrypted,
      'text': instance.text,
      'url': instance.url,
      'fileName': instance.fileName,
      'fileMimeType': instance.fileMimeType,
      'fileExtension': instance.fileExtension,
      'driveFileId': instance.driveFileId,
      'fileSize': instance.fileSize,
      'imgBlurHash': instance.imgBlurHash,
      'sourceUrl': instance.sourceUrl,
      'sourceApp': instance.sourceApp,
      'os': _$PlatformOSEnumMap[instance.os]!,
      'copiedCount': instance.copiedCount,
      'lastCopied': instance.lastCopied?.toIso8601String(),
    };

const _$ClipItemTypeEnumMap = {
  ClipItemType.text: 'text',
  ClipItemType.media: 'media',
  ClipItemType.file: 'file',
  ClipItemType.url: 'url',
};

const _$PlatformOSEnumMap = {
  PlatformOS.android: 'android',
  PlatformOS.ios: 'ios',
  PlatformOS.macos: 'macos',
  PlatformOS.windows: 'windows',
};
