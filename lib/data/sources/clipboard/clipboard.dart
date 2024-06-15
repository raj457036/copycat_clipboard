import 'package:clipboard/common/paginated_results.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/enums/sort.dart';

enum ClipboardSortKey {
  created,
  modified,
  lastCopied,
  copyCount,
}

abstract class ClipboardSource {
  Future<ClipboardItem?> get({int? id, String? serverId});
  Future<ClipboardItem> create(ClipboardItem item);

  Future<PaginatedResult<ClipboardItem>> getList({
    int limit = 50,
    int offset = 0,
    String? search,
    List<String>? category,
    List<ClipItemType>? types,
    int? collectionId,
    ClipboardSortKey? sortBy,
    SortOrder order = SortOrder.desc,
  });

  Future<ClipboardItem> update(ClipboardItem item);

  Future<bool> delete(ClipboardItem item);

  Future<void> deleteAll();

  Future<ClipboardItem?> getLatest();

  Future<void> decryptPending();
}
