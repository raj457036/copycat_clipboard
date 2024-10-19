import 'dart:async';

import 'package:copycat_base/common/logging.dart';
import 'package:flutter/material.dart';
import 'package:window_manager_plus/window_manager_plus.dart';

class PasteStackWindowFocusManager extends StatefulWidget {
  final Widget child;

  const PasteStackWindowFocusManager({
    super.key,
    required this.child,
  });

  static PasteStackWindowFocusManagerState? of(BuildContext context) {
    return context.findAncestorStateOfType<PasteStackWindowFocusManagerState>();
  }

  @override
  State<PasteStackWindowFocusManager> createState() =>
      PasteStackWindowFocusManagerState();
}

class PasteStackWindowFocusManagerState
    extends State<PasteStackWindowFocusManager> with WindowListener {
  @override
  Future<dynamic> onEventFromWindow(
      String eventName, int fromWindowId, dynamic arguments) async {
    print(
        '[${WindowManagerPlus.current}] Event $eventName from Window $fromWindowId with arguments $arguments');
    return 'Hello from ${WindowManagerPlus.current}';
  }

  @override
  Future<void> onWindowClose([int? windowId]) async {
    logger.w("CLOSE WINDOW: $windowId");
  }

  @override
  void initState() {
    super.initState();
    WindowManagerPlus.current.addListener(this);
  }

  @override
  void dispose() {
    WindowManagerPlus.current.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class PasteStackApp extends StatelessWidget {
  const PasteStackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const PasteStackWindowFocusManager(
      child: MaterialApp(
        home: Scaffold(
          body: Center(child: Text("Hello World")),
        ),
      ),
    );
  }
}
