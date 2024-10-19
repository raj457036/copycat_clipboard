import 'dart:ui';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:window_manager_plus/window_manager_plus.dart';

extension WindowManagerExtenstion on WindowManagerPlus {
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
