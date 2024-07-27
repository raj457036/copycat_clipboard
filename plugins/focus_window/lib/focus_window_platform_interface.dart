import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'focus_window_method_channel.dart';

abstract class FocusWindowPlatform extends PlatformInterface {
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

  Future<int?> getActiveWindowId() {
    throw UnimplementedError('getActiveWindowId() has not been implemented.');
  }

  Future<void> setActiveWindowId(int windowId) {
    throw UnimplementedError('setActiveWindowId() has not been implemented.');
  }

  Future<void> pasteContent() {
    throw UnimplementedError("pasteContent() has not been implemented");
  }
}
