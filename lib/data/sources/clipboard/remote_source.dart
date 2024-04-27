import 'package:clipboard/common/paginated_results.dart';
import 'package:clipboard/data/sources/clipboard/clipboard.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Named("remote")
@LazySingleton(as: ClipboardSource)
class RemoteClipboardSource implements ClipboardSource {
  final SupabaseClient client;
  final String table = "clipboard_items";

  RemoteClipboardSource(this.client);

  PostgrestClient get db => client.rest;

  @override
  Future<ClipboardItem> create(ClipboardItem item) async {
    final docs = await db.from(table).insert(item.toJson()).select();

    final createdItem = item.copyWith(
      lastSynced: now(),
      serverId: docs.first['id'],
    )..applyId(item);

    return createdItem;
  }

  @override
  Future<PaginatedResult<ClipboardItem>> getList({
    int limit = 50,
    int offset = 0,
    DateTime? afterDate,
    String? search,
    int? collectionId,
  }) async {
    final items = await db
        .from(table)
        .select()
        .order("modified")
        .range(offset, limit + offset);

    final clips = items.map((e) => ClipboardItem.fromJson(e)).toList();

    return PaginatedResult(results: clips, hasMore: clips.length == limit);
  }

  @override
  Future<ClipboardItem> update(ClipboardItem item) async {
    if (item.serverId == null) {
      return await create(item);
    }

    await db.from(table).update(item.toJson()).eq("id", item.serverId!);
    final updatedItem = item.copyWith(
      lastSynced: now(),
    )..applyId(item);
    return updatedItem;
  }

  @override
  Future<bool> delete(ClipboardItem item) async {
    if (item.serverId == null) {
      return true;
    }

    await db.from(table).delete().eq("id", item.serverId!);
    return true;
  }

  @override
  Future<bool> deleteAll() {
    throw UnimplementedError();
  }

  @override
  Future<ClipboardItem?> get({int? id, String? serverId}) async {
    if (serverId == null) return null;
    final item = await db.from(table).select().eq("id", serverId);
    if (item.isEmpty) return null;
    return ClipboardItem.fromJson(item.first);
  }
}
