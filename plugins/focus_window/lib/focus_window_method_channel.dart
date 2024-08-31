import 'package:flutter/foundation.dart';
import 'package:focus_window/platform/activity_info.dart';
import 'package:focus_window/platform/macos.dart';
import 'package:focus_window/platform/not_supported.dart';
import 'package:focus_window/platform/platform_activity_observer_interface.dart';
import 'package:focus_window/platform/windows.dart';
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

  @override
  Future<ActivityInfo> getActivity({bool withIcon = false}) {
    return activityObserver.getActivity(withIcon: withIcon);
  }

  @override
  Future<Uint8List?> getIcon(String applicationPath) {
    return activityObserver.getIcon(applicationPath);
  }

  @override
  Future<bool> isAccessibilityPermissionGranted() {
    return activityObserver.isAccessibilityPermissionGranted();
  }

  @override
  Future<bool> requestAccessibilityPermission() {
    return activityObserver.requestAccessibilityPermission();
  }

  @override
  Future<void> openAccessibilityPermissionSetting() {
    return activityObserver.openAccessibilityPermissionSetting();
  }

  @override
  Future<void> startObserver() {
    return activityObserver.startObserver();
  }

  @override
  Future<void> stopObserver() {
    return activityObserver.stopObserver();
  }
}
