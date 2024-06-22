import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:focus_window/windows_paste_simulator.dart';
import 'package:universal_io/io.dart';
import "package:win32/win32.dart" show GetForegroundWindow, SetForegroundWindow;

import 'focus_window_platform_interface.dart';

/// An implementation of [FocusWindowPlatform] that uses method channels.
class MethodChannelFocusWindow extends FocusWindowPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('focus_window');

  @override
  Future<int?> getActiveWindowId() async {
    if (Platform.isWindows) {
      final id = GetForegroundWindow();
      return id;
    } else if (Platform.isMacOS) {
      final id = await methodChannel.invokeMethod<int>('getActiveWindowId');
      return id;
    }
    return -1;
  }

  @override
  Future<void> setActiveWindowId(int windowId) async {
    if (Platform.isWindows) {
      SetForegroundWindow(windowId);
    } else if (Platform.isMacOS) {
      await methodChannel.invokeMethod<void>(
        'setActiveWindowId',
        {
          "windowId": windowId,
        },
      );
    }
    return;
  }

  @override
  Future<void> pasteContent() async {
    if (Platform.isWindows) {
      simulateWindowsPasteShortcut();
    }
    if (Platform.isMacOS) {
      await methodChannel.invokeMethod<void>("pasteContent", {});
    }
    if (Platform.isLinux) {
      await methodChannel.invokeMethod<void>("pasteContent", {});
    }
  }
}
