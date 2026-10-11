import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/base/enums/clip_type.dart';
import 'package:clipboard/base/enums/sort.dart';
import 'package:clipboard/common/paginated_results.dart';

enum ClipboardSortKey { modified, created, lastCopied, copyCount }

abstract class ClipboardSource {
  Future<ClipboardItem?> get({int? id, int? serverId});
  Future<ClipboardItem> create(ClipboardItem item);

  Future<PaginatedResult<ClipboardItem>> getList({
    int limit = 50,
    int offset = 0,
    String? search,
    Set<TextCategory>? textCategories,
    Set<ClipItemType>? types,
    int? collectionId,
    int? serverCollectionId,
    ClipboardSortKey? sortBy,
    SortOrder order = SortOrder.desc,
    DateTime? from,
    DateTime? to,
    bool? encrypted,
  });

  Future<ClipboardItem> update(ClipboardItem item);
  Future<List<ClipboardItem>> updateAll(List<ClipboardItem> items);

  Future<(ClipboardItem, bool)> updateOrCreate(ClipboardItem item);

  Future<bool> delete(ClipboardItem item, {bool soft = true});
  Future<List<ClipboardItem>> deleteMany(
    List<ClipboardItem> items, {
    bool soft = true,
  });

  Future<void> deleteAll({bool soft = true});

  Future<ClipboardItem?> getLatestFromOthers({bool? synced});

  Future<int> fetchEncryptedCount();

  Future<void> deleteAllEncrypted();

  Future<int> getClipCounts([DateTime? fromTs]);
}
