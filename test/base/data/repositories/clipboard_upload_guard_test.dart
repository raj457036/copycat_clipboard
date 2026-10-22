import 'package:clipboard/base/background/encryption_worker.dart';
import 'package:clipboard/base/data/repositories/clipboard.dart';
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/base/domain/sources/clipboard.dart';
import 'package:clipboard/base/enums/clip_type.dart';
import 'package:clipboard/base/enums/platform_os.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter_test/flutter_test.dart';

class _RecordingSource implements ClipboardSource {
  final uploaded = <ClipboardItem>[];

  @override
  Future<ClipboardItem> create(ClipboardItem item) async {
    uploaded.add(item);
    return item.copyWith(serverId: 1);
  }

  @override
  Future<ClipboardItem> update(ClipboardItem item) async {
    uploaded.add(item);
    return item;
  }

  @override
  Future<List<ClipboardItem>> updateAll(List<ClipboardItem> items) async {
    uploaded.addAll(items);
    return items;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

ClipboardItem _item({bool encrypted = false}) => ClipboardItem(
  id: 1,
  created: systemTime(),
  modified: systemTime(),
  type: ClipItemType.text,
  userId: 'user-1',
  os: PlatformOS.macos,
  encrypted: encrypted,
  text: 'secret',
);

void main() {
  late _RecordingSource source;
  late ClipboardRepositoryCloudImpl repo;
  final worker = EncryptionWorker.instance;

  setUp(() {
    source = _RecordingSource();
    repo = ClipboardRepositoryCloudImpl(source);
  });

  tearDown(() {
    worker.dispose();
    worker.setEncryption(false);
  });

  test('blocks uploads when encryption is on but the worker is down', () async {
    worker.setEncryption(true);

    final created = await repo.create(_item());
    final updated = await repo.update(_item());
    final updatedAll = await repo.updateAll([_item()]);

    for (final result in [created, updated, updatedAll]) {
      expect(
        result.fold((l) => l.code, (_) => null),
        encryptionUnavailableFailure.code,
      );
    }
    expect(source.uploaded, isEmpty);
  });

  test('blocks uploads when the worker could not get a key', () async {
    worker.setEncryption(true);
    await worker.start(Future.value(null));

    final result = await repo.create(_item());
    expect(result.isLeft(), isTrue);
    expect(source.uploaded, isEmpty);
  });

  test('uploads already-encrypted items while the worker is down', () async {
    worker.setEncryption(true);

    final result = await repo.update(_item(encrypted: true));
    expect(result.isRight(), isTrue);
    expect(source.uploaded, hasLength(1));
  });

  test('uploads as before when encryption is off', () async {
    final result = await repo.create(_item());
    expect(result.isRight(), isTrue);
    expect(source.uploaded.single.text, 'secret');
  });
}
