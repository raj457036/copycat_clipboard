import 'package:clipboard/common/paginated_results.dart';
import 'package:clipboard/data/sources/clip_collection/clip_collection.dart';
import 'package:clipboard/db/clip_collection/clipcollection.dart';
import 'package:clipboard/utils/network_status.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Named("remote")
@LazySingleton(as: ClipCollectionSource)
class RemoteClipCollectionSource implements ClipCollectionSource {
  final SupabaseClient client;
  final String table = "clipboard_items";

  final NetworkStatus network;

  RemoteClipCollectionSource(
    this.client,
    this.network,
  );

  PostgrestClient get db => client.rest;

  @override
  Future<ClipCollection> create(ClipCollection collection) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(ClipCollection collection) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<PaginatedResult<ClipCollection>> getList(
      {int limit = 50, int offset = 0, String? search}) {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  Future<ClipCollection> update(ClipCollection collection) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
