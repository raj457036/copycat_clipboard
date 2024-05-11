// ignore_for_file: invalid_use_of_protected_member

import 'package:clipboard/common/paginated_results.dart';
import 'package:clipboard/data/sources/clipboard/clipboard.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/enums/sort.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@Named("local")
@LazySingleton(as: ClipboardSource)
class LocalClipboardSource implements ClipboardSource {
  final Isar db;

  LocalClipboardSource(this.db);

  @override
  Future<ClipboardItem> create(ClipboardItem item) async {
    final id = await db.writeTxn(() => db.clipboardItems.put(item));
    item.id = id;
    return item;
  }

  @override
  Future<PaginatedResult<ClipboardItem>> getList({
    int limit = 50,
    int offset = 0,
    String? search,
    int? collectionId,
    ClipboardSortKey? sortBy,
    SortOrder order = SortOrder.desc,
  }) async {
    QueryBuilder<ClipboardItem, ClipboardItem, QFilterCondition> resultsQuery;

    if (search == null && collectionId == null) {
      resultsQuery = db.clipboardItems.filter();
    } else {
      var filter = db.clipboardItems.filter();

      if (collectionId != null) {
        filter = filter.collectionIdEqualTo(collectionId);
      }

      for (final word in Isar.splitWords(search ?? "")) {
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
            .descriptionContains(word, caseSensitive: false)
            .or()
            .urlWordsElementContains(word, caseSensitive: false)
            .or()
            .urlWordsElementStartsWith(word, caseSensitive: false)
            .or()
            .urlContains(word, caseSensitive: false)
            .or()
            .textWordElementContains(word, caseSensitive: false)
            .or()
            .textWordElementStartsWith(word, caseSensitive: false)
            .or()
            .textContains(word, caseSensitive: false)
            .or()
            .mimetypeWordContains(word, caseSensitive: false)
            .or()
            .textCategoryContains(word, caseSensitive: false)
            .or()
            .typeWordContains(word, caseSensitive: false);
      }

      resultsQuery = filter;
    }

    var query = resultsQuery.deletedAtIsNull();

    QueryBuilder<ClipboardItem, ClipboardItem, QAfterSortBy> sortedQuery;

    switch (sortBy) {
      case ClipboardSortKey.modified:
        sortedQuery =
            order.isDesc ? query.sortByModifiedDesc() : query.sortByModified();
        break;
      case ClipboardSortKey.lastCopied:
        sortedQuery = order.isDesc
            ? query.sortByLastCopiedDesc()
            : query.sortByLastCopied();
        break;
      case ClipboardSortKey.copyCount:
        sortedQuery = order.isDesc
            ? query.sortByCopiedCountDesc()
            : query.sortByCopiedCount();
        break;
      case ClipboardSortKey.created:
      case _:
        sortedQuery =
            order.isDesc ? query.sortByCreatedDesc() : query.sortByCreated();
        break;
    }

    var paginatedQuery = sortedQuery.offset(offset).limit(limit).findAll();

    final results = await db.txn(() async => await paginatedQuery);

    return PaginatedResult(
      results: results,
      hasMore: results.length == limit,
    );
  }

  @override
  Future<ClipboardItem> update(ClipboardItem item) async {
    final updated = item.copyWith(
      modified: now(),
    )..applyId(item);
    await db.writeTxn(
      () => db.clipboardItems.put(updated),
    );
    return updated;
  }

  @override
  Future<bool> delete(ClipboardItem item) async {
    final result = await db.writeTxn(() => db.clipboardItems.delete(item.id));
    return result;
  }

  @override
  Future<void> deleteAll() async {
    await db.writeTxn(() => db.clipboardItems.clear());
  }

  @override
  Future<ClipboardItem?> get({int? id, String? serverId}) async {
    if (id == null) return null;
    final result = await db.txn(() => db.clipboardItems.get(id));
    return result;
  }
}
