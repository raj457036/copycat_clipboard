import 'dart:io';
import 'dart:math' as math;

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

DateTime nowUTC() {
  return DateTime.now().toUtc();
}

Future<void> createDirectoryIfNotExists(String path) async {
  final dir = Directory(path);
  if (!await dir.exists()) {
    await dir.create(recursive: true);
  }
}
