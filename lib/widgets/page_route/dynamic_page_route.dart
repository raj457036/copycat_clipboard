import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DynamicPage<T> extends CustomTransitionPage<T> {
  final Offset? anchorPoint;
  final bool useSafeArea;
  final CapturedThemes? themes;
  final bool fullScreenDialog;

  DynamicPage({
    required super.child,
    this.anchorPoint,
    this.useSafeArea = true,
    this.fullScreenDialog = false,
    this.themes,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  }) : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              ScaleTransition(
            scale: animation,
            child: child,
          ),
          barrierColor: Colors.black54,
          barrierDismissible: true,
        );

  @override
  Route<T> createRoute(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width;

    if (Breakpoints.isMobile(width)) {
      return MaterialPageRoute<T>(
        settings: this,
        builder: (context) => child,
        fullscreenDialog: false,
        maintainState: true,
        barrierDismissible: barrierDismissible,
      );
    }

    return DialogRoute<T>(
      context: context,
      settings: this,
      builder: (context) => Dialog(child: child),
      anchorPoint: anchorPoint,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      themes: themes,
    );
  }
}
