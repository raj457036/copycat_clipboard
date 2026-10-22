import 'package:clipboard/common/secure_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Keychain fake that mirrors the Apple plugin: reads match on accessibility,
/// deletes ignore it, and adding a key that exists under another
/// accessibility fails with errSecDuplicateItem (-25299).
class _FakeKeychain {
  final items = <String, (String, String)>{};
  final lockedAccessibility = <String>{};
  final failWritesFor = <String>{};

  static String _acc(Map args) =>
      (args['options'] as Map)['accessibility'] as String? ?? 'unlocked';

  Future<Object?> handle(MethodCall call) async {
    final args = call.arguments as Map;
    final acc = _acc(args);
    final key = args['key'] as String?;
    final existing = key == null ? null : items[key];
    switch (call.method) {
      case 'read':
        if (lockedAccessibility.contains(acc)) {
          throw PlatformException(code: '-25308');
        }
        return existing?.$1 == acc ? existing!.$2 : null;
      case 'write':
        if (failWritesFor.contains(acc)) throw PlatformException(code: 'write failed');
        if (existing != null && existing.$1 != acc) {
          throw PlatformException(code: '-25299');
        }
        items[key!] = (acc, args['value'] as String);
      case 'delete':
        items.remove(key);
      case 'deleteAll':
        items.clear();
    }
    return null;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('plugins.it_nomads.com/flutter_secure_storage');
  const store = SecureStore();
  late _FakeKeychain keychain;

  setUp(() {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    keychain = _FakeKeychain();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, keychain.handle);
  });

  tearDown(() => debugDefaultTargetPlatformOverride = null);

  test('writes with first-unlock accessibility', () async {
    await store.write(key: 'k', value: 'v');
    expect(keychain.items, {'k': ('first_unlock_this_device', 'v')});
    expect(await store.read(key: 'k'), 'v');
  });

  test('moves items stored with the old default on first read', () async {
    keychain.items['k'] = ('unlocked', 'old');

    expect(await store.read(key: 'k'), 'old');
    expect(keychain.items, {'k': ('first_unlock_this_device', 'old')});
  });

  test('keeps the old item when moving it fails', () async {
    keychain.items['k'] = ('unlocked', 'old');
    keychain.failWritesFor.add('first_unlock_this_device');

    await expectLater(store.read(key: 'k'), throwsA(isA<PlatformException>()));
    expect(keychain.items, {'k': ('unlocked', 'old')});
  });

  test('write replaces an item stored with the old default', () async {
    keychain.items['k'] = ('unlocked', 'old');

    await store.write(key: 'k', value: 'new');
    expect(keychain.items, {'k': ('first_unlock_this_device', 'new')});
  });

  test('reads moved items while the old store is locked', () async {
    keychain.items['k'] = ('unlocked', 'old');
    await store.read(key: 'k');

    keychain.lockedAccessibility.add('unlocked');
    expect(await store.read(key: 'k'), 'old');
  });

  test('a not-yet-moved item still fails while locked', () async {
    keychain.items['k'] = ('unlocked', 'old');
    keychain.lockedAccessibility.add('unlocked');

    expect(store.read(key: 'k'), throwsA(isA<PlatformException>()));
    expect(keychain.items, {'k': ('unlocked', 'old')});
  });

  test('delete and deleteAll remove old and new items', () async {
    keychain.items['a'] = ('unlocked', '1');
    keychain.items['b'] = ('first_unlock_this_device', '2');
    await store.delete(key: 'a');
    await store.delete(key: 'b');
    expect(keychain.items, isEmpty);

    keychain.items['c'] = ('unlocked', '1');
    keychain.items['d'] = ('first_unlock_this_device', '2');
    await store.deleteAll();
    expect(keychain.items, isEmpty);
  });
}
