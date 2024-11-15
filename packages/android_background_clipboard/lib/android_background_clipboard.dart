import 'android_background_clipboard_platform_interface.dart';

class AndroidBackgroundClipboard {
  const AndroidBackgroundClipboard();

  Future<void> initStorage() {
    return AndroidBackgroundClipboardPlatform.instance.initStorage();
  }

  Future<T?> readShared<T>(String key, {bool secure = false}) {
    return AndroidBackgroundClipboardPlatform.instance
        .readShared<T>(key, secure: secure);
  }

  Future<void> writeShared<T>(String key, T value, {bool secure = false}) {
    return AndroidBackgroundClipboardPlatform.instance
        .writeShared(key, value, secure: secure);
  }

  Future<bool> isAccessibilityPermissionGranted() {
    return AndroidBackgroundClipboardPlatform.instance
        .isAccessibilityPermissionGranted();
  }

  Future<void> openAccessibilityService() {
    return AndroidBackgroundClipboardPlatform.instance
        .openAccessibilityService();
  }

  Future<bool> isOverlayPermissionGranted() async {
    return AndroidBackgroundClipboardPlatform.instance
        .isOverlayPermissionGranted();
  }

  Future<void> requestOverlayPermission() async {
    return AndroidBackgroundClipboardPlatform.instance
        .requestOverlayPermission();
  }

  Future<bool> isBatteryOptimizationEnabled() async {
    return AndroidBackgroundClipboardPlatform.instance
        .isBatteryOptimizationEnabled();
  }

  Future<void> requestUnrestrictedBatteryAccess() async {
    return AndroidBackgroundClipboardPlatform.instance
        .requestUnrestrictedBatteryAccess();
  }

  Future<bool> isNotificationPermissionGranted() async {
    return AndroidBackgroundClipboardPlatform.instance
        .isNotificationPermissionGranted();
  }

  Future<void> requestNotificationPermission() async {
    return AndroidBackgroundClipboardPlatform.instance
        .requestNotificationPermission();
  }

  Future<bool> isServiceRunning() async {
    return AndroidBackgroundClipboardPlatform.instance.isServiceRunning();
  }
}
