// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSubscriptionCollection on Isar {
  IsarCollection<Subscription> get subscriptions => this.collection();
}

const SubscriptionSchema = CollectionSchema(
  name: r'Subscription',
  id: -3426239935225026138,
  properties: {
    r'activeTill': PropertySchema(
      id: 0,
      name: r'activeTill',
      type: IsarType.dateTime,
    ),
    r'ads': PropertySchema(
      id: 1,
      name: r'ads',
      type: IsarType.bool,
    ),
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
    r'edit': PropertySchema(
      id: 4,
      name: r'edit',
      type: IsarType.bool,
    ),
    r'encrypt': PropertySchema(
      id: 5,
      name: r'encrypt',
      type: IsarType.bool,
    ),
    r'isPersisted': PropertySchema(
      id: 6,
      name: r'isPersisted',
      type: IsarType.bool,
    ),
    r'maxSyncDevices': PropertySchema(
      id: 7,
      name: r'maxSyncDevices',
      type: IsarType.long,
    ),
    r'modified': PropertySchema(
      id: 8,
      name: r'modified',
      type: IsarType.dateTime,
    ),
    r'planName': PropertySchema(
      id: 9,
      name: r'planName',
      type: IsarType.string,
    ),
    r'serverId': PropertySchema(
      id: 10,
      name: r'serverId',
      type: IsarType.long,
    ),
    r'source': PropertySchema(
      id: 11,
      name: r'source',
      type: IsarType.string,
    ),
    r'subId': PropertySchema(
      id: 12,
      name: r'subId',
      type: IsarType.string,
    ),
    r'syncHours': PropertySchema(
      id: 13,
      name: r'syncHours',
      type: IsarType.long,
    ),
    r'syncInterval': PropertySchema(
      id: 14,
      name: r'syncInterval',
      type: IsarType.long,
    ),
    r'trialEnd': PropertySchema(
      id: 15,
      name: r'trialEnd',
      type: IsarType.dateTime,
    ),
    r'trialStart': PropertySchema(
      id: 16,
      name: r'trialStart',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 17,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _subscriptionEstimateSize,
  serialize: _subscriptionSerialize,
  deserialize: _subscriptionDeserialize,
  deserializeProp: _subscriptionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _subscriptionGetId,
  getLinks: _subscriptionGetLinks,
  attach: _subscriptionAttach,
  version: '3.1.0+1',
);

int _subscriptionEstimateSize(
  Subscription object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.planName.length * 3;
  bytesCount += 3 + object.source.length * 3;
  bytesCount += 3 + object.subId.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _subscriptionSerialize(
  Subscription object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.activeTill);
  writer.writeBool(offsets[1], object.ads);
  writer.writeLong(offsets[2], object.collections);
  writer.writeDateTime(offsets[3], object.created);
  writer.writeBool(offsets[4], object.edit);
  writer.writeBool(offsets[5], object.encrypt);
  writer.writeBool(offsets[6], object.isPersisted);
  writer.writeLong(offsets[7], object.maxSyncDevices);
  writer.writeDateTime(offsets[8], object.modified);
  writer.writeString(offsets[9], object.planName);
  writer.writeLong(offsets[10], object.serverId);
  writer.writeString(offsets[11], object.source);
  writer.writeString(offsets[12], object.subId);
  writer.writeLong(offsets[13], object.syncHours);
  writer.writeLong(offsets[14], object.syncInterval);
  writer.writeDateTime(offsets[15], object.trialEnd);
  writer.writeDateTime(offsets[16], object.trialStart);
  writer.writeString(offsets[17], object.userId);
}

Subscription _subscriptionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Subscription(
    activeTill: reader.readDateTimeOrNull(offsets[0]),
    ads: reader.readBool(offsets[1]),
    collections: reader.readLong(offsets[2]),
    created: reader.readDateTime(offsets[3]),
    edit: reader.readBool(offsets[4]),
    encrypt: reader.readBool(offsets[5]),
    maxSyncDevices: reader.readLong(offsets[7]),
    modified: reader.readDateTime(offsets[8]),
    planName: reader.readString(offsets[9]),
    serverId: reader.readLongOrNull(offsets[10]),
    source: reader.readString(offsets[11]),
    subId: reader.readString(offsets[12]),
    syncHours: reader.readLong(offsets[13]),
    syncInterval: reader.readLong(offsets[14]),
    trialEnd: reader.readDateTimeOrNull(offsets[15]),
    trialStart: reader.readDateTimeOrNull(offsets[16]),
    userId: reader.readString(offsets[17]),
  );
  object.id = id;
  return object;
}

P _subscriptionDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _subscriptionGetId(Subscription object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _subscriptionGetLinks(Subscription object) {
  return [];
}

void _subscriptionAttach(
    IsarCollection<dynamic> col, Id id, Subscription object) {
  object.id = id;
}

extension SubscriptionQueryWhereSort
    on QueryBuilder<Subscription, Subscription, QWhere> {
  QueryBuilder<Subscription, Subscription, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SubscriptionQueryWhere
    on QueryBuilder<Subscription, Subscription, QWhereClause> {
  QueryBuilder<Subscription, Subscription, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<Subscription, Subscription, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause> idBetween(
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

extension SubscriptionQueryFilter
    on QueryBuilder<Subscription, Subscription, QFilterCondition> {
  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      activeTillIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'activeTill',
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      activeTillIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'activeTill',
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      activeTillEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeTill',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      activeTillGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activeTill',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      activeTillLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activeTill',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      activeTillBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activeTill',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> adsEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ads',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      collectionsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'collections',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      collectionsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'collections',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      collectionsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'collections',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      collectionsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'collections',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      createdEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
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

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
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

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
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

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> editEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'edit',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      encryptEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encrypt',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      isPersistedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPersisted',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      maxSyncDevicesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxSyncDevices',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      maxSyncDevicesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxSyncDevices',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      maxSyncDevicesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxSyncDevices',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      maxSyncDevicesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxSyncDevices',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      modifiedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modified',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
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

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
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

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
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

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      planNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'planName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      planNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'planName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      planNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'planName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      planNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'planName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      planNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'planName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      planNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'planName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      planNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'planName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      planNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'planName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      planNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'planName',
        value: '',
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      planNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'planName',
        value: '',
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serverId',
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serverId',
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      serverIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverId',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      serverIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serverId',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      serverIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serverId',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      serverIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serverId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> sourceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      sourceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      sourceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> sourceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'source',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      sourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      sourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      sourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> sourceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'source',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> subIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      subIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> subIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> subIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      subIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> subIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> subIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> subIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      subIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subId',
        value: '',
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      subIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subId',
        value: '',
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      syncHoursEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      syncHoursGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      syncHoursLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      syncHoursBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      syncIntervalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      syncIntervalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      syncIntervalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      syncIntervalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncInterval',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      trialEndIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trialEnd',
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      trialEndIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trialEnd',
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      trialEndEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trialEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      trialEndGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trialEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      trialEndLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trialEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      trialEndBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trialEnd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      trialStartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trialStart',
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      trialStartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trialStart',
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      trialStartEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trialStart',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      trialStartGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trialStart',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      trialStartLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trialStart',
        value: value,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      trialStartBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trialStart',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> userIdEqualTo(
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

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
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

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
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

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> userIdBetween(
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

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
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

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
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

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> userIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension SubscriptionQueryObject
    on QueryBuilder<Subscription, Subscription, QFilterCondition> {}

extension SubscriptionQueryLinks
    on QueryBuilder<Subscription, Subscription, QFilterCondition> {}

extension SubscriptionQuerySortBy
    on QueryBuilder<Subscription, Subscription, QSortBy> {
  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByActiveTill() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeTill', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
      sortByActiveTillDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeTill', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByAds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ads', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByAdsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ads', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByCollections() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collections', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
      sortByCollectionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collections', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'edit', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'edit', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByEncrypt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encrypt', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByEncryptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encrypt', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByIsPersisted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPersisted', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
      sortByIsPersistedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPersisted', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
      sortByMaxSyncDevices() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSyncDevices', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
      sortByMaxSyncDevicesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSyncDevices', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByPlanName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planName', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByPlanNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planName', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortBySubId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subId', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortBySubIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subId', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortBySyncHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncHours', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortBySyncHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncHours', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortBySyncInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncInterval', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
      sortBySyncIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncInterval', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByTrialEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialEnd', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByTrialEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialEnd', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByTrialStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialStart', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
      sortByTrialStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialStart', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension SubscriptionQuerySortThenBy
    on QueryBuilder<Subscription, Subscription, QSortThenBy> {
  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByActiveTill() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeTill', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
      thenByActiveTillDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeTill', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByAds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ads', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByAdsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ads', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByCollections() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collections', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
      thenByCollectionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collections', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'edit', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'edit', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByEncrypt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encrypt', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByEncryptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encrypt', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByIsPersisted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPersisted', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
      thenByIsPersistedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPersisted', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
      thenByMaxSyncDevices() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSyncDevices', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
      thenByMaxSyncDevicesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSyncDevices', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByPlanName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planName', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByPlanNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planName', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenBySubId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subId', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenBySubIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subId', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenBySyncHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncHours', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenBySyncHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncHours', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenBySyncInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncInterval', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
      thenBySyncIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncInterval', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByTrialEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialEnd', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByTrialEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialEnd', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByTrialStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialStart', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
      thenByTrialStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialStart', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension SubscriptionQueryWhereDistinct
    on QueryBuilder<Subscription, Subscription, QDistinct> {
  QueryBuilder<Subscription, Subscription, QDistinct> distinctByActiveTill() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeTill');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByAds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ads');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByCollections() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'collections');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'created');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'edit');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByEncrypt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'encrypt');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByIsPersisted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPersisted');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct>
      distinctByMaxSyncDevices() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxSyncDevices');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modified');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByPlanName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'planName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctBySource(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'source', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctBySubId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctBySyncHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncHours');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctBySyncInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncInterval');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByTrialEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trialEnd');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByTrialStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trialStart');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension SubscriptionQueryProperty
    on QueryBuilder<Subscription, Subscription, QQueryProperty> {
  QueryBuilder<Subscription, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Subscription, DateTime?, QQueryOperations> activeTillProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeTill');
    });
  }

  QueryBuilder<Subscription, bool, QQueryOperations> adsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ads');
    });
  }

  QueryBuilder<Subscription, int, QQueryOperations> collectionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'collections');
    });
  }

  QueryBuilder<Subscription, DateTime, QQueryOperations> createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'created');
    });
  }

  QueryBuilder<Subscription, bool, QQueryOperations> editProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'edit');
    });
  }

  QueryBuilder<Subscription, bool, QQueryOperations> encryptProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'encrypt');
    });
  }

  QueryBuilder<Subscription, bool, QQueryOperations> isPersistedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPersisted');
    });
  }

  QueryBuilder<Subscription, int, QQueryOperations> maxSyncDevicesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxSyncDevices');
    });
  }

  QueryBuilder<Subscription, DateTime, QQueryOperations> modifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modified');
    });
  }

  QueryBuilder<Subscription, String, QQueryOperations> planNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'planName');
    });
  }

  QueryBuilder<Subscription, int?, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<Subscription, String, QQueryOperations> sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'source');
    });
  }

  QueryBuilder<Subscription, String, QQueryOperations> subIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subId');
    });
  }

  QueryBuilder<Subscription, int, QQueryOperations> syncHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncHours');
    });
  }

  QueryBuilder<Subscription, int, QQueryOperations> syncIntervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncInterval');
    });
  }

  QueryBuilder<Subscription, DateTime?, QQueryOperations> trialEndProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trialEnd');
    });
  }

  QueryBuilder<Subscription, DateTime?, QQueryOperations> trialStartProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trialStart');
    });
  }

  QueryBuilder<Subscription, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionImpl _$$SubscriptionImplFromJson(Map<String, dynamic> json) =>
    _$SubscriptionImpl(
      serverId: (json['id'] as num?)?.toInt(),
      created: const DateTimeConverter().fromJson(json['created'] as String),
      modified: const DateTimeConverter().fromJson(json['modified'] as String),
      userId: json['userId'] as String,
      planName: json['planName'] as String,
      subId: json['subId'] as String,
      source: json['source'] as String,
      trialStart: _$JsonConverterFromJson<String, DateTime>(
          json['trialStart'], const DateTimeConverter().fromJson),
      trialEnd: _$JsonConverterFromJson<String, DateTime>(
          json['trialEnd'], const DateTimeConverter().fromJson),
      collections: (json['collections'] as num?)?.toInt() ?? 3,
      syncHours: (json['syncHr'] as num?)?.toInt() ?? 24,
      ads: json['ads'] as bool? ?? true,
      syncInterval: (json['syncInt'] as num?)?.toInt() ?? $45S,
      edit: json['edit'] as bool? ?? false,
      encrypt: json['encrypt'] as bool? ?? false,
      activeTill: _$JsonConverterFromJson<String, DateTime>(
          json['activeTill'], const DateTimeConverter().fromJson),
      maxSyncDevices: (json['devices'] as num?)?.toInt() ?? 3,
    );

Map<String, dynamic> _$$SubscriptionImplToJson(_$SubscriptionImpl instance) =>
    <String, dynamic>{
      'created': const DateTimeConverter().toJson(instance.created),
      'modified': const DateTimeConverter().toJson(instance.modified),
      'userId': instance.userId,
      'planName': instance.planName,
      'subId': instance.subId,
      'source': instance.source,
      'trialStart': _$JsonConverterToJson<String, DateTime>(
          instance.trialStart, const DateTimeConverter().toJson),
      'trialEnd': _$JsonConverterToJson<String, DateTime>(
          instance.trialEnd, const DateTimeConverter().toJson),
      'collections': instance.collections,
      'syncHr': instance.syncHours,
      'ads': instance.ads,
      'syncInt': instance.syncInterval,
      'edit': instance.edit,
      'encrypt': instance.encrypt,
      'activeTill': _$JsonConverterToJson<String, DateTime>(
          instance.activeTill, const DateTimeConverter().toJson),
      'devices': instance.maxSyncDevices,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
