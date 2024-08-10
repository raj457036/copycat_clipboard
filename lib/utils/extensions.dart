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
