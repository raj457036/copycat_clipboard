import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/common/paginated_results.dart';
import 'package:copycat_base/db/clip_collection/clipcollection.dart';
import 'package:copycat_base/domain/repositories/clip_collection.dart';
import 'package:copycat_base/domain/sources/clip_collection.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

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
      collection = collection.copyWith(modified: now())..applyId(collection);
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
    bool fromServer = false,
  }) async {
    try {
      if (fromServer) {
        final result = await remote.getList(
          limit: limit,
          offset: offset,
          search: search,
        );
        return Right(result);
      } else {
        final result = await local.getList(
          limit: limit,
          offset: offset,
          search: search,
        );
        return Right(result);
      }
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<ClipCollection> update(ClipCollection collection) async {
    try {
      collection = collection.copyWith(modified: now())..applyId(collection);
      ClipCollection result = await remote.update(collection);
      result = await local.update(result);
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
