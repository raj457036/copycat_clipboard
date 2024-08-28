// service
import 'dart:async';
import 'dart:convert' show base64;
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:focus_window/platform/activity_info.dart';
import 'package:focus_window/platform/utils.dart';
import 'package:focus_window/platform/windows_paste_simulator.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:win32/win32.dart';

import 'platform_activity_observer_interface.dart';

final _cache = <String, String>{};
ActivityInfo? _lastActivity;

class WindowsActivityObserver implements PlatformActivityObserverInterface {
  const WindowsActivityObserver();

  Future<void> cacheAll() async {
    final futures = <Future>[];

    if (!_cache.containsKey('GetActivity')) {
      futures.add(
        rootBundle
            .loadString('packages/tracker_libs/windows_utils/Get-Activity.ps1')
            .then((value) => _cache['GetActivity'] = value),
      );
    }
    if (!_cache.containsKey('GetIcon')) {
      futures.add(
        rootBundle
            .loadString('plugins/focus_window/windows_utils/Get-Icon.ps1')
            .then((value) async {
          final tempDir = await getTemporaryDirectory();
          final file = File(p.join(tempDir.path, '._gi.ps1'));
          await file.writeAsString(value);
          _cache['GetIcon'] = file.path;
        }),
      );
    }
    if (!_cache.containsKey('GetUrl')) {
      futures.add(
        rootBundle
            .loadString('packages/tracker_libs/windows_utils/Get-Url.ps1')
            .then((value) async {
          final tempDir = await getTemporaryDirectory();
          final file = File(p.join(tempDir.path, '._gu.ps1'));
          await file.writeAsString(value);
          _cache['GetUrl'] = file.path;
        }),
      );
    }

    if (!_cache.containsKey('GetScreenshot')) {
      futures.add(
        rootBundle
            .loadString(
                'packages/tracker_libs/windows_utils/Get-Screenshot.ps1')
            .then((value) => _cache['GetScreenshot'] = value),
      );
    }

    await Future.wait(futures);
  }

  @override
  Future<Uint8List?> getIcon(String applicationPath) async {
    final result = await runInPowershell([
      '-File',
      _cache['GetIcon']!,
      '-ApplicationPath',
      applicationPath,
    ]);
    return base64.decode(result.trim());
  }

  Future<String?> getUrl(String app, String windowTitle) async {
    throw UnimplementedError();

    // final result = await runInPowershell(
    //   [
    //     _cache['GetUrl']!,
    //     '-app',
    //     app,
    //     '-windowTitle',
    //     "'$windowTitle'",
    //   ],
    // );
    // return result;
  }

  @override
  Future<ActivityInfo> getActivity({bool withIcon = false}) async {
    final result = await runInPowershell([
      _cache['GetActivity']!,
    ]);

    var activity = ActivityInfo.fromJson(result);

    if (activity.title != _lastActivity?.title) {
      final url = await getUrl(activity.appFileName, activity.title);
      activity = activity.copyWith(url: url);
    }

    _lastActivity = activity;

    if (withIcon) {
      final icon = await getIcon(_lastActivity!.appFilePath);
      _lastActivity = _lastActivity!.copyWith(icon: icon);
    }
    return _lastActivity!;
  }

  @override
  Future<bool> isAccessibilityPermissionGranted() async {
    return true;
  }

  @override
  Future<bool> requestAccessibilityPermission() async {
    return true;
  }

  @override
  Stream get events => throw UnimplementedError();

  @override
  Future<bool> get isObserving => throw UnimplementedError();

  @override
  Future<void> startObserver() {
    throw UnimplementedError();
  }

  @override
  Future<void> stopObserver() {
    throw UnimplementedError();
  }

  @override
  Future<int?> getActiveWindowId() async {
    final id = GetForegroundWindow();
    return id;
  }

  @override
  Future<void> setActiveWindowId(int windowId) async {
    SetForegroundWindow(windowId);
  }

  @override
  Future<void> pasteContent() async {
    simulateWindowsPasteShortcut();
  }
}
