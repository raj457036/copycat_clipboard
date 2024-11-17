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

  Future<void> initStorage() {
    throw UnimplementedError();
  }

  Future<T?> readShared<T>(String key, {bool secure = false}) {
    throw UnimplementedError();
  }

  Future<bool> writeShared<T>(String key, T value, {bool secure = false}) {
    throw UnimplementedError();
  }

  Future<void> deleteShared(List<String> keys) {
    throw UnimplementedError();
  }

  Future<bool> isAccessibilityPermissionGranted() async {
    throw UnimplementedError();
  }

  Future<void> openAccessibilityService() async {
    throw UnimplementedError();
  }

  Future<bool> isOverlayPermissionGranted() async {
    throw UnimplementedError();
  }

  Future<void> requestOverlayPermission() async {
    throw UnimplementedError();
  }

  Future<bool> isBatteryOptimizationEnabled() async {
    throw UnimplementedError();
  }

  Future<void> requestUnrestrictedBatteryAccess() async {
    throw UnimplementedError();
  }

  Future<bool> isNotificationPermissionGranted() async {
    throw UnimplementedError();
  }

  Future<void> requestNotificationPermission() async {
    throw UnimplementedError();
  }

  Future<bool> isServiceRunning() async {
    throw UnimplementedError();
  }

  Future<void> clearStorage() async {
    throw UnimplementedError();
  }
}
