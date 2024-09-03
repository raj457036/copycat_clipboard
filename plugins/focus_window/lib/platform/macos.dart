import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:focus_window/platform/activity_info.dart';
import 'package:focus_window/platform/platform_activity_observer_interface.dart';

// exceptions:
class AssistiveAccessNotGranted implements Exception {
  final String message;
  AssistiveAccessNotGranted() : message = 'Assistive Access not granted';

  @override
  String toString() => 'AssistiveAccessNotGranted(message: $message)';
}

// service
class MacosActivityObserver implements PlatformActivityObserverInterface {
  const MacosActivityObserver();

  final EventChannel _channelStream = const EventChannel('focus_window_stream');
  final MethodChannel _channel = const MethodChannel('focus_window');

  @override
  Stream get events => _channelStream.receiveBroadcastStream();

  @override
  Future<void> startObserver() async {
    final result = await _channel.invokeMethod("startObserver");
    print(result);
  }

  @override
  Future<void> stopObserver() async {
    await _channel.invokeMethod("stopObserver");
  }

  @override
  Future<bool> get isObserving async =>
      await _channel.invokeMethod("isObserving") as bool;

  @override
  Future<Uint8List?> getIcon(String applicationPath) async {
    final result = await _channel.invokeMethod('getIcon', {
      'applicationPath': applicationPath,
    });

    return result;
  }

  @override
  Future<bool> requestAccessibilityPermission() async {
    return await _channel.invokeMethod('requestAccessibilityPermission') ??
        false;
  }

  @override
  Future<void> openAccessibilityPermissionSetting() async {
    await _channel.invokeMethod('openAccessibilityPermissionSetting');
  }

  @override
  Future<bool> isAccessibilityPermissionGranted() async {
    if (!kIsWeb && Platform.isMacOS) {
      return await _channel.invokeMethod('isAccessibilityPermissionGranted');
    }
    return false;
  }

  @override
  Future<ActivityInfo> getActivity({bool withIcon = false}) async {
    final result = await _channel.invokeMethod('getActivity', {
      "withIcon": withIcon,
    });

    final macActivity = ActivityInfo.fromMap(Map.from(result));
    return macActivity;
  }

  @override
  Future<int?> getActiveWindowId() async {
    final id = await _channel.invokeMethod<int>('getActiveWindowId');
    return id;
  }

  @override
  Future<void> setActiveWindowId(int windowId) async {
    await _channel.invokeMethod<void>(
      'setActiveWindowId',
      {
        "windowId": windowId,
      },
    );
  }

  @override
  Future<void> pasteContent() async {
    await _channel.invokeMethod<void>("pasteContent", {});
  }
}
