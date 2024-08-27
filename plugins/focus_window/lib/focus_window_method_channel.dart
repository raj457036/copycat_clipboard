import 'package:flutter/foundation.dart';
import 'package:focus_window/macos.dart';
import 'package:focus_window/not_supported.dart';
import 'package:focus_window/platform_activity_observer_interface.dart';
import 'package:focus_window/windows.dart';
import 'package:universal_io/io.dart';

import 'focus_window_platform_interface.dart';

/// An implementation of [FocusWindowPlatform] that uses method channels.
class MethodChannelFocusWindow extends FocusWindowPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  late final PlatformActivityObserverInterface activityObserver;

  MethodChannelFocusWindow() {
    if (Platform.isMacOS) {
      activityObserver = const MacosActivityObserver();
    } else if (Platform.isWindows) {
      activityObserver = const WindowsActivityObserver();
    } else {
      activityObserver = NotSupportedPlatformActivityObserver();
    }
  }

  @override
  Future<int?> getActiveWindowId() async {
    return activityObserver.getActiveWindowId();
  }

  @override
  Future<void> setActiveWindowId(int windowId) async {
    await activityObserver.setActiveWindowId(windowId);
    return;
  }

  @override
  Future<void> pasteContent() async {
    await activityObserver.pasteContent();
  }

  @override
  Stream get events => activityObserver.events;

  @override
  Future<bool> get isObserving => activityObserver.isObserving;
}
