import 'dart:typed_data';

import 'package:focus_window/activity_info.dart';
import 'package:focus_window/platform_activity_observer_interface.dart';

class NotSupportedPlatformActivityObserver
    implements PlatformActivityObserverInterface {
  @override
  Stream get events => throw UnimplementedError();

  @override
  Future<ActivityInfo> getActivity({bool withIcon = false}) {
    throw UnimplementedError();
  }

  @override
  Future<Uint8List?> getIcon(String applicationPath) {
    return Future.value(null);
  }

  @override
  Future<bool> isAccessibilityPermissionGranted() {
    return Future.value(false);
  }

  @override
  Future<bool> get isObserving => Future.value(false);

  @override
  Future<bool> requestAccessibilityPermission() {
    return Future.value(true);
  }

  @override
  Future<void> startObserver() {
    return Future.value(null);
  }

  @override
  Future<void> stopObserver() {
    return Future.value(null);
  }

  @override
  Future<int?> getActiveWindowId() {
    return Future.value(-1);
  }

  @override
  Future<void> pasteContent() {
    return Future.value(null);
  }

  @override
  Future<void> setActiveWindowId(int windowId) {
    return Future.value(null);
  }
}
