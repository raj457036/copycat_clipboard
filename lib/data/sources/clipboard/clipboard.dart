import 'package:clipboard/common/paginated_results.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';

abstract class ClipboardSource {
  Future<ClipboardItem> create(ClipboardItem item);

  Future<PaginatedResult<ClipboardItem>> getList({
    int limit = 50,
    int offset = 0,
    String? search,
  });

  Future<ClipboardItem> update(ClipboardItem item);

  Future<bool> delete(ClipboardItem item);

  Future<void> deleteAll();
}
