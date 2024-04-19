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
    String? search,
  });

  FailureOr<ClipboardItem> update(ClipboardItem item);

  FailureOr<bool> delete(ClipboardItem item);

  FailureOr<void> deleteAll();
}

@Named("cloud")
@LazySingleton(as: ClipboardRepository)
class ClipboardRepositoryCloudImpl implements ClipboardRepository {
  final ClipboardSource remote;

  ClipboardRepositoryCloudImpl(
    @Named("remote") this.remote,
  );

  @override
  FailureOr<ClipboardItem> create(ClipboardItem item) async {
    try {
      final result = await remote.create(item);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<PaginatedResult<ClipboardItem>> getList({
    int limit = 50,
    int offset = 0,
    String? search,
  }) async {
    try {
      final result = await remote.getList(limit: limit, offset: offset);

      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<ClipboardItem> update(ClipboardItem item) async {
    try {
      final result = await remote.update(item);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<bool> delete(ClipboardItem item) async {
    try {
      await remote.delete(item);
      return const Right(true);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<void> deleteAll() async {
    // no-op
    return const Right(null);
  }
}

@Named("offline")
@LazySingleton(as: ClipboardRepository)
class ClipboardRepositoryOfflineImpl implements ClipboardRepository {
  final ClipboardSource local;

  ClipboardRepositoryOfflineImpl(
    @Named("local") this.local,
  );

  @override
  FailureOr<ClipboardItem> create(ClipboardItem item) async {
    try {
      final result = await local.create(item);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<PaginatedResult<ClipboardItem>> getList({
    int limit = 50,
    int offset = 0,
    String? search,
  }) async {
    try {
      final result =
          await local.getList(limit: limit, offset: offset, search: search);

      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<ClipboardItem> update(ClipboardItem item) async {
    try {
      final result = await local.update(item);
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

  @override
  FailureOr<void> deleteAll() async {
    try {
      await local.deleteAll();
      return const Right(null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
