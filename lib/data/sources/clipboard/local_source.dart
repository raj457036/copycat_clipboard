// ignore_for_file: invalid_use_of_protected_member

import 'package:clipboard/common/paginated_results.dart';
import 'package:clipboard/data/sources/clipboard/clipboard.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
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
  }) async {
    List<ClipboardItem> results;

    if (search == null && collectionId == null) {
      results = await db.txn(() async => await db.clipboardItems
          .filter()
          .deletedAtIsNull()
          .sortByCreatedDesc()
          .offset(offset)
          .limit(limit)
          .findAll());
    } else {
      results = await db.txn(() async {
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

        var query = filter
            .deletedAtIsNull()
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
  Future<ClipboardItem> update(ClipboardItem item) async {
    final updated = item.copyWith(
      modified: now(),
    );
    updated.id = item.id;
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
}
