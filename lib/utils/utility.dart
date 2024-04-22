import "package:universal_io/io.dart";
import 'dart:math' as math;

import 'package:clipboard/common/logging.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/v4.dart';

/// Simple wrapper around [Future.delayed] to wait for few seconds.
///
/// Default: 2 seconds
Future<void> wait([int seconds = 2]) async {
  await Future.delayed(Duration(seconds: seconds));
}

const _uuid4 = UuidV4();

/// Generates a random UUID.
String getId() => _uuid4.generate();

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  String hours = twoDigits(duration.inHours);
  String minutes = twoDigits(duration.inMinutes.remainder(60));
  String seconds = twoDigits(duration.inSeconds.remainder(60));

  if (duration.inHours > 0) {
    return '$hours:$minutes:$seconds';
  } else {
    return '$minutes:$seconds';
  }
}

T clamp<T extends num>(T value, [T? min, T? max]) {
  if (min != null && value < min) return min;
  if (max != null && value > max) return max;
  return value;
}

final _random = math.Random();
int getRandomIndex(int max) {
  return _random.nextInt(max);
}

DateTime now() {
  return DateTime.now();
}

DateTime nowUTC() {
  return DateTime.now().toUtc();
}

String formatBytes(int sizeInBytes, {bool precise = true}) {
  const mb = 1024 * 1024;
  const gb = mb * 1024;
  if (sizeInBytes < 1024) {
    return '$sizeInBytes bytes';
  } else if (sizeInBytes < gb) {
    return '${(sizeInBytes / mb).toStringAsFixed(precise ? 2 : 0)} MB';
  } else {
    return '${(sizeInBytes / gb).toStringAsFixed(precise ? 2 : 0)} GB';
  }
}

Future<void> createDirectoryIfNotExists(String path) async {
  final dir = Directory(path);
  if (!await dir.exists()) {
    await dir.create(recursive: true);
  }
}

Future<void> deleteTempFile(File file) async {
  try {
    await file.delete();
  } catch (e) {
    logger.e(
      "Couldn't delete file from temp storage.",
      error: e,
    );
  }
}

Future<String> getPersistedRootDirPath([String? root]) async {
  final docDir = await getApplicationDocumentsDirectory();
  final dirPath = p.join(docDir.path, "offline", root);
  await createDirectoryIfNotExists(dirPath);
  return dirPath;
}

Future<void> clearPersistedRootDirPath([String? root]) async {
  final dirPath = await getPersistedRootDirPath(root);
  final dir = Directory(dirPath);
  try {
    if (await dir.exists()) {
      await dir.delete(recursive: true);
    }
  } catch (e) {
    logger.e(
      "Couldn't delete directory from cache storage.",
      error: e,
    );
  }
}

Future<void> clearPersistedRootDir() async {
  final docDir = await getApplicationDocumentsDirectory();
  final dirPath = p.join(docDir.path, "offline");
  final dir = Directory(dirPath);
  if (await dir.exists()) {
    await dir.delete(recursive: true);
  }
}
