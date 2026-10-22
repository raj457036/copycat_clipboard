import 'package:clipboard/base/background/encryption_worker.dart';
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/base/domain/repositories/clipboard.dart';
import 'package:clipboard/base/domain/repositories/sync_outbox.dart';
import 'package:clipboard/base/domain/sources/clipboard.dart';
import 'package:clipboard/base/domain/model/sync/sync_outbox_entry.dart';
import 'package:clipboard/base/enums/clip_type.dart';
import 'package:clipboard/base/enums/sort.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/paginated_results.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Named("remote")
@LazySingleton(as: ClipboardRepository)
class ClipboardRepositoryCloudImpl implements ClipboardRepository {
  final ClipboardSource remote;

  ClipboardRepositoryCloudImpl(@Named("remote") this.remote);

  Future<ClipboardItem> _encryptForUpload(ClipboardItem item) async {
    if (!item.encrypted &&
        await EncryptionWorker.instance.isEncryptionUnavailable()) {
      throw encryptionUnavailableFailure;
    }
    return item.encrypt();
  }

  @override
  FailureOr<ClipboardItem> create(ClipboardItem item) async {
    try {
      item = item.copyWith(modified: systemTime());
      final encrypted = await _encryptForUpload(item);
      final result = await remote.create(encrypted);
      final clip = item.copyWith(
        serverId: result.serverId,
        lastSynced: result.lastSynced,
      );
      return Right(clip);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<PaginatedResult<ClipboardItem>> getList({
    int limit = 50,
    int offset = 0,
    String? search,
    Set<TextCategory>? category,
    Set<ClipItemType>? types,
    int? collectionId,
    int? serverCollectionId,
    ClipboardSortKey? sortBy,
    SortOrder order = SortOrder.desc,
    DateTime? from,
    DateTime? to,
    bool? encrypted,
  }) async {
    try {
      final result = await remote.getList(
        limit: limit,
        offset: offset,
        collectionId: collectionId,
        serverCollectionId: serverCollectionId,
        sortBy: sortBy,
        order: order,
        search: search,
        types: types,
        textCategories: category,
        from: from,
        to: to,
      );
      final decryptedItems = await Future.wait(
        result.results.map((e) => e.locked ? Future.value(e) : e.decrypt()),
      );

      return Right(
        PaginatedResult(results: decryptedItems, hasMore: result.hasMore),
      );
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<ClipboardItem> update(ClipboardItem item) async {
    try {
      final encrypted = await _encryptForUpload(item);
      await remote.update(encrypted);
      final clip = item.copyWith(lastSynced: systemTime());
      return Right(clip);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<bool> delete(ClipboardItem item, {bool soft = false}) async {
    try {
      await remote.delete(item);
      return const Right(true);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<void> deleteAll() async {
    // no-op
    return const Right(null);
  }

  @override
  FailureOr<ClipboardItem?> get({int? id, int? serverId}) async {
    try {
      final result = await remote.get(serverId: serverId);
      final decrypted = result?.locked == true
          ? result
          : await result?.decrypt();
      return Right(decrypted);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<ClipboardItem?> getLatestFromOthers({bool? synced}) {
    throw UnimplementedError();
  }

  @override
  FailureOr<int> fetchEncryptedCount() {
    throw UnimplementedError();
  }

  @override
  FailureOr<List<ClipboardItem>> deleteMany(List<ClipboardItem> items) async {
    try {
      final deleted = await remote.deleteMany(items);
      return Right(deleted);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<(ClipboardItem, bool)> updateOrCreate(ClipboardItem item) {
    throw UnimplementedError();
  }

  @override
  FailureOr<void> deleteAllEncrypted() async {
    try {
      await remote.deleteAllEncrypted();
      return const Right(null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<int> getClipCounts([DateTime? fromTs]) async {
    try {
      final count = await remote.getClipCounts(fromTs);
      return Right(count);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<List<ClipboardItem>> updateAll(List<ClipboardItem> items) async {
    try {
      final encryptedUpdates = await Future.wait(items.map(_encryptForUpload));

      final result = await remote.updateAll(encryptedUpdates);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}

@Named("local")
@LazySingleton(as: ClipboardRepository)
class ClipboardRepositoryOfflineImpl implements ClipboardRepository {
  static const _copyCountSyncThreshold = 10;

  final ClipboardSource local;
  final SyncOutboxRepository outbox;

  ClipboardRepositoryOfflineImpl(@Named("local") this.local, this.outbox);

  @override
  FailureOr<ClipboardItem> create(ClipboardItem item) async {
    try {
      final result = await local.create(item);
      var queued = false;
      if (result.id != null) {
        await outbox.enqueue(
          SyncOutboxEntry(
            entityType: SyncEntityType.clip,
            localId: result.id!,
            action: SyncOutboxAction.create,
            createdAt: systemTime(),
          ),
        );
        queued = true;
      }
      return Right(result.copyWith(isQueued: queued));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<PaginatedResult<ClipboardItem>> getList({
    int limit = 50,
    int offset = 0,
    String? search,
    Set<TextCategory>? category,
    Set<ClipItemType>? types,
    int? collectionId,
    int? serverCollectionId,
    ClipboardSortKey? sortBy,
    SortOrder order = SortOrder.desc,
    DateTime? from,
    DateTime? to,
    bool? encrypted,
  }) async {
    try {
      final result = await local.getList(
        limit: limit,
        offset: offset,
        search: search,
        types: types,
        textCategories: category,
        collectionId: collectionId,
        serverCollectionId: serverCollectionId,
        sortBy: sortBy,
        order: order,
        from: from,
        to: to,
        encrypted: encrypted,
      );

      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<ClipboardItem> update(ClipboardItem item) async {
    try {
      ClipboardItem? previous;
      if (item.id != null) {
        previous = await local.get(id: item.id);
      }

      if (item.locked && !item.encrypted) {
        item = await item.encrypt();
      }

      ClipboardItem result = await local.update(item);

      var queued = false;

      final shouldEnqueue = _shouldEnqueueUpdate(
        previous,
        result,
        forceSync: item.userIntent,
      );
      if (result.id != null && shouldEnqueue) {
        await outbox.enqueue(
          SyncOutboxEntry(
            entityType: SyncEntityType.clip,
            localId: result.id!,
            action: SyncOutboxAction.update,
            createdAt: systemTime(),
          ),
        );
        queued = true;
      }

      return Right(result.copyWith(isQueued: queued));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  bool _shouldEnqueueUpdate(
    ClipboardItem? previous,
    ClipboardItem next, {
    bool forceSync = false,
  }) {
    if (forceSync) return true;
    if (previous == null) return true;

    final hasSyncRelevantChanges = _isSyncRelevantUpdate(previous, next);
    if (hasSyncRelevantChanges) return true;

    final crossedCopySyncThreshold = _didCrossCopySyncThreshold(previous, next);
    if (crossedCopySyncThreshold) return true;

    return false;
  }

  bool _didCrossCopySyncThreshold(ClipboardItem previous, ClipboardItem next) {
    final statsChanged =
        previous.copiedCount != next.copiedCount ||
        previous.lastCopied != next.lastCopied;
    if (!statsChanged) return false;

    final prevBucket = previous.copiedCount ~/ _copyCountSyncThreshold;
    final nextBucket = next.copiedCount ~/ _copyCountSyncThreshold;
    return next.copiedCount > 0 && nextBucket > prevBucket;
  }

  bool _isSyncRelevantUpdate(ClipboardItem previous, ClipboardItem next) {
    return previous.serverId != next.serverId ||
        previous.modified != next.modified ||
        previous.deletedAt != next.deletedAt ||
        (previous.text != next.text && !previous.encrypted) ||
        previous.richData != next.richData ||
        previous.url != next.url ||
        previous.title != next.title ||
        previous.description != next.description ||
        previous.textCategory != next.textCategory ||
        previous.fileName != next.fileName ||
        previous.fileMimeType != next.fileMimeType ||
        previous.fileExtension != next.fileExtension ||
        previous.driveFileId != next.driveFileId ||
        previous.fileSize != next.fileSize ||
        previous.imgBlurHash != next.imgBlurHash ||
        previous.sourceUrl != next.sourceUrl ||
        previous.sourceApp != next.sourceApp ||
        previous.sourceId != next.sourceId ||
        previous.serverCollectionId != next.serverCollectionId ||
        previous.collectionId != next.collectionId ||
        previous.localOnly != next.localOnly ||
        previous.originId != next.originId ||
        previous.locked != next.locked;
  }

  @override
  FailureOr<bool> delete(ClipboardItem item, {bool soft = true}) async {
    try {
      await local.delete(item, soft: soft);
      if (item.id != null) {
        await outbox.enqueue(
          SyncOutboxEntry(
            entityType: SyncEntityType.clip,
            localId: item.id!,
            action: SyncOutboxAction.delete,
            createdAt: systemTime(),
          ),
        );
      }
      return const Right(true);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<List<ClipboardItem>> deleteMany(List<ClipboardItem> items) async {
    try {
      final deleted = await local.deleteMany(items, soft: true);
      for (var item in items) {
        if (item.id == null) continue;

        await outbox.enqueue(
          SyncOutboxEntry(
            entityType: SyncEntityType.clip,
            localId: item.id!,
            action: SyncOutboxAction.delete,
            createdAt: systemTime(),
          ),
        );
      }
      return Right(deleted);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<void> deleteAll() async {
    try {
      await local.deleteAll(soft: false);
      return const Right(null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<ClipboardItem?> get({int? id, int? serverId}) async {
    try {
      final result = await local.get(id: id, serverId: serverId);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<ClipboardItem?> getLatestFromOthers({bool? synced}) async {
    try {
      final result = await local.getLatestFromOthers(synced: synced);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<int> fetchEncryptedCount() async {
    try {
      final count = await local.fetchEncryptedCount();
      return Right(count);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<(ClipboardItem, bool)> updateOrCreate(ClipboardItem item) async {
    try {
      final result = await local.updateOrCreate(item);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<void> deleteAllEncrypted() async {
    // no-op
    return const Right(null);
  }

  @override
  FailureOr<int> getClipCounts([DateTime? fromTs]) async {
    try {
      final result = await local.getClipCounts();
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<List<ClipboardItem>> updateAll(List<ClipboardItem> items) async {
    try {
      final result = await local.updateAll(items);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
