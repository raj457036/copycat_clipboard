import 'dart:ui' as ui;

import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class OrientationListener extends StatefulWidget {
  final Widget child;
  const OrientationListener({
    super.key,
    required this.child,
  });

  @override
  State<OrientationListener> createState() => _OrientationListenerState();
}

class _OrientationListenerState extends State<OrientationListener>
    with WidgetsBindingObserver {
  ui.FlutterView? _view;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _view = View.maybeOf(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _view = null;
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final ui.Display? display = _view?.display;
    if (display == null) {
      return;
    }
    if (display.size.width / display.devicePixelRatio < Breakpoints.xs) {
      SystemChrome.setPreferredOrientations(<DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } else {
      SystemChrome.setPreferredOrientations(<DeviceOrientation>[]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
