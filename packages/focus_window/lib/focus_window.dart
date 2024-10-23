import 'dart:typed_data';

import 'package:focus_window/platform/activity_info.dart';

import 'focus_window_platform_interface.dart';

class FocusWindow {
  Future<int?> getActiveWindowId() {
    return FocusWindowPlatform.instance.getActiveWindowId();
  }

  Future<void> setActiveWindowId(int windowId) {
    return FocusWindowPlatform.instance.setActiveWindowId(windowId);
  }

  Future<void> pasteContent() {
    return FocusWindowPlatform.instance.pasteContent();
  }

  Stream get events => FocusWindowPlatform.instance.events;

  Future<ActivityInfo> getActivity({bool withIcon = false}) {
    return FocusWindowPlatform.instance.getActivity(withIcon: withIcon);
  }

  Future<Uint8List?> getIcon(String applicationPath) {
    return FocusWindowPlatform.instance.getIcon(applicationPath);
  }

  Future<bool> isAccessibilityPermissionGranted() {
    return FocusWindowPlatform.instance.isAccessibilityPermissionGranted();
  }

  Future<bool> get isObserving => FocusWindowPlatform.instance.isObserving;

  Future<bool> requestAccessibilityPermission() {
    // FocusWindowPlatform.instance.
    return FocusWindowPlatform.instance.requestAccessibilityPermission();
  }

  Future<void> openAccessibilityPermissionSetting() {
    return FocusWindowPlatform.instance.openAccessibilityPermissionSetting();
  }

  Future<void> startObserver() {
    return FocusWindowPlatform.instance.startObserver();
  }

  Future<void> stopObserver() {
    return FocusWindowPlatform.instance.stopObserver();
  }
}
