import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/paginated_results.dart';
import 'package:clipboard/data/sources/clip_collection/clip_collection.dart';
import 'package:clipboard/db/clip_collection/clipcollection.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class ClipCollectionRepository {
  FailureOr<ClipCollection?> get({int? id, int? serverId});
  FailureOr<ClipCollection> create(ClipCollection collection);

  FailureOr<PaginatedResult<ClipCollection>> getList({
    int limit = 50,
    int offset = 0,
    String? search,
  });

  FailureOr<ClipCollection> update(ClipCollection collection);

  FailureOr<bool> delete(ClipCollection collection);

  FailureOr<void> deleteAll();
}

@LazySingleton(as: ClipCollectionRepository)
class ClipCollectionRepositoryImpl implements ClipCollectionRepository {
  final ClipCollectionSource remote;
  final ClipCollectionSource local;

  ClipCollectionRepositoryImpl(
    @Named("remote") this.remote,
    @Named("local") this.local,
  );

  @override
  FailureOr<ClipCollection> create(ClipCollection collection) async {
    try {
      ClipCollection result = await remote.create(collection);
      result = await local.create(result);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<bool> delete(ClipCollection collection) async {
    try {
      await remote.delete(collection);
      await local.delete(collection);
      return const Right(true);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<void> deleteAll() async {
    try {
      final result = await local.deleteAll();
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<PaginatedResult<ClipCollection>> getList({
    int limit = 50,
    int offset = 0,
    String? search,
  }) async {
    try {
      final result = await local.getList(
        limit: limit,
        offset: offset,
        search: search,
      );
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<ClipCollection> update(ClipCollection collection) async {
    try {
      ClipCollection result = await remote.update(collection);
      result = await local.update(collection);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<ClipCollection?> get({int? id, int? serverId}) async {
    try {
      ClipCollection? result = await local.get(id: id, serverId: serverId);
      result ??= await remote.get(id: id, serverId: serverId);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
