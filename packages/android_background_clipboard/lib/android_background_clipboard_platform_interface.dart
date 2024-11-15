import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_background_clipboard_method_channel.dart';

abstract class AndroidBackgroundClipboardPlatform extends PlatformInterface {
  /// Constructs a AndroidBackgroundClipboardPlatform.
  AndroidBackgroundClipboardPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidBackgroundClipboardPlatform _instance =
      MethodChannelAndroidBackgroundClipboard();

  /// The default instance of [AndroidBackgroundClipboardPlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidBackgroundClipboard].
  static AndroidBackgroundClipboardPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidBackgroundClipboardPlatform] when
  /// they register themselves.
  static set instance(AndroidBackgroundClipboardPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initStorage();

  Future<T?> readShared<T>(String key, {bool secure = false});

  Future<void> writeShared<T>(String key, T value, {bool secure = false});

  Future<bool> isAccessibilityPermissionGranted();

  Future<void> openAccessibilityService();

  Future<bool> isOverlayPermissionGranted();

  Future<void> requestOverlayPermission();

  Future<bool> isBatteryOptimizationEnabled();

  Future<void> requestUnrestrictedBatteryAccess();

  Future<bool> isNotificationPermissionGranted();

  Future<void> requestNotificationPermission();

  Future<bool> isServiceRunning();
}
