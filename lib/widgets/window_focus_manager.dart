import 'dart:async';

import 'package:clipboard/di/di.dart';
import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/debounce.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_window/focus_window.dart';
import 'package:window_manager_plus/window_manager_plus.dart';

class WindowFocusManager extends StatefulWidget {
  final Widget child;
  final FocusWindow focusWindow;

  const WindowFocusManager({
    super.key,
    required this.focusWindow,
    required this.child,
  });

  static Widget fromPlatform({required Widget child}) {
    if (isMobilePlatform) {
      return child;
    }
    return WindowFocusManager(
      focusWindow: sl(),
      child: child,
    );
  }

  static WindowFocusManagerState? of(BuildContext context) {
    return context.findAncestorStateOfType<WindowFocusManagerState>();
  }

  @override
  State<WindowFocusManager> createState() => WindowFocusManagerState();
}

class WindowFocusManagerState extends State<WindowFocusManager>
    with WindowListener {
  int? lastWindowId;
  StreamSubscription? subscription;
  final debounce = Debouncer(milliseconds: 650);

  late final AppConfigCubit appConfigCubit;

  Future<void> toggleAndPaste(ClipboardItem item) async {
    await copyToClipboard(context, item, noAck: true);
    final unfocused = await toggleWindow();
    await Future.delayed(Durations.short1);
    if (unfocused == true) {
      await pasteOnFocusedWindow();
    }
  }

  @override
  Future<dynamic> onEventFromWindow(
      String eventName, int fromWindowId, dynamic arguments) async {
    print(
        '[${WindowManagerPlus.current}] Event $eventName from Window $fromWindowId with arguments $arguments');
    return 'Hello from ${WindowManagerPlus.current}';
  }

  Future<void> restore() async {
    if (lastWindowId != null) {
      final windowId = lastWindowId;
      context.windowAction?.hide();
      await widget.focusWindow.setActiveWindowId(windowId!);
    }
  }

  Future<void> pasteOnFocusedWindow() async {
    await widget.focusWindow.pasteContent();
  }

  /// returns true when unfocused and false when focused
  Future<bool> toggleWindow() async {
    final windowAction = context.windowAction;
    final bool focused = windowAction?.isFocused ?? false;

    // if (Platform.isLinux) {
    //   focused = await WindowManagerPlus.current.isVisible();
    // } else {
    //   focused = await WindowManagerPlus.current.isFocused();
    // }
    if (focused) {
      await windowAction?.hide();
      await restore();
      return true;
    } else {
      await record();
      await windowAction?.show();
      return false;
    }
  }

  Future<void> record() async {
    lastWindowId = await widget.focusWindow.getActiveWindowId();
    appConfigCubit.setLastFocusedWindowId(lastWindowId);
    await Future.delayed(Durations.short2);
  }

  @override
  Future<void> onWindowClose([int? windowId]) async {
    bool isPreventClose = await WindowManagerPlus.current.isPreventClose();
    if (isPreventClose && mounted) {
      context.windowAction?.hide();
    }
  }

  @override
  void onWindowFocus([int? windowId]) {
    // Make sure to call once.
    setState(() {});
    context.windowAction?.isFocused = true;
  }

  Future<void> onResized() async {
    final appConfig = context.read<AppConfigCubit>();
    final size = await WindowManagerPlus.current.getSize();
    appConfig.changeWindowSize(
      width: size.width,
      height: size.height,
    );
  }

  @override
  void onWindowResize([int? windowId]) {
    if (context.windowAction?.isFocused ?? false) {
      debounce(onResized);
    }
  }

  @override
  void onWindowBlur([int? windowId]) {
    context.windowAction?.hide();
    lastWindowId = null;
    appConfigCubit.setLastFocusedWindowId(lastWindowId);
  }

  void onFocuswindowChange(data) {
    print(data);
  }

  @override
  void initState() {
    super.initState();
    WindowManagerPlus.current.addListener(this);
    WindowManagerPlus.current.setPreventClose(true);
    appConfigCubit = context.read();
  }

  @override
  void dispose() {
    subscription?.cancel();
    widget.focusWindow.stopObserver();
    WindowManagerPlus.current.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
