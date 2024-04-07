import 'package:appwrite/appwrite.dart';
import 'package:clipboard/data/sources/clipboard/clipboard.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:injectable/injectable.dart';

@Named("remote")
@LazySingleton(as: ClipboardSource)
class RemoteClipboardSource implements ClipboardSource {
  final Databases db;
  final String databaseId;
  final String collectionId;

  RemoteClipboardSource(
    this.db,
    @Named("databaseId") this.databaseId,
    @Named("clipboardCollectionId") this.collectionId,
  );

  @override
  Future<ClipboardItem> create(ClipboardItem item) async {
    final doc = await db.createDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: ID.unique(),
      data: item.toJson(),
      permissions: [
        Permission.read(Role.user(item.userId)),
        Permission.write(Role.user(item.userId)),
      ],
    );
    return item.copyWith(
      lastSynced: DateTime.now(),
      serverId: doc.$id,
    );
  }

  @override
  Future<List<ClipboardItem>> getList({
    int limit = 50,
    int offset = 0,
    DateTime? afterDate,
  }) async {
    final items = await db.listDocuments(
      databaseId: databaseId,
      collectionId: collectionId,
      queries: [
        Query.orderDesc('\$updatedAt'),
        Query.limit(limit),
        Query.offset(offset),
      ],
    );

    final clips =
        items.documents.map((e) => ClipboardItem.fromJson(e.data)).toList();

    return clips;
  }

  @override
  Future<ClipboardItem> update(ClipboardItem item) async {
    if (item.serverId == null) {
      return await create(item);
    }

    final doc = await db.updateDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: item.serverId!,
      data: item.toJson(),
    );
    return item.copyWith(
      lastSynced: DateTime.now(),
      serverId: doc.$id,
    );
  }

  @override
  Future<bool> delete(ClipboardItem item) async {
    if (item.serverId == null) {
      return true;
    }

    await db.deleteDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: item.serverId!,
    );
    return true;
  }
}
