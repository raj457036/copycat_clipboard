import 'package:clipboard/utils/utility.dart';
import 'package:flutter/material.dart';

class DesktopLifecycleOptimizer extends StatefulWidget {
  final Widget child;
  const DesktopLifecycleOptimizer({
    super.key,
    required this.child,
  });

  @override
  State<DesktopLifecycleOptimizer> createState() =>
      _DesktopLifecycleOptimizerState();
}

class _DesktopLifecycleOptimizerState extends State<DesktopLifecycleOptimizer>
    with WidgetsBindingObserver {
  bool mustRender = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      switch (state) {
        case AppLifecycleState.resumed:
          mustRender = true;
          break;
        default:
          mustRender = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isMobilePlatform || mustRender) return widget.child;
    return const Material(
      child: Center(
        child: CircleAvatar(),
      ),
    );
  }
}
