import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure storage that stays readable while the screen is locked.
///
/// Apple keychain lookups match on accessibility, so items saved with the
/// package default (`WhenUnlocked`) are moved over on first read. The plugin's
/// delete ignores accessibility, so it also clears those old items.
class SecureStore {
  const SecureStore();

  static const _storage = FlutterSecureStorage(
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
    mOptions: MacOsOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  static bool get _isApple =>
      defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.macOS;

  Future<String?> read({required String key}) async {
    final value = await _storage.read(key: key);
    if (value != null || !_isApple) return value;

    const legacyStorage = FlutterSecureStorage();
    final legacy = await legacyStorage.read(key: key);
    if (legacy == null) return null;
    try {
      await write(key: key, value: legacy);
    } catch (_) {
      await legacyStorage.write(key: key, value: legacy);
      rethrow;
    }
    return legacy;
  }

  /// An old item with the same key blocks the add (errSecDuplicateItem), so
  /// it's removed first.
  Future<void> write({required String key, required String value}) async {
    if (_isApple) await _storage.delete(key: key);
    await _storage.write(key: key, value: value);
  }

  Future<void> delete({required String key}) => _storage.delete(key: key);

  Future<void> deleteAll() => _storage.deleteAll();
}
