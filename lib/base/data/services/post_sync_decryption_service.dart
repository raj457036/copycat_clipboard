import 'package:clipboard/base/background/encryption_worker.dart';
import 'package:clipboard/base/constants/misc.dart' show kMaxTextClipLength;
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/base/domain/sources/clipboard.dart';
import 'package:clipboard/common/logging.dart';
import 'package:injectable/injectable.dart';

/// Runs decryption passes over locally stored or in-flight encrypted clips.
@lazySingleton
class PostSyncDecryptionService {
  static const _batchSize = 50;
  static const _logger = AppLogger.scoped('PostSyncDecryptionService');

  final ClipboardSource _localSource;

  PostSyncDecryptionService(@Named("local") this._localSource);

  /// Check if the encryption worker is ready for decryption tasks.
  bool get canDecrypt => isDecryptionActive;

  /// Check if the encryption worker is active and ready for decryption.
  static bool get isDecryptionActive {
    final worker = EncryptionWorker.instance;
    return worker.isRunning && worker.isDecryptionActive;
  }

  /// Decrypts a batch of clipboard items in parallel in-memory if decryption is active.
  /// Items that are not encrypted, are locked, or exceed [kMaxTextClipLength] are untouched.
  static Future<List<ClipboardItem>> decryptBatch(
    List<ClipboardItem> items,
  ) async {
    if (!isDecryptionActive) return items;
    final hasEncrypted = items.any((e) => e.encrypted && !e.locked);
    if (!hasEncrypted) return items;

    return await Future.wait(
      items.map((item) async {
        if (!item.encrypted || item.locked) return item;
        if ((item.text?.length ?? 0) > kMaxTextClipLength) {
          _logger.d(
            () =>
                "Skipping decryption for id=${item.serverId} due to large text length (${item.text?.length})",
          );
          return item;
        }

        try {
          return await item.decrypt();
        } catch (e, st) {
          _logger.w(
            () =>
                'Decrypt failed for id=${item.serverId}; keeping content and clearing encrypted flag: $e',
            error: e,
            stackTrace: st,
          );
          return item.copyWith(encrypted: false);
        }
      }),
    );
  }

  /// Decrypts all locally stored encrypted clips, batch by batch.
  ///
  /// [onProgress] is called after each item with `(decrypted, total)` so the
  /// caller can update a progress indicator incrementally.
  Future<void> decryptAll({
    void Function(int decrypted, int total)? onProgress,
  }) async {
    if (!EncryptionWorker.instance.isRunning) {
      _logger.w(() => "Decryption worker is not active, skipping decryption");
      return;
    }
    final total = await _localSource.fetchEncryptedCount();
    if (total == 0) return;

    int decrypted = 0;
    int offset = 0;

    while (true) {
      final page = await _localSource.getList(
        limit: _batchSize,
        offset: offset,
        encrypted: true,
      );

      if (page.results.isEmpty) break;

      final decryptedResults = await decryptBatch(page.results);
      final toUpdate = <ClipboardItem>[];

      for (int i = 0; i < page.results.length; i++) {
        final orig = page.results[i];
        final dec = decryptedResults[i];
        if (!dec.encrypted && dec != orig) {
          toUpdate.add(dec);
        }
        decrypted++;
        onProgress?.call(decrypted, total);
      }

      if (toUpdate.isNotEmpty) {
        try {
          await _localSource.updateAll(toUpdate);
        } catch (e, st) {
          _logger.w(
            () => 'Batch save failed during decryptAll: $e',
            error: e,
            stackTrace: st,
          );
        }
      }

      if (!page.hasMore) break;
    }
  }
}
