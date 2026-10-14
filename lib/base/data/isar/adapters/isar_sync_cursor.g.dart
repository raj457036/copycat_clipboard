// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_sync_cursor.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types, experimental_member_use

extension GetIsarSyncCursorCollection on Isar {
  IsarCollection<IsarSyncCursor> get isarSyncCursors => this.collection();
}

const IsarSyncCursorSchema = CollectionSchema(
  name: r'SyncCursor',
  id: 355982195539933157,
  properties: {
    r'entityType': PropertySchema(
      id: 0,
      name: r'entityType',
      type: IsarType.string,
    ),
    r'lastOffset': PropertySchema(
      id: 1,
      name: r'lastOffset',
      type: IsarType.long,
    ),
    r'lastSyncedAt': PropertySchema(
      id: 2,
      name: r'lastSyncedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _isarSyncCursorEstimateSize,
  serialize: _isarSyncCursorSerialize,
  deserialize: _isarSyncCursorDeserialize,
  deserializeProp: _isarSyncCursorDeserializeProp,
  idName: r'id',
  indexes: {
    r'entityType': IndexSchema(
      id: -5109706325448941117,
      name: r'entityType',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'entityType',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _isarSyncCursorGetId,
  getLinks: _isarSyncCursorGetLinks,
  attach: _isarSyncCursorAttach,
  version: '3.4.1',
);

int _isarSyncCursorEstimateSize(
  IsarSyncCursor object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.entityType.length * 3;
  return bytesCount;
}

void _isarSyncCursorSerialize(
  IsarSyncCursor object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.entityType);
  writer.writeLong(offsets[1], object.lastOffset);
  writer.writeDateTime(offsets[2], object.lastSyncedAt);
}

IsarSyncCursor _isarSyncCursorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarSyncCursor();
  object.entityType = reader.readString(offsets[0]);
  object.id = id;
  object.lastOffset = reader.readLong(offsets[1]);
  object.lastSyncedAt = reader.readDateTime(offsets[2]);
  return object;
}

P _isarSyncCursorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarSyncCursorGetId(IsarSyncCursor object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarSyncCursorGetLinks(IsarSyncCursor object) {
  return [];
}

void _isarSyncCursorAttach(
  IsarCollection<dynamic> col,
  Id id,
  IsarSyncCursor object,
) {
  object.id = id;
}

extension IsarSyncCursorByIndex on IsarCollection<IsarSyncCursor> {
  Future<IsarSyncCursor?> getByEntityType(String entityType) {
    return getByIndex(r'entityType', [entityType]);
  }

  IsarSyncCursor? getByEntityTypeSync(String entityType) {
    return getByIndexSync(r'entityType', [entityType]);
  }

  Future<bool> deleteByEntityType(String entityType) {
    return deleteByIndex(r'entityType', [entityType]);
  }

  bool deleteByEntityTypeSync(String entityType) {
    return deleteByIndexSync(r'entityType', [entityType]);
  }

  Future<List<IsarSyncCursor?>> getAllByEntityType(
    List<String> entityTypeValues,
  ) {
    final values = entityTypeValues.map((e) => [e]).toList();
    return getAllByIndex(r'entityType', values);
  }

  List<IsarSyncCursor?> getAllByEntityTypeSync(List<String> entityTypeValues) {
    final values = entityTypeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'entityType', values);
  }

  Future<int> deleteAllByEntityType(List<String> entityTypeValues) {
    final values = entityTypeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'entityType', values);
  }

  int deleteAllByEntityTypeSync(List<String> entityTypeValues) {
    final values = entityTypeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'entityType', values);
  }

  Future<Id> putByEntityType(IsarSyncCursor object) {
    return putByIndex(r'entityType', object);
  }

  Id putByEntityTypeSync(IsarSyncCursor object, {bool saveLinks = true}) {
    return putByIndexSync(r'entityType', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByEntityType(List<IsarSyncCursor> objects) {
    return putAllByIndex(r'entityType', objects);
  }

  List<Id> putAllByEntityTypeSync(
    List<IsarSyncCursor> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'entityType', objects, saveLinks: saveLinks);
  }
}

extension IsarSyncCursorQueryWhereSort
    on QueryBuilder<IsarSyncCursor, IsarSyncCursor, QWhere> {
  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarSyncCursorQueryWhere
    on QueryBuilder<IsarSyncCursor, IsarSyncCursor, QWhereClause> {
  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterWhereClause>
  entityTypeEqualTo(String entityType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'entityType', value: [entityType]),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterWhereClause>
  entityTypeNotEqualTo(String entityType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'entityType',
                lower: [],
                upper: [entityType],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'entityType',
                lower: [entityType],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'entityType',
                lower: [entityType],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'entityType',
                lower: [],
                upper: [entityType],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension IsarSyncCursorQueryFilter
    on QueryBuilder<IsarSyncCursor, IsarSyncCursor, QFilterCondition> {
  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  entityTypeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'entityType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  entityTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'entityType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  entityTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'entityType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  entityTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'entityType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  entityTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'entityType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  entityTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'entityType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  entityTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'entityType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  entityTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'entityType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  entityTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'entityType', value: ''),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  entityTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'entityType', value: ''),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  lastOffsetEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastOffset', value: value),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  lastOffsetGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastOffset',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  lastOffsetLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastOffset',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  lastOffsetBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastOffset',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  lastSyncedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastSyncedAt', value: value),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  lastSyncedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastSyncedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  lastSyncedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastSyncedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterFilterCondition>
  lastSyncedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastSyncedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension IsarSyncCursorQueryObject
    on QueryBuilder<IsarSyncCursor, IsarSyncCursor, QFilterCondition> {}

extension IsarSyncCursorQueryLinks
    on QueryBuilder<IsarSyncCursor, IsarSyncCursor, QFilterCondition> {}

extension IsarSyncCursorQuerySortBy
    on QueryBuilder<IsarSyncCursor, IsarSyncCursor, QSortBy> {
  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterSortBy>
  sortByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterSortBy>
  sortByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterSortBy>
  sortByLastOffset() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOffset', Sort.asc);
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterSortBy>
  sortByLastOffsetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOffset', Sort.desc);
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterSortBy>
  sortByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterSortBy>
  sortByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }
}

extension IsarSyncCursorQuerySortThenBy
    on QueryBuilder<IsarSyncCursor, IsarSyncCursor, QSortThenBy> {
  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterSortBy>
  thenByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterSortBy>
  thenByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterSortBy>
  thenByLastOffset() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOffset', Sort.asc);
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterSortBy>
  thenByLastOffsetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOffset', Sort.desc);
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterSortBy>
  thenByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QAfterSortBy>
  thenByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }
}

extension IsarSyncCursorQueryWhereDistinct
    on QueryBuilder<IsarSyncCursor, IsarSyncCursor, QDistinct> {
  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QDistinct> distinctByEntityType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QDistinct>
  distinctByLastOffset() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastOffset');
    });
  }

  QueryBuilder<IsarSyncCursor, IsarSyncCursor, QDistinct>
  distinctByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncedAt');
    });
  }
}

extension IsarSyncCursorQueryProperty
    on QueryBuilder<IsarSyncCursor, IsarSyncCursor, QQueryProperty> {
  QueryBuilder<IsarSyncCursor, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarSyncCursor, String, QQueryOperations> entityTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityType');
    });
  }

  QueryBuilder<IsarSyncCursor, int, QQueryOperations> lastOffsetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastOffset');
    });
  }

  QueryBuilder<IsarSyncCursor, DateTime, QQueryOperations>
  lastSyncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncedAt');
    });
  }
}
