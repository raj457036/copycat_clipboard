import 'package:clipboard/common/paginated_results.dart';
import 'package:clipboard/data/sources/clip_collection/clip_collection.dart';
import 'package:clipboard/db/clip_collection/clipcollection.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Named("remote")
@LazySingleton(as: ClipCollectionSource)
class RemoteClipCollectionSource implements ClipCollectionSource {
  final SupabaseClient client;
  final String table = "clip_collections";

  RemoteClipCollectionSource(this.client);

  PostgrestClient get db => client.rest;

  @override
  Future<ClipCollection> create(ClipCollection collection) async {
    final result = await db.from(table).insert(collection.toJson()).select();

    return collection.copyWith(serverId: result.first["id"])
      ..applyId(collection);
  }

  @override
  Future<bool> delete(ClipCollection collection) async {
    if (collection.serverId == null) {
      return false;
    }
    await db.from(table).delete().eq("id", collection.serverId!);
    return true;
  }

  @override
  Future<void> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<PaginatedResult<ClipCollection>> getList({
    int limit = 50,
    int offset = 0,

    /// no-op
    String? search,
  }) async {
    final items = await db
        .from(table)
        .select()
        .order("modified")
        .range(offset, limit + offset);

    final clips = items.map((e) => ClipCollection.fromJson(e)).toList();

    return PaginatedResult(results: clips, hasMore: clips.length == limit);
  }

  @override
  Future<ClipCollection> update(ClipCollection collection) async {
    if (collection.serverId == null) {
      return collection;
    }
    await db
        .from(table)
        .update(collection.toJson())
        .eq("id", collection.serverId!);
    return collection;
  }

  @override
  Future<ClipCollection?> get({int? id, int? serverId}) async {
    if (serverId == null) return null;
    final result = await db.from(table).select().eq("id", serverId);
    if (result.isEmpty) return null;
    return ClipCollection.fromJson(result[0]);
  }
}
