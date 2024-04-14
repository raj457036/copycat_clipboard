import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/paginated_results.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  final SupabaseClient client;
  final String table = "clipboard_items";

  SyncClipboardRepositoryImpl(this.client);

  PostgrestClient get db => client.rest;

  @override
  FailureOr<PaginatedResult<ClipboardItem>> getDeletedItems({
    required String userId,
    int limit = 100,
    int offset = 0,
    DateTime? lastSynced,
  }) async {
    try {
      var query = db.from(table).select().eq("userId", userId).isFilter(
            "deletedAt",
            null,
          );

      if (lastSynced != null) {
        query = query.gte("deletedAt", lastSynced.toIso8601String());
      }
      final docs = await query.order("modified").range(offset, offset + limit);
      final items = docs.map((e) => ClipboardItem.fromJson(e)).toList();
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
      var query = db.from(table).select().eq("userId", userId);

      if (lastSynced != null) {
        query = query.gt("modified", lastSynced.toString());
      }
      final docs = await query.order("modified").range(offset, offset + limit);
      final items = docs.map((e) => ClipboardItem.fromJson(e)).toList();
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
