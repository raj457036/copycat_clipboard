import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_background_clipboard_platform_interface.dart';

/// An implementation of [AndroidBackgroundClipboardPlatform] that uses method channels.
class MethodChannelAndroidBackgroundClipboard
    extends AndroidBackgroundClipboardPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_background_clipboard');

  @override
  Future<bool> isAccessibilityPermissionGranted() async {
    final isGranted = await methodChannel
            .invokeMethod<bool>('isAccessibilityPermissionGranted') ??
        false;
    return isGranted;
  }

  @override
  Future<void> openAccessibilityService() async {
    await methodChannel.invokeMethod<bool>('openAccessibilityService');
  }

  @override
  Future<bool> isBatteryOptimizationEnabled() async {
    final isEnabled = await methodChannel
            .invokeMethod<bool>('isBatteryOptimizationEnabled') ??
        false;
    return isEnabled;
  }

  @override
  Future<bool> isNotificationPermissionGranted() async {
    final isGranted = await methodChannel
            .invokeMethod<bool>('isNotificationPermissionGranted') ??
        false;
    return isGranted;
  }

  @override
  Future<bool> isOverlayPermissionGranted() async {
    final isGranted =
        await methodChannel.invokeMethod<bool>('isOverlayPermissionGranted') ??
            false;
    return isGranted;
  }

  @override
  Future<bool> isServiceRunning() async {
    final isRunning =
        await methodChannel.invokeMethod<bool>('isServiceRunning') ?? false;
    return isRunning;
  }

  @override
  Future<void> requestNotificationPermission() async {
    await methodChannel.invokeMethod<bool>('requestNotificationPermission');
  }

  @override
  Future<void> requestOverlayPermission() async {
    await methodChannel.invokeMethod<bool>('requestOverlayPermission');
  }

  @override
  Future<void> requestUnrestrictedBatteryAccess() async {
    await methodChannel.invokeMethod<bool>('requestUnrestrictedBatteryAccess');
  }
}
