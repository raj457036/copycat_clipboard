import 'package:appwrite/appwrite.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/paginated_results.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class SyncClipboardRepository {
  FailureOr<PaginatedResult<ClipboardItem>> getLatestItems({
    required String userId,
    int limit = 100,
    int offset = 0,
    DateTime? lastSynced,
  });

  FailureOr<PaginatedResult<ClipboardItem>> getDeletedItems({
    required String userId,
    int limit = 100,
    int offset = 0,
    DateTime? lastSynced,
  });
}

@LazySingleton(as: SyncClipboardRepository)
class SyncClipboardRepositoryImpl implements SyncClipboardRepository {
  final Databases db;
  final String databaseId;
  final String collectionId;

  SyncClipboardRepositoryImpl(
    this.db,
    @Named("databaseId") this.databaseId,
    @Named("clipboardCollectionId") this.collectionId,
  );

  @override
  FailureOr<PaginatedResult<ClipboardItem>> getDeletedItems({
    required String userId,
    int limit = 100,
    int offset = 0,
    DateTime? lastSynced,
  }) async {
    try {
      final docs = await db.listDocuments(
        databaseId: databaseId,
        collectionId: collectionId,
        queries: [
          Query.equal("userId", userId),
          Query.isNotNull("deletedAt"),
          Query.greaterThanEqual("deletedAt", lastSynced),
          Query.orderDesc("\$updatedAt"),
          Query.limit(limit),
          Query.offset(offset),
        ],
      );
      final items =
          docs.documents.map((e) => ClipboardItem.fromJson(e.data)).toList();
      return Right(
        PaginatedResult(
          results: items,
          hasMore: items.length == limit,
        ),
      );
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<PaginatedResult<ClipboardItem>> getLatestItems({
    required String userId,
    int limit = 100,
    int offset = 0,
    DateTime? lastSynced,
  }) async {
    try {
      final docs = await db.listDocuments(
        databaseId: databaseId,
        collectionId: collectionId,
        queries: [
          Query.equal("userId", userId),
          if (lastSynced != null)
            Query.greaterThan(
                "\$updatedAt", lastSynced.toUtc().toIso8601String()),
          Query.orderDesc("\$updatedAt"),
          Query.limit(limit),
          Query.offset(offset),
        ],
      );
      final items =
          docs.documents.map((e) => ClipboardItem.fromJson(e.data)).toList();
      return Right(
        PaginatedResult(
          results: items,
          hasMore: limit == items.length,
        ),
      );
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
