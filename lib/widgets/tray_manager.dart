import 'package:clipboard/widgets/window_focus_manager.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:universal_io/io.dart';

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

  String get icon {
    if (paused) {
      return Platform.isWindows
          ? 'assets/images/icons/tray_icon_paused.ico'
          : 'assets/images/icons/tray_icon_paused.png';
    }
    return Platform.isWindows
        ? 'assets/images/icons/tray_icon.ico'
        : 'assets/images/icons/tray_icon.png';
  }

  void togglePause() {
    setState(() {
      paused = !paused;
    });
    initTray();
  }

  Future<void> initTray() async {
    await trayManager.setIcon(icon);
    Menu menu = Menu(
      items: [
        MenuItem(disabled: true, label: "CopyCat Clipboard"),
        // MenuItem.separator(),
        // MenuItem(
        //   key: 'show_window',
        //   label: 'Show Window',
        // ),
        // MenuItem.checkbox(
        //   checked: paused,
        //   key: 'pause_copycat',
        //   label: "Paused",
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
    final focusWindow = WindowFocusManager.of(context);
    await focusWindow?.toggleWindow();
    trayManager.popUpContextMenu();
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
    final windowAction = context.windowAction;
    switch (menuItem.key) {
      case "show_window":
        await windowAction?.show();

      case "pause_copycat":
        togglePause();

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
