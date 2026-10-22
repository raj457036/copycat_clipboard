part of 'app_config_cubit.dart';

mixin AppConfigE2EEMixin on Cubit<AppConfigState> {
  static const String _enc2SecureStorageKey = 'copycat.enc2';

  final SecureStore _secureStorage = const SecureStore();
  bool _hasStoredE2EEKey = false;
  bool _keychainReadFailed = false;

  AppConfigRepository get repo;

  bool get isE2EESetupDone => _hasStoredE2EEKey;

  Future<void> _migrateLegacyEnc2ToSecureStorage(AppConfig config) async {
    final legacyEnc2 = config.enc2;
    if (legacyEnc2 == null) return;

    try {
      final secureEnc2 = await _readStoredE2EEKey();

      if (secureEnc2 == null) {
        await _writeStoredE2EEKey(legacyEnc2);
        logger.i('Migrated legacy enc2 key to secure storage.');
      }

      final sanitizedConfig = config.copyWith(enc2: null);
      emit(state.copyWith(config: sanitizedConfig));
      await repo.update(sanitizedConfig);
    } catch (e) {
      _keychainReadFailed = true;
      logger.e('Failed to migrate legacy enc2 key: $e');
    }
  }

  /// Keeps the last known value when the keychain can't be read, so a locked
  /// keychain is never mistaken for a missing key.
  Future<void> _refreshE2EEKeyPresence() async {
    _keychainReadFailed = false;
    try {
      _hasStoredE2EEKey = (await _readE2EEKey()) != null;
    } catch (e) {
      logger.w('Unable to read E2EE key from secure storage: $e');
    }
  }

  Future<String?> _readE2EEKey() async {
    final legacyEnc2 = state.config.enc2;
    try {
      return await _readStoredE2EEKey() ?? legacyEnc2;
    } catch (e) {
      _keychainReadFailed = true;
      if (legacyEnc2 == null) rethrow;
      logger.w('Secure storage unreadable, using legacy E2EE key: $e');
      return legacyEnc2;
    }
  }

  /// Re-reads the E2EE key if an earlier keychain read failed (e.g. the
  /// keychain was locked at launch). Returns true if the key is now available.
  Future<bool> retryE2EEKeyReadIfFailed() async {
    if (!_keychainReadFailed) return false;
    await _migrateLegacyEnc2ToSecureStorage(state.config);
    await _refreshE2EEKeyPresence();
    return !_keychainReadFailed && _hasStoredE2EEKey;
  }

  Future<String?> _readStoredE2EEKey() {
    return _secureStorage.read(key: _enc2SecureStorageKey);
  }

  Future<void> _writeStoredE2EEKey(String value) {
    return _secureStorage.write(key: _enc2SecureStorageKey, value: value);
  }

  Future<void> _clearStoredE2EEKey() async {
    return _secureStorage.delete(key: _enc2SecureStorageKey);
  }

  Future<String?> getE2EEKey() {
    return _readE2EEKey();
  }

  Future<String?> decryptEnc2(String? enc1) async {
    if (enc1 == null) return null;
    final String? enc2;
    try {
      enc2 = await _readE2EEKey();
    } catch (e) {
      logger.e('Failed to read E2EE key from secure storage: $e');
      return null;
    }
    if (enc2 == null) return null;

    try {
      final secret = EncryptionSecret.deserilize(enc2);
      final encMngr = EncryptionManager(secret);
      return encMngr.decrypt(enc1);
    } catch (e) {
      logger.e('Failed to decrypt enc1 using stored enc2 key: $e');
      return null;
    }
  }

  Future<void> setE2EEKey(String? key) async {
    _keychainReadFailed = false;
    if (key == null) {
      await _clearStoredE2EEKey();
      _hasStoredE2EEKey = false;
    } else {
      await _writeStoredE2EEKey(key);
      _hasStoredE2EEKey = true;
    }

    // Force-clear legacy plaintext persistence in AppConfig.
    if (state.config.enc2 != null) {
      final newConfig = state.config.copyWith(enc2: null);
      emit(state.copyWith(config: newConfig));
      await repo.update(newConfig);
    } else {
      emit(state.copyWith());
    }
  }
}
