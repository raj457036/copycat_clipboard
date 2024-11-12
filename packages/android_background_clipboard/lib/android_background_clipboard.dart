import 'android_background_clipboard_platform_interface.dart';

class AndroidBackgroundClipboard {
  Future<String?> getPlatformVersion() {
    return AndroidBackgroundClipboardPlatform.instance.getPlatformVersion();
  }

  Future<bool> isAccessibilityPermissionGranted() {
    return AndroidBackgroundClipboardPlatform.instance
        .isAccessibilityPermissionGranted();
  }

  Future<void> openAccessibilityService() {
    return AndroidBackgroundClipboardPlatform.instance
        .openAccessibilityService();
  }
}
