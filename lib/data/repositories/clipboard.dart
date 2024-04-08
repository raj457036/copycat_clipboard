import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/paginated_results.dart';
import 'package:clipboard/data/sources/clipboard/clipboard.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class ClipboardRepository {
  FailureOr<ClipboardItem> create(ClipboardItem item);

  FailureOr<PaginatedResult<ClipboardItem>> getList({
    int limit = 50,
    int offset = 0,
  });

  FailureOr<ClipboardItem> update(ClipboardItem item);

  FailureOr<bool> delete(ClipboardItem item);
}

@LazySingleton(as: ClipboardRepository)
class ClipboardRepositoryImpl implements ClipboardRepository {
  final ClipboardSource local, remote;

  ClipboardRepositoryImpl(
    @Named("local") this.local,
    @Named("remote") this.remote,
  );

  @override
  FailureOr<ClipboardItem> create(ClipboardItem item) async {
    try {
      final remoteItem = await remote.create(item);
      final result = await local.create(remoteItem);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<PaginatedResult<ClipboardItem>> getList({
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      final result = await local.getList(limit: limit, offset: offset);

      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<ClipboardItem> update(ClipboardItem item) async {
    try {
      final remoteItem = await remote.update(item);
      final result = await local.update(remoteItem);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<bool> delete(ClipboardItem item) async {
    try {
      await local.delete(item);
      return const Right(true);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
