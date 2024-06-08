// ignore_for_file: use_build_context_synchronously

import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:universal_io/io.dart';
import 'package:window_manager/window_manager.dart';

class TrayManager extends StatefulWidget {
  final Widget child;
  const TrayManager({
    super.key,
    required this.child,
  });

  @override
  State<TrayManager> createState() => _TrayManagerState();

  static Widget fromPlatform({required Widget child}) {
    if (isMobilePlatform) {
      return child;
    }
    return TrayManager(child: child);
  }
}

class _TrayManagerState extends State<TrayManager> with TrayListener {
  @override
  void initState() {
    trayManager.addListener(this);
    super.initState();
    initTray();
  }

  @override
  void dispose() {
    trayManager.removeListener(this);
    super.dispose();
  }

  Future<void> initTray() async {
    await trayManager.setIcon(
      Platform.isWindows
          ? 'assets/images/icons/tray_icon.ico'
          : 'assets/images/icons/tray_icon.png',
    );
    Menu menu = Menu(
      items: [
        MenuItem(disabled: true, label: context.locale.copyCatClipboard),
        MenuItem.separator(),
        MenuItem(
          key: 'show_window',
          label: context.locale.showWindow,
        ),
        MenuItem(
          key: 'hide_window',
          label: context.locale.hideWindow,
          toolTip: context.locale.hideWindowDesc,
        ),
        MenuItem.separator(),
        MenuItem(
          key: 'quit_app',
          label: context.locale.quit,
        ),
      ],
    );
    await trayManager.setContextMenu(menu);
  }

  @override
  Future<void> onTrayIconMouseDown() async {
    if (Platform.isWindows || Platform.isLinux) {
      await windowManager.show();
    } else {
      trayManager.popUpContextMenu();
    }
  }

  @override
  Future<void> onTrayIconRightMouseDown() async {
    trayManager.popUpContextMenu();
  }

  Future<void> quitApp() async {
    final result = await FlutterPlatformAlert.showCustomAlert(
      windowTitle: context.locale.copyCatClipboard,
      text: context.locale.quitDesc,
      positiveButtonTitle: context.locale.yes,
      negativeButtonTitle: context.locale.no,
    );

    if (result.name == "positiveButton") {
      exit(0);
    }
  }

  @override
  Future<void> onTrayMenuItemClick(MenuItem menuItem) async {
    switch (menuItem.key) {
      case "show_window":
        await windowManager.show();
        break;
      case "hide_window":
        await windowManager.hide();
        break;
      case "quit_app":
        await quitApp();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
