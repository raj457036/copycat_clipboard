import 'package:clipboard/common/paginated_results.dart';
import 'package:clipboard/data/sources/clipboard/clipboard.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/network_status.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Named("remote")
@LazySingleton(as: ClipboardSource)
class RemoteClipboardSource implements ClipboardSource {
  final SupabaseClient client;
  final String table = "clipboard_items";

  final NetworkStatus network;

  RemoteClipboardSource(
    this.client,
    this.network,
  );

  PostgrestClient get db => client.rest;

  @override
  Future<ClipboardItem> create(ClipboardItem item) async {
    if (!await network.isConnected) return item;
    final docs = await db.from(table).insert(item.toJson()).select();

    final createdItem = item.copyWith(
      lastSynced: DateTime.now().toUtc(),
      serverId: docs.first['id'],
    )..applyId(item);

    return createdItem;
  }

  @override
  Future<PaginatedResult<ClipboardItem>> getList({
    int limit = 50,
    int offset = 0,
    DateTime? afterDate,
  }) async {
    if (!await network.isConnected) {
      return PaginatedResult(results: [], hasMore: false);
    }

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
    if (!await network.isConnected) return item;

    if (item.serverId == null) {
      return await create(item);
    }

    await db.from(table).update(item.toJson()).eq("id", item.serverId!);
    final updatedItem = item.copyWith(
      lastSynced: DateTime.now().toUtc(),
    )..applyId(item);
    return updatedItem;
  }

  @override
  Future<bool> delete(ClipboardItem item) async {
    if (!await network.isConnected) return false;

    if (item.serverId == null) {
      return true;
    }

    await db.from(table).delete().eq("id", item.serverId!);
    return true;
  }
}
