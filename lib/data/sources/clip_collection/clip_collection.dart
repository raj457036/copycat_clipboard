import 'package:clipboard/common/paginated_results.dart';
import 'package:clipboard/db/clip_collection/clipcollection.dart';

abstract class ClipCollectionSource {
  Future<ClipCollection?> get({int? id, int? serverId});
  Future<ClipCollection> create(ClipCollection collection);

  Future<PaginatedResult<ClipCollection>> getList({
    int limit = 50,
    int offset = 0,
    String? search,
  });

  Future<ClipCollection> update(ClipCollection collection);

  Future<bool> delete(ClipCollection collection);

  Future<void> deleteAll();
}
