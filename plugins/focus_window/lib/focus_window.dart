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
}
