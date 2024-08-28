import 'dart:typed_data';

import 'package:focus_window/platform/activity_info.dart';
import 'package:focus_window/platform/platform_activity_observer_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'focus_window_method_channel.dart';

abstract class FocusWindowPlatform extends PlatformInterface
    implements PlatformActivityObserverInterface {
  /// Constructs a FocusWindowPlatform.
  FocusWindowPlatform() : super(token: _token);

  static final Object _token = Object();

  static FocusWindowPlatform _instance = MethodChannelFocusWindow();

  /// The default instance of [FocusWindowPlatform] to use.
  ///
  /// Defaults to [MethodChannelFocusWindow].
  static FocusWindowPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FocusWindowPlatform] when
  /// they register themselves.
  static set instance(FocusWindowPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  @override
  Future<int?> getActiveWindowId() {
    throw UnimplementedError('getActiveWindowId() has not been implemented.');
  }

  @override
  Future<void> setActiveWindowId(int windowId) {
    throw UnimplementedError('setActiveWindowId() has not been implemented.');
  }

  @override
  Future<void> pasteContent() {
    throw UnimplementedError("pasteContent() has not been implemented");
  }

  @override
  Future<Uint8List?> getIcon(String applicationPath) {
    throw UnimplementedError("getIcon() has not been implemented");
  }

  @override
  Future<ActivityInfo> getActivity({bool withIcon = false}) {
    throw UnimplementedError("ActivityInfo() has not been implemented");
  }

  @override
  Future<bool> requestAccessibilityPermission() {
    throw UnimplementedError(
      "requestAccessibilityPermission() has not been implemented",
    );
  }

  @override
  Future<bool> isAccessibilityPermissionGranted() {
    throw UnimplementedError(
      "isAccessibilityPermissionGranted() has not been implemented",
    );
  }

  @override
  Future<void> startObserver() {
    throw UnimplementedError(
      "isAccessibilityPermissionGranted() has not been implemented",
    );
  }

  @override
  Future<void> stopObserver() {
    throw UnimplementedError(
      "isAccessibilityPermissionGranted() has not been implemented",
    );
  }

  @override
  Future<bool> get isObserving;

  @override
  Stream get events;
}
