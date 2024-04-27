import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/paginated_results.dart';
import 'package:clipboard/data/sources/clip_collection/clip_collection.dart';
import 'package:clipboard/db/clip_collection/clipcollection.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class ClipCollectionRepository {
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

@Named("cloud")
@LazySingleton(as: ClipCollectionRepository)
class ClipCollectionRepositoryCloudImpl implements ClipCollectionRepository {
  final ClipCollectionSource remote;

  ClipCollectionRepositoryCloudImpl(
    @Named("remote") this.remote,
  );

  @override
  FailureOr<ClipCollection> create(ClipCollection collection) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  FailureOr<bool> delete(ClipCollection collection) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  FailureOr<void> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  FailureOr<PaginatedResult<ClipCollection>> getList(
      {int limit = 50, int offset = 0, String? search}) {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  FailureOr<ClipCollection> update(ClipCollection collection) {
    // TODO: implement update
    throw UnimplementedError();
  }
}

@Named("offline")
@LazySingleton(as: ClipCollectionRepository)
class ClipCollectionRepositoryOfflineImpl implements ClipCollectionRepository {
  final ClipCollectionSource local;

  ClipCollectionRepositoryOfflineImpl(
    @Named("local") this.local,
  );

  @override
  FailureOr<ClipCollection> create(ClipCollection collection) async {
    try {
      final result = await local.create(collection);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<bool> delete(ClipCollection collection) async {
    try {
      final result = await local.delete(collection);
      return Right(result);
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
      final result = await local.update(collection);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
