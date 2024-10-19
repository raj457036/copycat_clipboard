import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:universal_io/io.dart';
import 'package:window_manager_plus/window_manager_plus.dart';

class TrayManager extends StatefulWidget {
  final Widget child;
  const TrayManager({
    super.key,
    required this.child,
  });

  @override
  State<TrayManager> createState() => TrayManagerState();

  static Widget fromPlatform({required Widget child}) {
    if (isMobilePlatform) {
      return child;
    }
    return TrayManager(child: child);
  }

  static TrayManagerState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<TrayManagerState>();
}

class TrayManagerState extends State<TrayManager> with TrayListener {
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

  Future<void> createWindow() async {
    final newWindow = await WindowManagerPlus.createWindow([
      'pastestack',
      'Paste Stack',
    ]);
    if (newWindow != null) {
      print('New Created Window: $newWindow');
    }
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
        // MenuItem.separator(),
        MenuItem(
          key: 'paste_stack',
          label: 'Open Paste Stack',
        ),
        // MenuItem(
        //   key: 'hide_window',
        //   label: 'Hide Window',
        //   toolTip: "Tip: Use keyboard shortcut to show the clipboard.",
        // ),
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
    // final focusWindow = WindowFocusManager.of(context);
    await trayManager.popUpContextMenu();
    // await focusWindow?.toggleWindow();
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
    // final windowAction = context.windowAction;
    switch (menuItem.key) {
      case "paste_stack":
        await createWindow();

      // case "hide_window":
      //   await windowAction?.hide();

      case "quit_app":
        await quitApp();

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
