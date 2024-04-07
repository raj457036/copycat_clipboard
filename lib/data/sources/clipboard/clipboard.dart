import 'package:clipboard/db/clipboard_item/clipboard_item.dart';

abstract class ClipboardSource {
  Future<ClipboardItem> create(ClipboardItem item);

  Future<List<ClipboardItem>> getList({int limit = 50, int offset = 0});

  Future<ClipboardItem> update(ClipboardItem item);

  Future<bool> delete(ClipboardItem item);
}
