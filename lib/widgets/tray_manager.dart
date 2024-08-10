import 'package:clipboard/utils/extensions.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool paused = false;

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
        MenuItem(disabled: true, label: "CopyCat Clipboard"),
        MenuItem.separator(),
        MenuItem(
          key: 'show_window',
          label: 'Show Window',
        ),
        MenuItem(
          key: 'hide_window',
          label: 'Hide Window',
          toolTip: "Tip: Use keyboard shortcut to show the clipboard.",
        ),
        MenuItem.separator(),
        MenuItem(
          key: 'quit_app',
          label: 'Quit',
        ),
      ],
    );
    await trayManager.setContextMenu(menu);
  }

  @override
  Future<void> onTrayIconMouseDown() async {
    await windowManager.toggle();
  }

  @override
  Future<void> onTrayIconRightMouseDown() async {
    trayManager.popUpContextMenu();
  }

  Future<void> quitApp() async {
    final result = await FlutterPlatformAlert.showCustomAlert(
      windowTitle: 'CopyCat Clipboard',
      text: 'Are you sure you want to quit?',
      positiveButtonTitle: "Yes",
      negativeButtonTitle: "No",
    );

    if (result.name == "positiveButton") {
      await SystemNavigator.pop(animated: true);
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
