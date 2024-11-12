import 'package:flutter_test/flutter_test.dart';
import 'package:android_background_clipboard/android_background_clipboard.dart';
import 'package:android_background_clipboard/android_background_clipboard_platform_interface.dart';
import 'package:android_background_clipboard/android_background_clipboard_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAndroidBackgroundClipboardPlatform
    with MockPlatformInterfaceMixin
    implements AndroidBackgroundClipboardPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AndroidBackgroundClipboardPlatform initialPlatform = AndroidBackgroundClipboardPlatform.instance;

  test('$MethodChannelAndroidBackgroundClipboard is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAndroidBackgroundClipboard>());
  });

  test('getPlatformVersion', () async {
    AndroidBackgroundClipboard androidBackgroundClipboardPlugin = AndroidBackgroundClipboard();
    MockAndroidBackgroundClipboardPlatform fakePlatform = MockAndroidBackgroundClipboardPlatform();
    AndroidBackgroundClipboardPlatform.instance = fakePlatform;

    expect(await androidBackgroundClipboardPlugin.getPlatformVersion(), '42');
  });
}
