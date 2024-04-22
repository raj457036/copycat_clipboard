import "package:universal_io/io.dart";

import 'package:freezed_annotation/freezed_annotation.dart';

enum PlatformOS {
  @JsonValue("android")
  android,
  @JsonValue("ios")
  ios,
  @JsonValue("macos")
  macos,
  @JsonValue("windows")
  windows,
}

PlatformOS currentPlatformOS() {
  if (Platform.isAndroid) {
    return PlatformOS.android;
  }
  if (Platform.isIOS) {
    return PlatformOS.ios;
  }
  if (Platform.isMacOS) {
    return PlatformOS.macos;
  }
  if (Platform.isWindows) {
    return PlatformOS.windows;
  }
  throw UnsupportedError("Unsupported platform");
}
