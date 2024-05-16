import 'focus_window_platform_interface.dart';

class FocusWindow {
  Future<String?> getPlatformVersion() {
    return FocusWindowPlatform.instance.getPlatformVersion();
  }

  Future<int?> getActiveWindowId() async {
    return FocusWindowPlatform.instance.getActiveWindowId();
  }

  Future<void> setActiveWindowId(int windowId) async {
    return FocusWindowPlatform.instance.setActiveWindowId(windowId);
  }

  Future<void> paste() async {
    return FocusWindowPlatform.instance.paste();
  }
}
