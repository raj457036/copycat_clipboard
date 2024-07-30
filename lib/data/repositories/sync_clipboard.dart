import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/common/paginated_results.dart';
import 'package:copycat_base/db/clip_collection/clipcollection.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/domain/repositories/sync_clipboard.dart';
import 'package:copycat_base/domain/sources/sync_clipboard.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SyncRepository)
class SyncRepositoryImpl implements SyncRepository {
  final SyncClipboardSource source;

  SyncRepositoryImpl(@Named("remote") this.source);

  @override
  FailureOr<PaginatedResult<ClipboardItem>> getLatestClipboardItems({
    required String userId,
    int limit = 100,
    int offset = 0,
    String? excludeDeviceId,
    DateTime? lastSynced,
  }) async {
    try {
      final result = await source.getLatestClipboardItems(
        userId: userId,
        limit: limit,
        offset: offset,
        excludeDeviceId: excludeDeviceId,
        lastSynced: lastSynced,
      );
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<PaginatedResult<ClipCollection>> getLatestClipCollections({
    required String userId,
    int limit = 100,
    int offset = 0,
    String? excludeDeviceId,
    DateTime? lastSynced,
  }) async {
    try {
      final result = await source.getLatestClipCollections(
        userId: userId,
        limit: limit,
        offset: offset,
        excludeDeviceId: excludeDeviceId,
        lastSynced: lastSynced,
      );
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<PaginatedResult<ClipboardItem>> getDeletedClipboardItems({
    required String userId,
    int limit = 100,
    int offset = 0,
    String? excludeDeviceId,
    DateTime? lastSynced,
  }) async {
    try {
      final result = await source.getDeletedClipboardItems(
        userId: userId,
        limit: limit,
        offset: offset,
        excludeDeviceId: excludeDeviceId,
        lastSynced: lastSynced,
      );
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<PaginatedResult<ClipCollection>> getDeletedClipCollections({
    required String userId,
    int limit = 100,
    int offset = 0,
    String? excludeDeviceId,
    DateTime? lastSynced,
  }) async {
    try {
      final result = await source.getDeletedClipCollections(
        userId: userId,
        limit: limit,
        offset: offset,
        excludeDeviceId: excludeDeviceId,
        lastSynced: lastSynced,
      );
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
