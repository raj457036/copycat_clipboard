import 'dart:convert';
import 'dart:math' show Random;

import 'package:encrypt/encrypt.dart';

String generateSecurePassword(int length) {
  const String upperCaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String lowerCaseLetters = 'abcdefghijklmnopqrstuvwxyz';
  const String digits = '0123456789';
  const String specialCharacters = '!@#\$%^&*()-_=+[]{}|;:,.<>?';

  final Random random = Random.secure();

  // Ensure the password contains at least one character from each set
  List<String> passwordChars = [
    upperCaseLetters[random.nextInt(upperCaseLetters.length)],
    lowerCaseLetters[random.nextInt(lowerCaseLetters.length)],
    digits[random.nextInt(digits.length)],
    specialCharacters[random.nextInt(specialCharacters.length)],
  ];

  // Fill the remaining length of the password with random characters from all sets
  String allChars =
      upperCaseLetters + lowerCaseLetters + digits + specialCharacters;
  for (int i = 4; i < length; i++) {
    passwordChars.add(allChars[random.nextInt(allChars.length)]);
  }

  // Shuffle the password characters to ensure randomness
  passwordChars.shuffle(random);

  // Convert the list of characters to a string and return
  return passwordChars.join();
}

class EncryptionSecret {
  final String secret;
  final String init;
  late final Key key;
  late final IV iv;

  EncryptionSecret(
    this.secret,
    this.init,
  ) {
    key = Key.fromUtf8(secret);
    iv = IV.fromBase64(init);
  }

  factory EncryptionSecret.generate() {
    const secretKeyLength = 28;
    const ivLength = 16;
    final secret = generateSecurePassword(secretKeyLength);
    final iv = IV.fromLength(ivLength);
    return EncryptionSecret(secret, iv.base64);
  }

  Map<String, dynamic> toMap() {
    return {
      'secret': secret,
      'init': iv,
    };
  }

  factory EncryptionSecret.fromMap(Map<String, dynamic> map) {
    assert(map.containsKey("secret"), "Secret not found");
    assert(map.containsKey("init"), "Init not found");
    return EncryptionSecret(
      map['secret'] ?? '',
      map['init'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EncryptionSecret.fromJson(String source) =>
      EncryptionSecret.fromMap(json.decode(source));
}

class EncryptionManager {
  late final IV _iv;
  late final Encrypter encrypter;

  EncryptionManager(EncryptionSecret secret) {
    _iv = secret.iv;
    encrypter = Encrypter(AES(secret.key));
  }

  String encrypt(String content) {
    return encrypter.encrypt(content, iv: _iv).base64;
  }

  String decrypt(String content) {
    return encrypter.decrypt64(content, iv: _iv);
  }
}
