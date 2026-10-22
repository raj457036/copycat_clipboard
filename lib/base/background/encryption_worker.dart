import 'dart:async';
import 'dart:convert' as convert;
import 'dart:isolate' show TransferableTypedData;
import 'dart:math' show Random, min;

import 'package:clipboard/common/logging.dart' show AppLogger;
import 'package:clipboard/utils/utility.dart' show dud;
import 'package:easy_worker/easy_worker.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:flutter/foundation.dart';
import 'package:pointycastle/export.dart';
import 'package:synchronized/synchronized.dart' show Lock;

class EncryptionMode {
  static const String gcm = "GCM";
  static const String cfb = "CFB";
}

enum EncDecType { encrypt, decrypt, ping }

typedef EncryptionPayload = ({
  TransferableTypedData content,
  String? customIV,
  String? mode,
  EncDecType action,
});

typedef EncryptionResponse = ({
  bool success,
  TransferableTypedData? content,
  String? message,
  String? code,
});

final _lock = Lock();
const int _gcmMacBits = 128;
const int _gcmMacBytes = _gcmMacBits ~/ 8;
const int _cfbBlockBytes = 8;
const int _cryptoChunkSize = 64 * 1024;
final Uint8List _emptyBytes = Uint8List(0);
final Random _secureRandom = Random.secure();

Uint8List? _workerKeyBytes;
Uint8List? _workerDefaultIVBytes;

Future<void> _initializeWorkerSecret(Object? serialized) async {
  if (serialized is! String) {
    throw EncryptionException("Secret is not set", code: "invalid-secret");
  }

  final (secretValue, initValue) = _deserializeSecret(serialized);
  _workerKeyBytes = Uint8List.fromList(convert.utf8.encode(secretValue));
  _workerDefaultIVBytes = Uint8List.fromList(convert.base64.decode(initValue));
}

Future<void> _encryptorEntryPoint(
  EncryptionPayload payload,
  Sender send,
) async {
  try {
    final content = payload.content.materialize().asUint8List();
    if (payload.action == EncDecType.ping) {
      send((
        success: true,
        content: TransferableTypedData.fromList([_emptyBytes]),
        message: null,
        code: null,
      ));
      return;
    }

    final mode = payload.mode == EncryptionMode.gcm
        ? EncryptionMode.gcm
        : EncryptionMode.cfb;
    final ivBytes = _resolveWorkerIVBytes(mode, payload.customIV);

    final result = switch ((mode, payload.action)) {
      (EncryptionMode.gcm, EncDecType.encrypt) => _processGCM(
        content,
        encrypt: true,
        ivBytes: ivBytes,
      ),
      (EncryptionMode.gcm, EncDecType.decrypt) => _processGCM(
        content,
        encrypt: false,
        ivBytes: ivBytes,
      ),
      (EncryptionMode.cfb, EncDecType.encrypt) => await _processCFB(
        content,
        encrypt: true,
        ivBytes: ivBytes,
      ),
      (EncryptionMode.cfb, EncDecType.decrypt) => await _processCFB(
        content,
        encrypt: false,
        ivBytes: ivBytes,
      ),
      _ => throw EncryptionException(
        "Unsupported action ${payload.action.name}",
        code: "invalid-action",
      ),
    };

    send((
      success: true,
      content: TransferableTypedData.fromList([result]),
      message: null,
      code: null,
    ));
  } on EncryptionException catch (error) {
    send((
      success: false,
      content: null,
      message: error.message,
      code: error.code,
    ));
  } on DecryptionException catch (error) {
    send((
      success: false,
      content: null,
      message: error.message,
      code: error.code,
    ));
  } catch (error) {
    final message = error.toString();
    send((
      success: false,
      content: null,
      message: message,
      code: "unexpected-error",
    ));
  }
}

Future<void> _encryptorWorkerEntryPoint(
  MessageWithID<EncryptionPayload> message,
  Sender send,
) async {
  final (id, payload) = message;
  await _encryptorEntryPoint(payload, (response) {
    send((id, response));
  });
}

Uint8List _resolveWorkerIVBytes(String mode, String? customIV) {
  if (customIV == null) {
    final defaultIVBytes = _workerDefaultIVBytes;
    if (defaultIVBytes == null) {
      throw EncryptionException(
        "Worker is not initialized",
        code: "invalid-secret",
      );
    }
    return Uint8List.fromList(defaultIVBytes);
  }

  final decoded = Uint8List.fromList(convert.base64.decode(customIV));
  if (mode == EncryptionMode.cfb && decoded.length != 16) {
    throw EncryptionException("CFB requires a 16-byte IV", code: "invalid-iv");
  }
  return decoded;
}

Iterable<Uint8List> chunkBytes(Uint8List data, int chunkSize) sync* {
  for (int i = 0; i < data.length; i += chunkSize) {
    final end = (i + chunkSize < data.length) ? i + chunkSize : data.length;

    yield Uint8List.sublistView(data, i, end);
  }
}

(Uint8List, Uint8List) prepareBuffers(Uint8List input, int blockSize) {
  final remainder = input.length % blockSize;

  if (remainder == 0) {
    return (input, Uint8List(input.length));
  }

  // Pad input to next block boundary
  final paddedLength = input.length + (blockSize - remainder);

  final paddedInput = Uint8List(paddedLength);

  paddedInput.setRange(0, input.length, input);

  return (paddedInput, Uint8List(paddedLength));
}

Future<Uint8List> _processCFB(
  Uint8List input, {
  required bool encrypt,
  required Uint8List ivBytes,
}) async {
  final keyBytes = _workerKeyBytes;

  if (keyBytes == null) {
    throw EncryptionException(
      "Worker is not initialized",
      code: "invalid-secret",
    );
  }
  if (ivBytes.length != 16) {
    throw EncryptionException("CFB requires a 16-byte IV", code: "invalid-iv");
  }

  if (encrypt) {
    final encrypter = enc.Encrypter(
      enc.AES(enc.Key(Uint8List.fromList(keyBytes)), mode: enc.AESMode.cfb64),
    );
    final iv = enc.IV(Uint8List.fromList(ivBytes));
    final plainText = convert.utf8.decode(input);
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return Uint8List.fromList(convert.base64.decode(encrypted.base64));
  }

  final blockCipher = CFBBlockCipher(AESEngine(), _cfbBlockBytes);

  blockCipher.reset();
  blockCipher.init(
    encrypt,
    ParametersWithIV<KeyParameter>(KeyParameter(keyBytes), ivBytes),
  );

  final output = Uint8List(input.length);
  final bs = blockCipher.blockSize;

  try {
    var offset = 0;
    while (offset + bs <= input.length) {
      blockCipher.processBlock(input, offset, output, offset);
      offset += bs;

      if ((offset & 0xFFFF) == 0) {
        await Future(dud);
      }
    }

    // Handle final partial block
    final remaining = input.length - offset;

    if (remaining > 0) {
      final tmpIn = Uint8List(bs);
      final tmpOut = Uint8List(bs);

      tmpIn.setRange(0, remaining, input, offset);

      blockCipher.processBlock(tmpIn, 0, tmpOut, 0);

      output.setRange(offset, input.length, tmpOut);
    }

    return output;
  } on ArgumentError catch (error) {
    throw DecryptionException(error.toString(), code: "invalid-ciphertext");
  } on InvalidCipherTextException catch (error) {
    throw DecryptionException(error.toString(), code: "invalid-ciphertext");
  }
}

Uint8List _processGCM(
  Uint8List input, {
  required bool encrypt,
  required Uint8List ivBytes,
}) {
  final keyBytes = _workerKeyBytes;

  if (keyBytes == null) {
    throw EncryptionException(
      "Worker is not initialized",
      code: "invalid-secret",
    );
  }
  if (!encrypt && input.length < _gcmMacBytes) {
    throw DecryptionException(
      "Invalid ciphertext length for GCM",
      code: "invalid-ciphertext",
    );
  }

  final cipher = GCMBlockCipher(AESEngine());
  cipher.reset();
  cipher.init(
    encrypt,
    AEADParameters(KeyParameter(keyBytes), _gcmMacBits, ivBytes, _emptyBytes),
  );

  final output = Uint8List(cipher.getOutputSize(input.length));
  var outputOffset = 0;

  try {
    for (
      var inputOffset = 0;
      inputOffset < input.length;
      inputOffset += _cryptoChunkSize
    ) {
      final chunkLength = min(_cryptoChunkSize, input.length - inputOffset);
      outputOffset += cipher.processBytes(
        input,
        inputOffset,
        chunkLength,
        output,
        outputOffset,
      );
    }

    outputOffset += cipher.doFinal(output, outputOffset);
    return Uint8List.sublistView(output, 0, outputOffset);
  } on InvalidCipherTextException catch (error) {
    throw DecryptionException(error.toString(), code: "invalid-ciphertext");
  }
}

(String, String) _deserializeSecret(String serialized) {
  final split = serialized.split("-+-");
  if (split.length != 2) {
    throw EncryptionException(
      "Invalid serialized secret",
      code: "invalid-secret",
    );
  }
  return (split[0], split[1]);
}

Uint8List _generateRandomBytes(int length) {
  final bytes = Uint8List(length);
  for (var index = 0; index < bytes.length; index++) {
    bytes[index] = _secureRandom.nextInt(256);
  }
  return bytes;
}

class DecryptionException implements Exception {
  final String code;
  final String message;

  DecryptionException(this.message, {this.code = "not-active"});

  @override
  String toString() => "DecryptionException($code): $message";
}

class EncryptionException implements Exception {
  final String code;
  final String message;

  EncryptionException(this.message, {this.code = "not-active"});

  @override
  String toString() => "EncryptionException($code): $message";
}

class EncryptionWorker {
  static const Duration _workerTimeout = Duration(minutes: 2);
  static const _logger = AppLogger.scoped("E2EE Worker");

  Completer<void>? _completer;
  final Map<String, Completer<EncryptionResponse>> _tasks =
      <String, Completer<EncryptionResponse>>{};
  StreamSubscription? _subscription;

  bool _isRunning = false;
  bool _isStarting = false;
  bool _encryption = false;
  bool _decryption = true;
  bool _useNonce = false;

  String? secret;
  EasyWorker<
    MessageWithID<EncryptionResponse>,
    MessageWithID<EncryptionPayload>
  >?
  _encryptor;

  EncryptionWorker._();

  static final EncryptionWorker _instance = EncryptionWorker._();
  static EncryptionWorker get instance => _instance;

  bool get isRunning => _isRunning;
  bool get isStarting => _isStarting;
  bool get isEncryptionActive => _encryption;
  bool get isDecryptionActive => _decryption;
  bool get useNonce => _useNonce;

  String generateIV([int length = 16]) =>
      convert.base64.encode(_generateRandomBytes(length));

  void dispose() {
    _isRunning = false;
    _isStarting = false;
    for (final task in _tasks.values) {
      if (!task.isCompleted) {
        task.completeError(StateError("Encryptor has been disposed"));
      }
    }
    _tasks.clear();
    _subscription?.cancel();
    _subscription = null;
    _encryptor?.dispose();
    _encryptor = null;
    _completer = null;
  }

  void setEncryption(bool value) {
    _encryption = value;
  }

  void setDecryption(bool value) {
    _decryption = value;
  }

  void setUseNonce(bool value) {
    _useNonce = value;
  }

  /// [secret] may be a future so the worker counts as starting while the key
  /// is still being read; [waitUntilReady] covers that window too.
  Future<void> start(FutureOr<String?> secret) async {
    if (_completer != null || _isRunning || _isStarting) return;

    _completer = Completer<void>();
    _isStarting = true;

    try {
      final key = await secret;
      if (key == null) {
        _completer?.complete();
        dispose();
        return;
      }
      this.secret = key;

      _subscription?.cancel();
      _encryptor?.dispose();
      _encryptor =
          EasyWorker<
            MessageWithID<EncryptionResponse>,
            MessageWithID<EncryptionPayload>
          >(
            Entrypoint<MessageWithID<EncryptionPayload>>(
              _encryptorWorkerEntryPoint,
              onInit: _initializeWorkerSecret,
              initData: key,
            ),
            workerName: "E2EE Worker",
          );

      _subscription = _encryptor?.onMessage((message) {
        final (id, response) = message;
        final completer = _tasks.remove(id);
        if (completer == null || completer.isCompleted) return;
        completer.complete(response);
      });

      await _encryptor?.waitUntilReady();
      _isRunning = true;
      _completer?.complete();
    } catch (error, stackTrace) {
      _logger.e("Failed to start: ${error.toString()}");
      _completer?.completeError(error, stackTrace);
      dispose();
      rethrow;
    } finally {
      _isStarting = false;
    }
  }

  Future<void> waitUntilReady() async {
    final completer = _completer;
    if (completer == null || completer.isCompleted) return;
    await completer.future;
  }

  /// Encryption is on but the worker isn't running, so content can't be
  /// encrypted and must not leave the device.
  Future<bool> isEncryptionUnavailable() async {
    if (!_encryption) return false;
    try {
      await waitUntilReady();
    } catch (_) {}
    return !_isRunning;
  }

  Future<TransferableTypedData> submit(
    TransferableTypedData content, {
    required EncDecType action,
    String? customIV,
    String? mode,
  }) async {
    _logger.w(() => "Submitting task for action ${action.name}");
    String? taskId;
    try {
      final encryptor = _encryptor;

      if (secret == null) {
        throw _exceptionForAction(
          action,
          "Secret is not set",
          code: "invalid-secret",
        );
      }
      if (encryptor == null || !_isRunning) {
        throw _exceptionForAction(action, "Encryptor is not running");
      }
      if (action == EncDecType.encrypt && !_encryption) {
        throw EncryptionException("Encryption is not active");
      }
      if (action == EncDecType.decrypt && !_decryption) {
        throw DecryptionException("Decryption is not active");
      }

      await waitUntilReady();
      taskId = UniqueKey().toString();
      final completer = Completer<EncryptionResponse>();
      _tasks[taskId] = completer;

      await encryptor.send((
        taskId,
        (content: content, customIV: customIV, mode: mode, action: action),
      ));

      final response = await completer.future.timeout(_workerTimeout);

      if (!response.success || response.content == null) {
        if (response.code == "unexpected-error") {
          await _restartAfterFailure();
        }
        throw _exceptionForAction(
          action,
          response.message ?? "Unknown encryption worker failure",
          code: response.code,
        );
      }

      return response.content!;
    } on TimeoutException {
      _logger.e("Worker timed out while handling ${action.name}");
      await _restartAfterTimeout();
      throw _exceptionForAction(
        action,
        "Encryption worker timed out",
        code: "timeout",
      );
    } finally {
      if (taskId != null) {
        _tasks.remove(taskId);
      }
    }
  }

  Future<TransferableTypedData> encryptTransferable(
    TransferableTypedData content, {
    String? customIV,
    String? mode,
  }) {
    return submit(
      content,
      action: EncDecType.encrypt,
      customIV: customIV,
      mode: mode,
    );
  }

  Future<TransferableTypedData> decryptTransferable(
    TransferableTypedData content, {
    String? customIV,
    String? mode,
  }) {
    return submit(
      content,
      action: EncDecType.decrypt,
      customIV: customIV,
      mode: mode,
    );
  }

  Future<Uint8List> encryptBytes(
    Uint8List content, {
    String? customIV,
    String? mode,
  }) async {
    final result = await encryptTransferable(
      TransferableTypedData.fromList([content]),
      customIV: customIV,
      mode: mode,
    );
    return result.materialize().asUint8List();
  }

  Future<Uint8List> decryptBytes(
    Uint8List content, {
    String? customIV,
    String? mode,
  }) async {
    final result = await decryptTransferable(
      TransferableTypedData.fromList([content]),
      customIV: customIV,
      mode: mode,
    );
    return result.materialize().asUint8List();
  }

  Future<String> encrypt(
    String content, {
    String? customIV,
    String? mode,
  }) async {
    final plainBytes = Uint8List.fromList(convert.utf8.encode(content));
    final encryptedBytes = await encryptBytes(
      plainBytes,
      customIV: customIV,
      mode: mode,
    );
    return convert.base64.encode(encryptedBytes);
  }

  Future<String> decrypt(
    String content, {
    String? customIV,
    String? mode,
  }) async {
    return await _lock.synchronized(() async {
      final resolvedMode = mode == EncryptionMode.gcm
          ? EncryptionMode.gcm
          : EncryptionMode.cfb;

      try {
        final cipherBytes = Uint8List.fromList(convert.base64.decode(content));
        final decryptedBytes = await decryptBytes(
          cipherBytes,
          customIV: customIV,
          mode: resolvedMode,
        );
        final decoded = convert.utf8.decode(
          decryptedBytes,
          allowMalformed: true,
        );
        return _stripLegacyTrailingPadding(decoded).trimRight();
      } on DecryptionException catch (e) {
        if (e.code == "invalid-ciphertext") {
          _logger.w("Failed to decrypt: ${e.toString()}");
          return content;
        }
        rethrow;
      } catch (e) {
        _logger.w("Failed to decrypt: ${e.toString()}");
        rethrow;
      }
    });
  }

  String _stripLegacyTrailingPadding(String value) {
    if (value.isEmpty) return value;

    final padCode = value.codeUnitAt(value.length - 1);
    if (padCode < 1 || padCode > 16) return value;
    if (value.length < padCode) return value;

    final suffixStart = value.length - padCode;
    for (int i = suffixStart; i < value.length; i++) {
      if (value.codeUnitAt(i) != padCode) {
        return value;
      }
    }

    return value.substring(0, suffixStart);
  }

  Future<void> _restartAfterTimeout() async {
    await _restartAfterFailure();
  }

  Future<void> _restartAfterFailure() async {
    final currentSecret = secret;
    if (currentSecret == null) return;
    _logger.w("🔵 Restarting worker due to failure");
    dispose();
    await start(currentSecret);
  }

  Exception _exceptionForAction(
    EncDecType action,
    String message, {
    String? code,
  }) {
    return action == EncDecType.decrypt
        ? DecryptionException(message, code: code ?? "not-active")
        : EncryptionException(message, code: code ?? "not-active");
  }
}
