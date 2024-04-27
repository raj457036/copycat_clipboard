// ignore_for_file: invalid_use_of_protected_member

import 'package:clipboard/common/paginated_results.dart';
import 'package:clipboard/data/sources/clip_collection/clip_collection.dart';
import 'package:clipboard/db/clip_collection/clipcollection.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@Named("local")
@LazySingleton(as: ClipCollectionSource)
class LocalClipCollectionSource implements ClipCollectionSource {
  final Isar db;

  LocalClipCollectionSource(this.db);

  @override
  Future<ClipCollection> create(ClipCollection collection) async {
    final id = await db.writeTxn(() => db.clipCollections.put(collection));
    collection.id = id;
    return collection;
  }

  @override
  Future<PaginatedResult<ClipCollection>> getList({
    int limit = 50,
    int offset = 0,
    String? search,
  }) async {
    List<ClipCollection> results;

    if (search == null) {
      results = await db.txn(() async => await db.clipCollections
          .where()
          .sortByCreatedDesc()
          .offset(offset)
          .limit(limit)
          .findAll());
    } else {
      results = await db.txn(() async {
        var filter = db.clipCollections.filter();

        for (final word in Isar.splitWords(search)) {
          filter = filter
              .titleWordsElementContains(word, caseSensitive: false)
              .or()
              .titleWordsElementStartsWith(word, caseSensitive: false)
              .or()
              .titleContains(word, caseSensitive: false)
              .or()
              .descriptionWordsElementContains(word, caseSensitive: false)
              .or()
              .descriptionWordsElementStartsWith(word, caseSensitive: false)
              .or()
              .descriptionContains(word, caseSensitive: false);
        }

        var query = filter
            .titleIsNotEmpty()
            .sortByCreatedDesc()
            .offset(offset)
            .limit(limit)
            .findAll();
        return query;
      });
    }

    return PaginatedResult(
      results: results,
      hasMore: results.length == limit,
    );
  }

  @override
  Future<ClipCollection> update(ClipCollection collection) async {
    final updated = collection.copyWith(
      modified: now(),
    )..applyId(collection);
    await db.writeTxn(
      () => db.clipCollections.put(updated),
    );
    return updated;
  }

  @override
  Future<bool> delete(ClipCollection collection) async {
    final result =
        await db.writeTxn(() => db.clipCollections.delete(collection.id));
    return result;
  }

  @override
  Future<void> deleteAll() async {
    await db.writeTxn(() => db.clipCollections.clear());
  }
}
