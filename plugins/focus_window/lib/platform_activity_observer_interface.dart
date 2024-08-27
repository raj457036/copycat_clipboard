import 'dart:typed_data';

import 'activity_info.dart';

abstract class PlatformActivityObserverInterface {
  Future<Uint8List?> getIcon(String applicationPath);
  Future<ActivityInfo> getActivity({bool withIcon = false});
  Future<bool> requestAccessibilityPermission();
  Future<bool> isAccessibilityPermissionGranted();
  Future<void> startObserver();
  Future<void> stopObserver();
  Future<int?> getActiveWindowId();
  Future<void> setActiveWindowId(int windowId);
  Future<void> pasteContent();
  Future<bool> get isObserving;

  Stream get events;
}
