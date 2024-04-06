import 'package:clipboard/common/failure.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

abstract class ClipboardRepository {
  FailureOr<ClipboardItem> create(ClipboardItem item);

  FailureOr<List<ClipboardItem>> getList({int limit = 50, int offset = 0});

  FailureOr<ClipboardItem> update(ClipboardItem item);

  FailureOr<bool> delete(ClipboardItem item);
}

@LazySingleton(as: ClipboardRepository)
class ClipboardRepositoryImpl implements ClipboardRepository {
  final Isar db;

  ClipboardRepositoryImpl(this.db);

  @override
  FailureOr<ClipboardItem> create(ClipboardItem item) async {
    try {
      final id = await db.writeTxn(() => db.clipboardItems.put(item));
      item.id = id;
      return Right(item);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<List<ClipboardItem>> getList({
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      final items = await db.clipboardItems
          .where()
          .sortByCreatedDesc()
          .offset(offset)
          .limit(limit)
          .findAll();

      return Right(items);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<ClipboardItem> update(ClipboardItem item) async {
    try {
      await db.writeTxn(
        () => db.clipboardItems.put(
          item.copyWith(
            modified: DateTime.now(),
          ),
        ),
      );
      return Right(item);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<bool> delete(ClipboardItem item) async {
    try {
      final result = await db.writeTxn(() => db.clipboardItems.delete(item.id));
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
