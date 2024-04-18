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
  }) async {
    var results = await db.txn(() async => await db.clipboardItems
        .filter()
        .deletedAtIsNull()
        .sortByCreatedDesc()
        .offset(offset)
        .limit(limit)
        .findAll());

    return PaginatedResult(
      results: results,
      hasMore: results.length == limit,
    );
  }

  @override
  Future<ClipboardItem> update(ClipboardItem item) async {
    final updated = item.copyWith(
      modified: nowUTC(),
    );
    updated.id = item.id;
    await db.writeTxn(
      () => db.clipboardItems.put(updated),
    );
    return item;
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
