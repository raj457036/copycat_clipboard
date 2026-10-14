// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_subscription.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types, experimental_member_use

extension GetIsarSubscriptionCollection on Isar {
  IsarCollection<IsarSubscription> get isarSubscriptions => this.collection();
}

const IsarSubscriptionSchema = CollectionSchema(
  name: r'Subscription',
  id: -3426239935225026138,
  properties: {
    r'activeTill': PropertySchema(
      id: 0,
      name: r'activeTill',
      type: IsarType.dateTime,
    ),
    r'ads': PropertySchema(id: 1, name: r'ads', type: IsarType.bool),
    r'collections': PropertySchema(
      id: 2,
      name: r'collections',
      type: IsarType.long,
    ),
    r'created': PropertySchema(
      id: 3,
      name: r'created',
      type: IsarType.dateTime,
    ),
    r'customExclusionRules': PropertySchema(
      id: 4,
      name: r'customExclusionRules',
      type: IsarType.bool,
    ),
    r'dragNdrop': PropertySchema(
      id: 5,
      name: r'dragNdrop',
      type: IsarType.bool,
    ),
    r'edit': PropertySchema(id: 6, name: r'edit', type: IsarType.bool),
    r'grants': PropertySchema(id: 7, name: r'grants', type: IsarType.long),
    r'itemsPerCollection': PropertySchema(
      id: 8,
      name: r'itemsPerCollection',
      type: IsarType.long,
    ),
    r'maxSyncDevices': PropertySchema(
      id: 9,
      name: r'maxSyncDevices',
      type: IsarType.long,
    ),
    r'modified': PropertySchema(
      id: 10,
      name: r'modified',
      type: IsarType.dateTime,
    ),
    r'pasteStackLimit': PropertySchema(
      id: 11,
      name: r'pasteStackLimit',
      type: IsarType.long,
    ),
    r'planName': PropertySchema(
      id: 12,
      name: r'planName',
      type: IsarType.string,
    ),
    r'serverId': PropertySchema(id: 13, name: r'serverId', type: IsarType.long),
    r'source': PropertySchema(id: 14, name: r'source', type: IsarType.string),
    r'subId': PropertySchema(id: 15, name: r'subId', type: IsarType.string),
    r'syncHours': PropertySchema(
      id: 16,
      name: r'syncHours',
      type: IsarType.long,
    ),
    r'syncInterval': PropertySchema(
      id: 17,
      name: r'syncInterval',
      type: IsarType.long,
    ),
    r'theming': PropertySchema(id: 18, name: r'theming', type: IsarType.bool),
    r'tkn': PropertySchema(id: 19, name: r'tkn', type: IsarType.string),
    r'trialEnd': PropertySchema(
      id: 20,
      name: r'trialEnd',
      type: IsarType.dateTime,
    ),
    r'trialStart': PropertySchema(
      id: 21,
      name: r'trialStart',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(id: 22, name: r'userId', type: IsarType.string),
  },

  estimateSize: _isarSubscriptionEstimateSize,
  serialize: _isarSubscriptionSerialize,
  deserialize: _isarSubscriptionDeserialize,
  deserializeProp: _isarSubscriptionDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _isarSubscriptionGetId,
  getLinks: _isarSubscriptionGetLinks,
  attach: _isarSubscriptionAttach,
  version: '3.4.1',
);

int _isarSubscriptionEstimateSize(
  IsarSubscription object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.planName.length * 3;
  bytesCount += 3 + object.source.length * 3;
  bytesCount += 3 + object.subId.length * 3;
  {
    final value = object.tkn;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _isarSubscriptionSerialize(
  IsarSubscription object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.activeTill);
  writer.writeBool(offsets[1], object.ads);
  writer.writeLong(offsets[2], object.collections);
  writer.writeDateTime(offsets[3], object.created);
  writer.writeBool(offsets[4], object.customExclusionRules);
  writer.writeBool(offsets[5], object.dragNdrop);
  writer.writeBool(offsets[6], object.edit);
  writer.writeLong(offsets[7], object.grants);
  writer.writeLong(offsets[8], object.itemsPerCollection);
  writer.writeLong(offsets[9], object.maxSyncDevices);
  writer.writeDateTime(offsets[10], object.modified);
  writer.writeLong(offsets[11], object.pasteStackLimit);
  writer.writeString(offsets[12], object.planName);
  writer.writeLong(offsets[13], object.serverId);
  writer.writeString(offsets[14], object.source);
  writer.writeString(offsets[15], object.subId);
  writer.writeLong(offsets[16], object.syncHours);
  writer.writeLong(offsets[17], object.syncInterval);
  writer.writeBool(offsets[18], object.theming);
  writer.writeString(offsets[19], object.tkn);
  writer.writeDateTime(offsets[20], object.trialEnd);
  writer.writeDateTime(offsets[21], object.trialStart);
  writer.writeString(offsets[22], object.userId);
}

IsarSubscription _isarSubscriptionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarSubscription();
  object.activeTill = reader.readDateTimeOrNull(offsets[0]);
  object.ads = reader.readBool(offsets[1]);
  object.collections = reader.readLong(offsets[2]);
  object.created = reader.readDateTime(offsets[3]);
  object.customExclusionRules = reader.readBool(offsets[4]);
  object.dragNdrop = reader.readBool(offsets[5]);
  object.edit = reader.readBool(offsets[6]);
  object.grants = reader.readLong(offsets[7]);
  object.isarId = id;
  object.itemsPerCollection = reader.readLong(offsets[8]);
  object.maxSyncDevices = reader.readLong(offsets[9]);
  object.modified = reader.readDateTime(offsets[10]);
  object.pasteStackLimit = reader.readLong(offsets[11]);
  object.planName = reader.readString(offsets[12]);
  object.serverId = reader.readLongOrNull(offsets[13]);
  object.source = reader.readString(offsets[14]);
  object.subId = reader.readString(offsets[15]);
  object.syncHours = reader.readLong(offsets[16]);
  object.syncInterval = reader.readLong(offsets[17]);
  object.theming = reader.readBool(offsets[18]);
  object.tkn = reader.readStringOrNull(offsets[19]);
  object.trialEnd = reader.readDateTimeOrNull(offsets[20]);
  object.trialStart = reader.readDateTimeOrNull(offsets[21]);
  object.userId = reader.readString(offsets[22]);
  return object;
}

P _isarSubscriptionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    case 18:
      return (reader.readBool(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 21:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarSubscriptionGetId(IsarSubscription object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _isarSubscriptionGetLinks(IsarSubscription object) {
  return [];
}

void _isarSubscriptionAttach(
  IsarCollection<dynamic> col,
  Id id,
  IsarSubscription object,
) {
  object.isarId = id;
}

extension IsarSubscriptionQueryWhereSort
    on QueryBuilder<IsarSubscription, IsarSubscription, QWhere> {
  QueryBuilder<IsarSubscription, IsarSubscription, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarSubscriptionQueryWhere
    on QueryBuilder<IsarSubscription, IsarSubscription, QWhereClause> {
  QueryBuilder<IsarSubscription, IsarSubscription, QAfterWhereClause>
  isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterWhereClause>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterWhereClause>
  isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterWhereClause>
  isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterWhereClause>
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
}

extension IsarSubscriptionQueryFilter
    on QueryBuilder<IsarSubscription, IsarSubscription, QFilterCondition> {
  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  activeTillIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'activeTill'),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  activeTillIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'activeTill'),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  activeTillEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'activeTill', value: value),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  activeTillGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'activeTill',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  activeTillLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'activeTill',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  activeTillBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'activeTill',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  adsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ads', value: value),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  collectionsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'collections', value: value),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  collectionsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'collections',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  collectionsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'collections',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  collectionsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'collections',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  createdEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'created', value: value),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  customExclusionRulesEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'customExclusionRules',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  dragNdropEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dragNdrop', value: value),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  editEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'edit', value: value),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  grantsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'grants', value: value),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  grantsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'grants',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  grantsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'grants',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  grantsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'grants',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  itemsPerCollectionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'itemsPerCollection', value: value),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  itemsPerCollectionGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'itemsPerCollection',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  itemsPerCollectionLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'itemsPerCollection',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  itemsPerCollectionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'itemsPerCollection',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  maxSyncDevicesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'maxSyncDevices', value: value),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  maxSyncDevicesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'maxSyncDevices',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  maxSyncDevicesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'maxSyncDevices',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  maxSyncDevicesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'maxSyncDevices',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  modifiedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'modified', value: value),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  pasteStackLimitEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pasteStackLimit', value: value),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  pasteStackLimitGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pasteStackLimit',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  pasteStackLimitLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pasteStackLimit',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  pasteStackLimitBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pasteStackLimit',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  planNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'planName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  planNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'planName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  planNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'planName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  planNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'planName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  planNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'planName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  planNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'planName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  planNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'planName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  planNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'planName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  planNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'planName', value: ''),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  planNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'planName', value: ''),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  serverIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverId', value: value),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  sourceEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'source',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  sourceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'source',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  sourceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'source',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  sourceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'source',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  sourceStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'source',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  sourceEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'source',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  sourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'source',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  sourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'source',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'source', value: ''),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'source', value: ''),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  subIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'subId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  subIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'subId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  subIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'subId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  subIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'subId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  subIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'subId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  subIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'subId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  subIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'subId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  subIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'subId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  subIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'subId', value: ''),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  subIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'subId', value: ''),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  syncHoursEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncHours', value: value),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  syncHoursGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'syncHours',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  syncHoursLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'syncHours',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  syncHoursBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'syncHours',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  syncIntervalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncInterval', value: value),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  syncIntervalGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'syncInterval',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  syncIntervalLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'syncInterval',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  syncIntervalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'syncInterval',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  themingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'theming', value: value),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  tknIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'tkn'),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  tknIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'tkn'),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  tknEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tkn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  tknGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tkn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  tknLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tkn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  tknBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tkn',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  tknStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tkn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  tknEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tkn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  tknContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tkn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  tknMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tkn',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  tknIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tkn', value: ''),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  tknIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tkn', value: ''),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  trialEndIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'trialEnd'),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  trialEndIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'trialEnd'),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  trialEndEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'trialEnd', value: value),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  trialEndGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'trialEnd',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  trialEndLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'trialEnd',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  trialEndBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'trialEnd',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  trialStartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'trialStart'),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  trialStartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'trialStart'),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  trialStartEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'trialStart', value: value),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  trialStartGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'trialStart',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  trialStartLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'trialStart',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  trialStartBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'trialStart',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
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

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterFilterCondition>
  userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userId', value: ''),
      );
    });
  }
}

extension IsarSubscriptionQueryObject
    on QueryBuilder<IsarSubscription, IsarSubscription, QFilterCondition> {}

extension IsarSubscriptionQueryLinks
    on QueryBuilder<IsarSubscription, IsarSubscription, QFilterCondition> {}

extension IsarSubscriptionQuerySortBy
    on QueryBuilder<IsarSubscription, IsarSubscription, QSortBy> {
  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByActiveTill() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeTill', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByActiveTillDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeTill', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy> sortByAds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ads', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByAdsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ads', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByCollections() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collections', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByCollectionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collections', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByCustomExclusionRules() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customExclusionRules', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByCustomExclusionRulesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customExclusionRules', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByDragNdrop() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dragNdrop', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByDragNdropDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dragNdrop', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy> sortByEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'edit', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'edit', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByGrants() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grants', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByGrantsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grants', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByItemsPerCollection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemsPerCollection', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByItemsPerCollectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemsPerCollection', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByMaxSyncDevices() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSyncDevices', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByMaxSyncDevicesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSyncDevices', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByPasteStackLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pasteStackLimit', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByPasteStackLimitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pasteStackLimit', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByPlanName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planName', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByPlanNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planName', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy> sortBySubId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subId', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortBySubIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subId', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortBySyncHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncHours', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortBySyncHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncHours', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortBySyncInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncInterval', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortBySyncIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncInterval', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByTheming() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theming', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByThemingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theming', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy> sortByTkn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tkn', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByTknDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tkn', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByTrialEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialEnd', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByTrialEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialEnd', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByTrialStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialStart', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByTrialStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialStart', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension IsarSubscriptionQuerySortThenBy
    on QueryBuilder<IsarSubscription, IsarSubscription, QSortThenBy> {
  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByActiveTill() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeTill', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByActiveTillDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeTill', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy> thenByAds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ads', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByAdsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ads', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByCollections() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collections', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByCollectionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collections', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByCustomExclusionRules() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customExclusionRules', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByCustomExclusionRulesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customExclusionRules', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByDragNdrop() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dragNdrop', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByDragNdropDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dragNdrop', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy> thenByEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'edit', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'edit', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByGrants() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grants', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByGrantsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grants', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByItemsPerCollection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemsPerCollection', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByItemsPerCollectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemsPerCollection', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByMaxSyncDevices() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSyncDevices', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByMaxSyncDevicesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSyncDevices', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByPasteStackLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pasteStackLimit', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByPasteStackLimitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pasteStackLimit', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByPlanName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planName', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByPlanNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planName', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy> thenBySubId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subId', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenBySubIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subId', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenBySyncHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncHours', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenBySyncHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncHours', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenBySyncInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncInterval', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenBySyncIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncInterval', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByTheming() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theming', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByThemingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theming', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy> thenByTkn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tkn', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByTknDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tkn', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByTrialEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialEnd', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByTrialEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialEnd', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByTrialStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialStart', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByTrialStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialStart', Sort.desc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QAfterSortBy>
  thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension IsarSubscriptionQueryWhereDistinct
    on QueryBuilder<IsarSubscription, IsarSubscription, QDistinct> {
  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct>
  distinctByActiveTill() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeTill');
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct> distinctByAds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ads');
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct>
  distinctByCollections() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'collections');
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct>
  distinctByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'created');
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct>
  distinctByCustomExclusionRules() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customExclusionRules');
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct>
  distinctByDragNdrop() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dragNdrop');
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct> distinctByEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'edit');
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct>
  distinctByGrants() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grants');
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct>
  distinctByItemsPerCollection() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemsPerCollection');
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct>
  distinctByMaxSyncDevices() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxSyncDevices');
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct>
  distinctByModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modified');
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct>
  distinctByPasteStackLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pasteStackLimit');
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct>
  distinctByPlanName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'planName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct>
  distinctByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId');
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct> distinctBySource({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'source', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct> distinctBySubId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct>
  distinctBySyncHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncHours');
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct>
  distinctBySyncInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncInterval');
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct>
  distinctByTheming() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'theming');
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct> distinctByTkn({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tkn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct>
  distinctByTrialEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trialEnd');
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct>
  distinctByTrialStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trialStart');
    });
  }

  QueryBuilder<IsarSubscription, IsarSubscription, QDistinct> distinctByUserId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension IsarSubscriptionQueryProperty
    on QueryBuilder<IsarSubscription, IsarSubscription, QQueryProperty> {
  QueryBuilder<IsarSubscription, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<IsarSubscription, DateTime?, QQueryOperations>
  activeTillProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeTill');
    });
  }

  QueryBuilder<IsarSubscription, bool, QQueryOperations> adsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ads');
    });
  }

  QueryBuilder<IsarSubscription, int, QQueryOperations> collectionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'collections');
    });
  }

  QueryBuilder<IsarSubscription, DateTime, QQueryOperations> createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'created');
    });
  }

  QueryBuilder<IsarSubscription, bool, QQueryOperations>
  customExclusionRulesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customExclusionRules');
    });
  }

  QueryBuilder<IsarSubscription, bool, QQueryOperations> dragNdropProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dragNdrop');
    });
  }

  QueryBuilder<IsarSubscription, bool, QQueryOperations> editProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'edit');
    });
  }

  QueryBuilder<IsarSubscription, int, QQueryOperations> grantsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grants');
    });
  }

  QueryBuilder<IsarSubscription, int, QQueryOperations>
  itemsPerCollectionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemsPerCollection');
    });
  }

  QueryBuilder<IsarSubscription, int, QQueryOperations>
  maxSyncDevicesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxSyncDevices');
    });
  }

  QueryBuilder<IsarSubscription, DateTime, QQueryOperations>
  modifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modified');
    });
  }

  QueryBuilder<IsarSubscription, int, QQueryOperations>
  pasteStackLimitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pasteStackLimit');
    });
  }

  QueryBuilder<IsarSubscription, String, QQueryOperations> planNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'planName');
    });
  }

  QueryBuilder<IsarSubscription, int?, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<IsarSubscription, String, QQueryOperations> sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'source');
    });
  }

  QueryBuilder<IsarSubscription, String, QQueryOperations> subIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subId');
    });
  }

  QueryBuilder<IsarSubscription, int, QQueryOperations> syncHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncHours');
    });
  }

  QueryBuilder<IsarSubscription, int, QQueryOperations> syncIntervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncInterval');
    });
  }

  QueryBuilder<IsarSubscription, bool, QQueryOperations> themingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'theming');
    });
  }

  QueryBuilder<IsarSubscription, String?, QQueryOperations> tknProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tkn');
    });
  }

  QueryBuilder<IsarSubscription, DateTime?, QQueryOperations>
  trialEndProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trialEnd');
    });
  }

  QueryBuilder<IsarSubscription, DateTime?, QQueryOperations>
  trialStartProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trialStart');
    });
  }

  QueryBuilder<IsarSubscription, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
