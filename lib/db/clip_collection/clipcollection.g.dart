// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clipcollection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetClipCollectionCollection on Isar {
  IsarCollection<ClipCollection> get clipCollections => this.collection();
}

const ClipCollectionSchema = CollectionSchema(
  name: r'ClipCollection',
  id: 442837445801629852,
  properties: {
    r'created': PropertySchema(
      id: 0,
      name: r'created',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'descriptionWords': PropertySchema(
      id: 2,
      name: r'descriptionWords',
      type: IsarType.stringList,
    ),
    r'emoji': PropertySchema(
      id: 3,
      name: r'emoji',
      type: IsarType.string,
    ),
    r'isPersisted': PropertySchema(
      id: 4,
      name: r'isPersisted',
      type: IsarType.bool,
    ),
    r'modified': PropertySchema(
      id: 5,
      name: r'modified',
      type: IsarType.dateTime,
    ),
    r'serverId': PropertySchema(
      id: 6,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 7,
      name: r'title',
      type: IsarType.string,
    ),
    r'titleWords': PropertySchema(
      id: 8,
      name: r'titleWords',
      type: IsarType.stringList,
    )
  },
  estimateSize: _clipCollectionEstimateSize,
  serialize: _clipCollectionSerialize,
  deserialize: _clipCollectionDeserialize,
  deserializeProp: _clipCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'titleWords': IndexSchema(
      id: 80481505061976672,
      name: r'titleWords',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'titleWords',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'descriptionWords': IndexSchema(
      id: 4013375675557855679,
      name: r'descriptionWords',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'descriptionWords',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _clipCollectionGetId,
  getLinks: _clipCollectionGetLinks,
  attach: _clipCollectionAttach,
  version: '3.1.0+1',
);

int _clipCollectionEstimateSize(
  ClipCollection object,
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
  bytesCount += 3 + object.descriptionWords.length * 3;
  {
    for (var i = 0; i < object.descriptionWords.length; i++) {
      final value = object.descriptionWords[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.emoji.length * 3;
  {
    final value = object.serverId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.titleWords.length * 3;
  {
    for (var i = 0; i < object.titleWords.length; i++) {
      final value = object.titleWords[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _clipCollectionSerialize(
  ClipCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.created);
  writer.writeString(offsets[1], object.description);
  writer.writeStringList(offsets[2], object.descriptionWords);
  writer.writeString(offsets[3], object.emoji);
  writer.writeBool(offsets[4], object.isPersisted);
  writer.writeDateTime(offsets[5], object.modified);
  writer.writeString(offsets[6], object.serverId);
  writer.writeString(offsets[7], object.title);
  writer.writeStringList(offsets[8], object.titleWords);
}

ClipCollection _clipCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ClipCollection(
    created: reader.readDateTime(offsets[0]),
    description: reader.readStringOrNull(offsets[1]),
    emoji: reader.readString(offsets[3]),
    modified: reader.readDateTime(offsets[5]),
    serverId: reader.readStringOrNull(offsets[6]),
    title: reader.readString(offsets[7]),
  );
  object.id = id;
  return object;
}

P _clipCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _clipCollectionGetId(ClipCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _clipCollectionGetLinks(ClipCollection object) {
  return [];
}

void _clipCollectionAttach(
    IsarCollection<dynamic> col, Id id, ClipCollection object) {
  object.id = id;
}

extension ClipCollectionQueryWhereSort
    on QueryBuilder<ClipCollection, ClipCollection, QWhere> {
  QueryBuilder<ClipCollection, ClipCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhere>
      anyTitleWordsElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'titleWords'),
      );
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhere>
      anyDescriptionWordsElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'descriptionWords'),
      );
    });
  }
}

extension ClipCollectionQueryWhere
    on QueryBuilder<ClipCollection, ClipCollection, QWhereClause> {
  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause> idBetween(
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause>
      titleWordsElementEqualTo(String titleWordsElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'titleWords',
        value: [titleWordsElement],
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause>
      titleWordsElementNotEqualTo(String titleWordsElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'titleWords',
              lower: [],
              upper: [titleWordsElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'titleWords',
              lower: [titleWordsElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'titleWords',
              lower: [titleWordsElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'titleWords',
              lower: [],
              upper: [titleWordsElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause>
      titleWordsElementGreaterThan(
    String titleWordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'titleWords',
        lower: [titleWordsElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause>
      titleWordsElementLessThan(
    String titleWordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'titleWords',
        lower: [],
        upper: [titleWordsElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause>
      titleWordsElementBetween(
    String lowerTitleWordsElement,
    String upperTitleWordsElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'titleWords',
        lower: [lowerTitleWordsElement],
        includeLower: includeLower,
        upper: [upperTitleWordsElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause>
      titleWordsElementStartsWith(String TitleWordsElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'titleWords',
        lower: [TitleWordsElementPrefix],
        upper: ['$TitleWordsElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause>
      titleWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'titleWords',
        value: [''],
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause>
      titleWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'titleWords',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'titleWords',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'titleWords',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'titleWords',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause>
      descriptionWordsElementEqualTo(String descriptionWordsElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'descriptionWords',
        value: [descriptionWordsElement],
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause>
      descriptionWordsElementNotEqualTo(String descriptionWordsElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'descriptionWords',
              lower: [],
              upper: [descriptionWordsElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'descriptionWords',
              lower: [descriptionWordsElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'descriptionWords',
              lower: [descriptionWordsElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'descriptionWords',
              lower: [],
              upper: [descriptionWordsElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause>
      descriptionWordsElementGreaterThan(
    String descriptionWordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'descriptionWords',
        lower: [descriptionWordsElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause>
      descriptionWordsElementLessThan(
    String descriptionWordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'descriptionWords',
        lower: [],
        upper: [descriptionWordsElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause>
      descriptionWordsElementBetween(
    String lowerDescriptionWordsElement,
    String upperDescriptionWordsElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'descriptionWords',
        lower: [lowerDescriptionWordsElement],
        includeLower: includeLower,
        upper: [upperDescriptionWordsElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause>
      descriptionWordsElementStartsWith(String DescriptionWordsElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'descriptionWords',
        lower: [DescriptionWordsElementPrefix],
        upper: ['$DescriptionWordsElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause>
      descriptionWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'descriptionWords',
        value: [''],
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterWhereClause>
      descriptionWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'descriptionWords',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'descriptionWords',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'descriptionWords',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'descriptionWords',
              upper: [''],
            ));
      }
    });
  }
}

extension ClipCollectionQueryFilter
    on QueryBuilder<ClipCollection, ClipCollection, QFilterCondition> {
  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      createdEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionWordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descriptionWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionWordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descriptionWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionWordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descriptionWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionWordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descriptionWords',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionWordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descriptionWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionWordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descriptionWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionWordsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descriptionWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionWordsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descriptionWords',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descriptionWords',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descriptionWords',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionWordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'descriptionWords',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionWordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'descriptionWords',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionWordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'descriptionWords',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionWordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'descriptionWords',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionWordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'descriptionWords',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      descriptionWordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'descriptionWords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      emojiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      emojiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      emojiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      emojiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emoji',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      emojiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      emojiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      emojiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      emojiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emoji',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      emojiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emoji',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      emojiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emoji',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      isPersistedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPersisted',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      modifiedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modified',
        value: value,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serverId',
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serverId',
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      serverIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      serverIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serverId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverId',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serverId',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleEqualTo(
    String value, {
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleLessThan(
    String value, {
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
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

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleWordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleWordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titleWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleWordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titleWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleWordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titleWords',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleWordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titleWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleWordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titleWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleWordsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titleWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleWordsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titleWords',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleWords',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titleWords',
        value: '',
      ));
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleWordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'titleWords',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleWordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'titleWords',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleWordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'titleWords',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleWordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'titleWords',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleWordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'titleWords',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterFilterCondition>
      titleWordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'titleWords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ClipCollectionQueryObject
    on QueryBuilder<ClipCollection, ClipCollection, QFilterCondition> {}

extension ClipCollectionQueryLinks
    on QueryBuilder<ClipCollection, ClipCollection, QFilterCondition> {}

extension ClipCollectionQuerySortBy
    on QueryBuilder<ClipCollection, ClipCollection, QSortBy> {
  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy> sortByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy>
      sortByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy> sortByEmoji() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emoji', Sort.asc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy> sortByEmojiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emoji', Sort.desc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy>
      sortByIsPersisted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPersisted', Sort.asc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy>
      sortByIsPersistedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPersisted', Sort.desc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy> sortByModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.asc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy>
      sortByModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.desc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy> sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy>
      sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension ClipCollectionQuerySortThenBy
    on QueryBuilder<ClipCollection, ClipCollection, QSortThenBy> {
  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy> thenByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy>
      thenByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy> thenByEmoji() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emoji', Sort.asc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy> thenByEmojiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emoji', Sort.desc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy>
      thenByIsPersisted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPersisted', Sort.asc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy>
      thenByIsPersistedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPersisted', Sort.desc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy> thenByModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.asc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy>
      thenByModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modified', Sort.desc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy> thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy>
      thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension ClipCollectionQueryWhereDistinct
    on QueryBuilder<ClipCollection, ClipCollection, QDistinct> {
  QueryBuilder<ClipCollection, ClipCollection, QDistinct> distinctByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'created');
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QDistinct>
      distinctByDescriptionWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descriptionWords');
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QDistinct> distinctByEmoji(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emoji', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QDistinct>
      distinctByIsPersisted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPersisted');
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QDistinct> distinctByModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modified');
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QDistinct> distinctByServerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClipCollection, ClipCollection, QDistinct>
      distinctByTitleWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titleWords');
    });
  }
}

extension ClipCollectionQueryProperty
    on QueryBuilder<ClipCollection, ClipCollection, QQueryProperty> {
  QueryBuilder<ClipCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ClipCollection, DateTime, QQueryOperations> createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'created');
    });
  }

  QueryBuilder<ClipCollection, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<ClipCollection, List<String>, QQueryOperations>
      descriptionWordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descriptionWords');
    });
  }

  QueryBuilder<ClipCollection, String, QQueryOperations> emojiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emoji');
    });
  }

  QueryBuilder<ClipCollection, bool, QQueryOperations> isPersistedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPersisted');
    });
  }

  QueryBuilder<ClipCollection, DateTime, QQueryOperations> modifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modified');
    });
  }

  QueryBuilder<ClipCollection, String?, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<ClipCollection, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<ClipCollection, List<String>, QQueryOperations>
      titleWordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleWords');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClipCollectionImpl _$$ClipCollectionImplFromJson(Map<String, dynamic> json) =>
    _$ClipCollectionImpl(
      serverId: json['id'] as String?,
      created: const DateTimeConverter().fromJson(json['created'] as String),
      modified: const DateTimeConverter().fromJson(json['modified'] as String),
      title: json['title'] as String,
      description: json['description'] as String?,
      emoji: json['emoji'] as String,
    );

Map<String, dynamic> _$$ClipCollectionImplToJson(
        _$ClipCollectionImpl instance) =>
    <String, dynamic>{
      'created': const DateTimeConverter().toJson(instance.created),
      'modified': const DateTimeConverter().toJson(instance.modified),
      'title': instance.title,
      'description': instance.description,
      'emoji': instance.emoji,
    };
