import 'android_background_clipboard_platform_interface.dart';

class AndroidBackgroundClipboard {
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
