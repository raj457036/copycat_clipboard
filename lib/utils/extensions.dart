import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:go_router/go_router.dart';
import 'package:window_manager/window_manager.dart';

extension WindowManagerExtenstion on WindowManager {
  Future<void> toggle() async {
    final isVisible_ = await isVisible();
    if (isVisible_) {
      await hide();
    } else {
      await show();
    }
  }
}

extension ColorExtensions on Color {
  String toHex(
          {bool includeHashSign = false,
          bool enableAlpha = true,
          bool toUpperCase = true}) =>
      colorToHex(
        this,
        includeHashSign: includeHashSign,
        enableAlpha: enableAlpha,
        toUpperCase: toUpperCase,
      );
}

extension GoRouterExtension on GoRouter {
  String location() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    final String? location = matchList.last.route.name;
    return location ?? "";
  }
}

extension BuildContextExtension on BuildContext {
  String get location {
    return GoRouter.of(this).location();
  }
}
