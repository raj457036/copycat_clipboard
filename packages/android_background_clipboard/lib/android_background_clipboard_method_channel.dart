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
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

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
}
