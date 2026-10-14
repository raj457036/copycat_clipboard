// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_sync_status.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types, experimental_member_use

extension GetIsarSyncStatusCollection on Isar {
  IsarCollection<IsarSyncStatus> get isarSyncStatus => this.collection();
}

const IsarSyncStatusSchema = CollectionSchema(
  name: r'SyncStatus',
  id: -6770449623075495653,
  properties: {
    r'lastKnownSyncCount': PropertySchema(
      id: 0,
      name: r'lastKnownSyncCount',
      type: IsarType.long,
    ),
    r'lastKnownTotalCount': PropertySchema(
      id: 1,
      name: r'lastKnownTotalCount',
      type: IsarType.long,
    ),
    r'lastSyncPoint': PropertySchema(
      id: 2,
      name: r'lastSyncPoint',
      type: IsarType.dateTime,
    ),
    r'lastSyncStartPoint': PropertySchema(
      id: 3,
      name: r'lastSyncStartPoint',
      type: IsarType.dateTime,
    ),
    r'restorationPending': PropertySchema(
      id: 4,
      name: r'restorationPending',
      type: IsarType.bool,
    ),
  },

  estimateSize: _isarSyncStatusEstimateSize,
  serialize: _isarSyncStatusSerialize,
  deserialize: _isarSyncStatusDeserialize,
  deserializeProp: _isarSyncStatusDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _isarSyncStatusGetId,
  getLinks: _isarSyncStatusGetLinks,
  attach: _isarSyncStatusAttach,
  version: '3.4.1',
);

int _isarSyncStatusEstimateSize(
  IsarSyncStatus object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _isarSyncStatusSerialize(
  IsarSyncStatus object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.lastKnownSyncCount);
  writer.writeLong(offsets[1], object.lastKnownTotalCount);
  writer.writeDateTime(offsets[2], object.lastSyncPoint);
  writer.writeDateTime(offsets[3], object.lastSyncStartPoint);
  writer.writeBool(offsets[4], object.restorationPending);
}

IsarSyncStatus _isarSyncStatusDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarSyncStatus();
  object.isarId = id;
  object.lastKnownSyncCount = reader.readLongOrNull(offsets[0]);
  object.lastKnownTotalCount = reader.readLongOrNull(offsets[1]);
  object.lastSyncPoint = reader.readDateTimeOrNull(offsets[2]);
  object.lastSyncStartPoint = reader.readDateTimeOrNull(offsets[3]);
  object.restorationPending = reader.readBool(offsets[4]);
  return object;
}

P _isarSyncStatusDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarSyncStatusGetId(IsarSyncStatus object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _isarSyncStatusGetLinks(IsarSyncStatus object) {
  return [];
}

void _isarSyncStatusAttach(
  IsarCollection<dynamic> col,
  Id id,
  IsarSyncStatus object,
) {
  object.isarId = id;
}

extension IsarSyncStatusQueryWhereSort
    on QueryBuilder<IsarSyncStatus, IsarSyncStatus, QWhere> {
  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarSyncStatusQueryWhere
    on QueryBuilder<IsarSyncStatus, IsarSyncStatus, QWhereClause> {
  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterWhereClause> isarIdEqualTo(
    Id isarId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterWhereClause>
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

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterWhereClause>
  isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterWhereClause>
  isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterWhereClause> isarIdBetween(
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
}

extension IsarSyncStatusQueryFilter
    on QueryBuilder<IsarSyncStatus, IsarSyncStatus, QFilterCondition> {
  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
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

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
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

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
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

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastKnownSyncCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastKnownSyncCount'),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastKnownSyncCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastKnownSyncCount'),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastKnownSyncCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastKnownSyncCount', value: value),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastKnownSyncCountGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastKnownSyncCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastKnownSyncCountLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastKnownSyncCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastKnownSyncCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastKnownSyncCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastKnownTotalCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastKnownTotalCount'),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastKnownTotalCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastKnownTotalCount'),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastKnownTotalCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastKnownTotalCount', value: value),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastKnownTotalCountGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastKnownTotalCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastKnownTotalCountLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastKnownTotalCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastKnownTotalCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastKnownTotalCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastSyncPointIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastSyncPoint'),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastSyncPointIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastSyncPoint'),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastSyncPointEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastSyncPoint', value: value),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastSyncPointGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastSyncPoint',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastSyncPointLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastSyncPoint',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastSyncPointBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastSyncPoint',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastSyncStartPointIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastSyncStartPoint'),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastSyncStartPointIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastSyncStartPoint'),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastSyncStartPointEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastSyncStartPoint', value: value),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastSyncStartPointGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastSyncStartPoint',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastSyncStartPointLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastSyncStartPoint',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  lastSyncStartPointBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastSyncStartPoint',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterFilterCondition>
  restorationPendingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'restorationPending', value: value),
      );
    });
  }
}

extension IsarSyncStatusQueryObject
    on QueryBuilder<IsarSyncStatus, IsarSyncStatus, QFilterCondition> {}

extension IsarSyncStatusQueryLinks
    on QueryBuilder<IsarSyncStatus, IsarSyncStatus, QFilterCondition> {}

extension IsarSyncStatusQuerySortBy
    on QueryBuilder<IsarSyncStatus, IsarSyncStatus, QSortBy> {
  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  sortByLastKnownSyncCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastKnownSyncCount', Sort.asc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  sortByLastKnownSyncCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastKnownSyncCount', Sort.desc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  sortByLastKnownTotalCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastKnownTotalCount', Sort.asc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  sortByLastKnownTotalCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastKnownTotalCount', Sort.desc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  sortByLastSyncPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncPoint', Sort.asc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  sortByLastSyncPointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncPoint', Sort.desc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  sortByLastSyncStartPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncStartPoint', Sort.asc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  sortByLastSyncStartPointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncStartPoint', Sort.desc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  sortByRestorationPending() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restorationPending', Sort.asc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  sortByRestorationPendingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restorationPending', Sort.desc);
    });
  }
}

extension IsarSyncStatusQuerySortThenBy
    on QueryBuilder<IsarSyncStatus, IsarSyncStatus, QSortThenBy> {
  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  thenByLastKnownSyncCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastKnownSyncCount', Sort.asc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  thenByLastKnownSyncCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastKnownSyncCount', Sort.desc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  thenByLastKnownTotalCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastKnownTotalCount', Sort.asc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  thenByLastKnownTotalCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastKnownTotalCount', Sort.desc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  thenByLastSyncPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncPoint', Sort.asc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  thenByLastSyncPointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncPoint', Sort.desc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  thenByLastSyncStartPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncStartPoint', Sort.asc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  thenByLastSyncStartPointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncStartPoint', Sort.desc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  thenByRestorationPending() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restorationPending', Sort.asc);
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QAfterSortBy>
  thenByRestorationPendingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restorationPending', Sort.desc);
    });
  }
}

extension IsarSyncStatusQueryWhereDistinct
    on QueryBuilder<IsarSyncStatus, IsarSyncStatus, QDistinct> {
  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QDistinct>
  distinctByLastKnownSyncCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastKnownSyncCount');
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QDistinct>
  distinctByLastKnownTotalCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastKnownTotalCount');
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QDistinct>
  distinctByLastSyncPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncPoint');
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QDistinct>
  distinctByLastSyncStartPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncStartPoint');
    });
  }

  QueryBuilder<IsarSyncStatus, IsarSyncStatus, QDistinct>
  distinctByRestorationPending() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'restorationPending');
    });
  }
}

extension IsarSyncStatusQueryProperty
    on QueryBuilder<IsarSyncStatus, IsarSyncStatus, QQueryProperty> {
  QueryBuilder<IsarSyncStatus, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<IsarSyncStatus, int?, QQueryOperations>
  lastKnownSyncCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastKnownSyncCount');
    });
  }

  QueryBuilder<IsarSyncStatus, int?, QQueryOperations>
  lastKnownTotalCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastKnownTotalCount');
    });
  }

  QueryBuilder<IsarSyncStatus, DateTime?, QQueryOperations>
  lastSyncPointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncPoint');
    });
  }

  QueryBuilder<IsarSyncStatus, DateTime?, QQueryOperations>
  lastSyncStartPointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncStartPoint');
    });
  }

  QueryBuilder<IsarSyncStatus, bool, QQueryOperations>
  restorationPendingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'restorationPending');
    });
  }
}
