import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import "package:universal_io/io.dart";
import 'package:uuid/uuid.dart';

/// Simple wrapper around [Future.delayed] to wait for few seconds.
///
/// Default: 2 seconds
Future<void> wait([int seconds = 2]) async {
  await Future.delayed(Duration(seconds: seconds));
}

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

Color? hexToColor(ClipboardItem item) {
  if (item.textCategory != TextCategory.color) return null;
  String hex = item.text!.replaceAll('#', '');

  if (hex.length == 3) {
    // Expand shorthand format (e.g., #abc to #aabbcc)
    hex = '${hex[0]}${hex[0]}${hex[1]}${hex[1]}${hex[2]}${hex[2]}FF';
  } else if (hex.length == 6) {
    // Add alpha value if not specified
    hex = 'FF$hex';
  } else if (hex.length != 8) {
    // Check for valid length
    return null;
  }

  return Color(int.parse(hex, radix: 16));
}

Color getFg(Color bg) {
  return bg.computeLuminance() < 0.1 ? Colors.white54 : Colors.black54;
}

Future<void> screenshotAsFile(
  BuildContext context,
  DeviceScreenshot screenshot,
) async {
  final filePath = await FilePicker.platform.saveFile(
    dialogTitle: 'Save to',
    type: FileType.image,
    fileName: 'screenshot_${const Uuid().v4()}.png',
    bytes: screenshot.bytes,
  );

  if (filePath != null) {
    final file = File(filePath);

    file.writeAsBytesSync(screenshot.bytes);
  }
}

final metaKey = Platform.isMacOS ? "⌘" : "ctrl";
