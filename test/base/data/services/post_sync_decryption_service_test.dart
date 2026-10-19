import 'package:clipboard/base/background/encryption_worker.dart';
import 'package:clipboard/base/constants/misc.dart';
import 'package:clipboard/base/data/services/post_sync_decryption_service.dart';
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/base/enums/clip_type.dart';
import 'package:clipboard/base/enums/platform_os.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter_test/flutter_test.dart';

ClipboardItem _createItem({
  required int id,
  bool encrypted = false,
  bool locked = false,
  String? text,
  ClipItemType type = ClipItemType.text,
}) {
  return ClipboardItem(
    id: id,
    serverId: id,
    created: systemTime(),
    modified: systemTime(),
    type: type,
    userId: 'user-1',
    os: PlatformOS.macos,
    encrypted: encrypted,
    locked: locked,
    text: text ?? 'sample text',
  );
}

void main() {
  tearDown(() {
    EncryptionWorker.instance.dispose();
  });

  test(
    'decryptBatch returns items untouched if none are encrypted',
    () async {
      final items = [
        _createItem(id: 1, encrypted: false, text: 'Hello'),
        _createItem(id: 2, encrypted: false, text: 'World'),
      ];

      final result = await PostSyncDecryptionService.decryptBatch(items);

      expect(result.length, 2);
      expect(result[0].text, 'Hello');
      expect(result[1].text, 'World');
    },
  );

  test(
    'decryptBatch clears encrypted flag when decryption fails',
    () async {
      final worker = EncryptionWorker.instance;
      await worker.start('0123456789abcdef-+-AAAAAAAAAAAAAAAAAAAAAA==');
      worker.setDecryption(true);
      final item = _createItem(
        id: 3,
        encrypted: true,
        text: '{not encrypted}',
      );
      final lockedItem = _createItem(
        id: 4,
        encrypted: true,
        locked: true,
        text: '{locked content}',
      );

      final result = await PostSyncDecryptionService.decryptBatch([
        item,
        lockedItem,
      ]);

      expect(result[0].text, '{not encrypted}');
      expect(result[0].encrypted, isFalse);
      expect(result[1].text, '{locked content}');
      expect(result[1].encrypted, isTrue);
      expect(result[1].locked, isTrue);
    },
  );

  test(
    'decryptBatch skips locked or oversized text items',
    () async {
      final worker = EncryptionWorker.instance;
      await worker.start('0123456789abcdef-+-AAAAAAAAAAAAAAAAAAAAAA==');
      worker.setDecryption(true);
      final largeText = 'A' * (kMaxTextClipLength + 10);
      final items = [
        _createItem(id: 1, encrypted: true, locked: true, text: 'enc1'),
        _createItem(id: 2, encrypted: true, text: largeText),
      ];

      final result = await PostSyncDecryptionService.decryptBatch(items);

      expect(result.length, 2);
      expect(result[0].locked, true);
      expect(result[0].encrypted, true);
      expect(result[1].text, largeText);
      expect(result[1].encrypted, true);
    },
  );
}
