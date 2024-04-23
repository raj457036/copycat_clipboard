import 'package:clipboard/constants/numbers/breakpoints.dart';
import 'package:flutter/material.dart';

typedef DynamicWidgetBuilder = Widget Function(
    BuildContext context, bool isDialog);

class DynamicPage<T> extends Page<T> {
  final Offset? anchorPoint;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String? barrierLabel;
  final bool useSafeArea;
  final CapturedThemes? themes;
  final DynamicWidgetBuilder builder;
  final bool fullScreenDialog;

  const DynamicPage({
    required this.builder,
    this.anchorPoint,
    this.barrierColor = Colors.black87,
    this.barrierDismissible = true,
    this.barrierLabel,
    this.useSafeArea = true,
    this.fullScreenDialog = false,
    this.themes,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width;

    if (Breakpoints.isMobile(width)) {
      return MaterialPageRoute<T>(
        settings: this,
        builder: (context) => builder(context, false),
        fullscreenDialog: fullScreenDialog,
        maintainState: true,
        barrierDismissible: barrierDismissible,
      );
    }

    return DialogRoute<T>(
      context: context,
      settings: this,
      builder: (context) => Dialog(
        child: builder(context, true),
      ),
      anchorPoint: anchorPoint,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      themes: themes,
    );
  }
}
