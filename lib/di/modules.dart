import "package:android_background_clipboard/android_background_clipboard.dart";
import "package:focus_window/focus_window.dart";
import "package:injectable/injectable.dart";
import "package:package_info_plus/package_info_plus.dart";

@module
abstract class RegisterModule {
  @preResolve
  Future<PackageInfo> get packageInfo async => await PackageInfo.fromPlatform();

  @singleton
  FocusWindow get focusWindow => FocusWindow();

  @LazySingleton()
  AndroidBackgroundClipboard get bgService =>
      const AndroidBackgroundClipboard();
}
