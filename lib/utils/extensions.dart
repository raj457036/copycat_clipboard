import 'dart:ui';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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
