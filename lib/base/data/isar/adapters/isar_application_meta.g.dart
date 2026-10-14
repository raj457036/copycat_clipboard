// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_application_meta.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types, experimental_member_use

extension GetIsarApplicationMetaCollection on Isar {
  IsarCollection<IsarApplicationMeta> get isarApplicationMetas =>
      this.collection();
}

const IsarApplicationMetaSchema = CollectionSchema(
  name: r'ApplicationMeta',
  id: 4571519888598162598,
  properties: {
    r'appFilePath': PropertySchema(
      id: 0,
      name: r'appFilePath',
      type: IsarType.string,
    ),
    r'appName': PropertySchema(id: 1, name: r'appName', type: IsarType.string),
    r'created': PropertySchema(
      id: 2,
      name: r'created',
      type: IsarType.dateTime,
    ),
    r'iconLocalPath': PropertySchema(
      id: 3,
      name: r'iconLocalPath',
      type: IsarType.string,
    ),
    r'iconRemotePath': PropertySchema(
      id: 4,
      name: r'iconRemotePath',
      type: IsarType.string,
    ),
    r'identifier': PropertySchema(
      id: 5,
      name: r'identifier',
      type: IsarType.string,
    ),
    r'modified': PropertySchema(
      id: 6,
      name: r'modified',
      type: IsarType.dateTime,
    ),
    r'os': PropertySchema(
      id: 7,
      name: r'os',
      type: IsarType.string,
      enumMap: _IsarApplicationMetaosEnumValueMap,
    ),
    r'sourceId': PropertySchema(
      id: 8,
      name: r'sourceId',
      type: IsarType.string,
    ),
  },

  estimateSize: _isarApplicationMetaEstimateSize,
  serialize: _isarApplicationMetaSerialize,
  deserialize: _isarApplicationMetaDeserialize,
  deserializeProp: _isarApplicationMetaDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'sourceId': IndexSchema(
      id: 2155220942429093580,
      name: r'sourceId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'sourceId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'identifier': IndexSchema(
      id: -1091831983288130400,
      name: r'identifier',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'identifier',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _isarApplicationMetaGetId,
  getLinks: _isarApplicationMetaGetLinks,
  attach: _isarApplicationMetaAttach,
  version: '3.4.1',
);

int _isarApplicationMetaEstimateSize(
  IsarApplicationMeta object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.appFilePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.appName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.iconLocalPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.iconRemotePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.identifier;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.os.name.length * 3;
  bytesCount += 3 + object.sourceId.length * 3;
  return bytesCount;
}

void _isarApplicationMetaSerialize(
  IsarApplicationMeta object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.appFilePath);
  writer.writeString(offsets[1], object.appName);
  writer.writeDateTime(offsets[2], object.created);
  writer.writeString(offsets[3], object.iconLocalPath);
  writer.writeString(offsets[4], object.iconRemotePath);
  writer.writeString(offsets[5], object.identifier);
  writer.writeDateTime(offsets[6], object.modified);
  writer.writeString(offsets[7], object.os.name);
  writer.writeString(offsets[8], object.sourceId);
}

IsarApplicationMeta _isarApplicationMetaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarApplicationMeta();
  object.appFilePath = reader.readStringOrNull(offsets[0]);
  object.appName = reader.readStringOrNull(offsets[1]);
  object.created = reader.readDateTime(offsets[2]);
  object.iconLocalPath = reader.readStringOrNull(offsets[3]);
  object.iconRemotePath = reader.readStringOrNull(offsets[4]);
  object.identifier = reader.readStringOrNull(offsets[5]);
  object.isarId = id;
  object.modified = reader.readDateTime(offsets[6]);
  object.os =
      _IsarApplicationMetaosValueEnumMap[reader.readStringOrNull(offsets[7])] ??
      PlatformOS.android;
  object.sourceId = reader.readString(offsets[8]);
  return object;
}

P _isarApplicationMetaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (_IsarApplicationMetaosValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              PlatformOS.android)
          as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarApplicationMetaosEnumValueMap = {
  r'android': r'android',
  r'ios': r'ios',
  r'macos': r'macos',
  r'windows': r'windows',
  r'linux': r'linux',
};
const _IsarApplicationMetaosValueEnumMap = {
  r'android': PlatformOS.android,
  r'ios': PlatformOS.ios,
  r'macos': PlatformOS.macos,
  r'windows': PlatformOS.windows,
  r'linux': PlatformOS.linux,
};

Id _isarApplicationMetaGetId(IsarApplicationMeta object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _isarApplicationMetaGetLinks(
  IsarApplicationMeta object,
) {
  return [];
}

void _isarApplicationMetaAttach(
  IsarCollection<dynamic> col,
  Id id,
  IsarApplicationMeta object,
) {
  object.isarId = id;
}

extension IsarApplicationMetaByIndex on IsarCollection<IsarApplicationMeta> {
  Future<IsarApplicationMeta?> getBySourceId(String sourceId) {
    return getByIndex(r'sourceId', [sourceId]);
  }

  IsarApplicationMeta? getBySourceIdSync(String sourceId) {
    return getByIndexSync(r'sourceId', [sourceId]);
  }

  Future<bool> deleteBySourceId(String sourceId) {
    return deleteByIndex(r'sourceId', [sourceId]);
  }

  bool deleteBySourceIdSync(String sourceId) {
    return deleteByIndexSync(r'sourceId', [sourceId]);
  }

  Future<List<IsarApplicationMeta?>> getAllBySourceId(
    List<String> sourceIdValues,
  ) {
    final values = sourceIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'sourceId', values);
  }

  List<IsarApplicationMeta?> getAllBySourceIdSync(List<String> sourceIdValues) {
    final values = sourceIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'sourceId', values);
  }

  Future<int> deleteAllBySourceId(List<String> sourceIdValues) {
    final values = sourceIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'sourceId', values);
  }

  int deleteAllBySourceIdSync(List<String> sourceIdValues) {
    final values = sourceIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'sourceId', values);
  }

  Future<Id> putBySourceId(IsarApplicationMeta object) {
    return putByIndex(r'sourceId', object);
  }

  Id putBySourceIdSync(IsarApplicationMeta object, {bool saveLinks = true}) {
    return putByIndexSync(r'sourceId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySourceId(List<IsarApplicationMeta> objects) {
    return putAllByIndex(r'sourceId', objects);
  }

  List<Id> putAllBySourceIdSync(
    List<IsarApplicationMeta> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'sourceId', objects, saveLinks: saveLinks);
  }
}

extension IsarApplicationMetaQueryWhereSort
    on QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QWhere> {
  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterWhere>
  anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarApplicationMetaQueryWhere
    on QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QWhereClause> {
  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterWhereClause>
  isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterWhereClause>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterWhereClause>
  isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterWhereClause>
  isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterWhereClause>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterWhereClause>
  sourceIdEqualTo(String sourceId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'sourceId', value: [sourceId]),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterWhereClause>
  sourceIdNotEqualTo(String sourceId) {
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterWhereClause>
  identifierIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'identifier', value: [null]),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterWhereClause>
  identifierIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'identifier',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterWhereClause>
  identifierEqualTo(String? identifier) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'identifier', value: [identifier]),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterWhereClause>
  identifierNotEqualTo(String? identifier) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'identifier',
                lower: [],
                upper: [identifier],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'identifier',
                lower: [identifier],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'identifier',
                lower: [identifier],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'identifier',
                lower: [],
                upper: [identifier],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension IsarApplicationMetaQueryFilter
    on
        QueryBuilder<
          IsarApplicationMeta,
          IsarApplicationMeta,
          QFilterCondition
        > {
  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appFilePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'appFilePath'),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appFilePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'appFilePath'),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appFilePathEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'appFilePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appFilePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'appFilePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appFilePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'appFilePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appFilePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'appFilePath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appFilePathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'appFilePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appFilePathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'appFilePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appFilePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'appFilePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appFilePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'appFilePath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appFilePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'appFilePath', value: ''),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appFilePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'appFilePath', value: ''),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'appName'),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'appName'),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'appName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'appName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'appName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'appName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'appName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'appName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'appName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'appName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'appName', value: ''),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  appNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'appName', value: ''),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  createdEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'created', value: value),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconLocalPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'iconLocalPath'),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconLocalPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'iconLocalPath'),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconLocalPathEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'iconLocalPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconLocalPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'iconLocalPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconLocalPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'iconLocalPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconLocalPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'iconLocalPath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconLocalPathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'iconLocalPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconLocalPathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'iconLocalPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconLocalPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'iconLocalPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconLocalPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'iconLocalPath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconLocalPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'iconLocalPath', value: ''),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconLocalPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'iconLocalPath', value: ''),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconRemotePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'iconRemotePath'),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconRemotePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'iconRemotePath'),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconRemotePathEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'iconRemotePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconRemotePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'iconRemotePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconRemotePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'iconRemotePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconRemotePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'iconRemotePath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconRemotePathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'iconRemotePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconRemotePathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'iconRemotePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconRemotePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'iconRemotePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconRemotePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'iconRemotePath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconRemotePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'iconRemotePath', value: ''),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  iconRemotePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'iconRemotePath', value: ''),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  identifierIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'identifier'),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  identifierIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'identifier'),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  identifierEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'identifier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  identifierGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'identifier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  identifierLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'identifier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  identifierBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'identifier',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  identifierStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'identifier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  identifierEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'identifier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  identifierContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'identifier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  identifierMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'identifier',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  identifierIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'identifier', value: ''),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  identifierIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'identifier', value: ''),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  modifiedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'modified', value: value),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  osIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'os', value: ''),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  osIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'os', value: ''),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  sourceIdEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  sourceIdGreaterThan(
    String value, {
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  sourceIdLessThan(
    String value, {
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  sourceIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
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

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  sourceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sourceId', value: ''),
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterFilterCondition>
  sourceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sourceId', value: ''),
      );
    });
  }
}

extension IsarApplicationMetaQueryObject
    on
        QueryBuilder<
          IsarApplicationMeta,
          IsarApplicationMeta,
          QFilterCondition
        > {}

extension IsarApplicationMetaQueryLinks
    on
        QueryBuilder<
          IsarApplicationMeta,
          IsarApplicationMeta,
          QFilterCondition
        > {}

extension IsarApplicationMetaQuerySortBy
    on QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QSortBy> {
  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  sortByAppFilePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appFilePath', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  sortByAppFilePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appFilePath', Sort.desc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  sortByAppName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appName', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  sortByAppNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appName', Sort.desc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  sortByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  sortByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  sortByIconLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconLocalPath', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  sortByIconLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconLocalPath', Sort.desc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  sortByIconRemotePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconRemotePath', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  sortByIconRemotePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconRemotePath', Sort.desc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  sortByIdentifier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identifier', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  sortByIdentifierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identifier', Sort.desc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  sortByModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  sortByModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.desc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  sortByOs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'os', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  sortByOsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'os', Sort.desc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  sortBySourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  sortBySourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.desc);
    });
  }
}

extension IsarApplicationMetaQuerySortThenBy
    on QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QSortThenBy> {
  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenByAppFilePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appFilePath', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenByAppFilePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appFilePath', Sort.desc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenByAppName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appName', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenByAppNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appName', Sort.desc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenByIconLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconLocalPath', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenByIconLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconLocalPath', Sort.desc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenByIconRemotePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconRemotePath', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenByIconRemotePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconRemotePath', Sort.desc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenByIdentifier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identifier', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenByIdentifierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identifier', Sort.desc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenByModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenByModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.desc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenByOs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'os', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenByOsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'os', Sort.desc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenBySourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.asc);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QAfterSortBy>
  thenBySourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceId', Sort.desc);
    });
  }
}

extension IsarApplicationMetaQueryWhereDistinct
    on QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QDistinct> {
  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QDistinct>
  distinctByAppFilePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appFilePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QDistinct>
  distinctByAppName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QDistinct>
  distinctByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'created');
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QDistinct>
  distinctByIconLocalPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'iconLocalPath',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QDistinct>
  distinctByIconRemotePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'iconRemotePath',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QDistinct>
  distinctByIdentifier({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'identifier', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QDistinct>
  distinctByModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modified');
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QDistinct>
  distinctByOs({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'os', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QDistinct>
  distinctBySourceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceId', caseSensitive: caseSensitive);
    });
  }
}

extension IsarApplicationMetaQueryProperty
    on QueryBuilder<IsarApplicationMeta, IsarApplicationMeta, QQueryProperty> {
  QueryBuilder<IsarApplicationMeta, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<IsarApplicationMeta, String?, QQueryOperations>
  appFilePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appFilePath');
    });
  }

  QueryBuilder<IsarApplicationMeta, String?, QQueryOperations>
  appNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appName');
    });
  }

  QueryBuilder<IsarApplicationMeta, DateTime, QQueryOperations>
  createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'created');
    });
  }

  QueryBuilder<IsarApplicationMeta, String?, QQueryOperations>
  iconLocalPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconLocalPath');
    });
  }

  QueryBuilder<IsarApplicationMeta, String?, QQueryOperations>
  iconRemotePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconRemotePath');
    });
  }

  QueryBuilder<IsarApplicationMeta, String?, QQueryOperations>
  identifierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'identifier');
    });
  }

  QueryBuilder<IsarApplicationMeta, DateTime, QQueryOperations>
  modifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modified');
    });
  }

  QueryBuilder<IsarApplicationMeta, PlatformOS, QQueryOperations> osProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'os');
    });
  }

  QueryBuilder<IsarApplicationMeta, String, QQueryOperations>
  sourceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceId');
    });
  }
}
