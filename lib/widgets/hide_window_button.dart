import 'package:clipboard/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class HideWindowButton extends StatelessWidget {
  const HideWindowButton({
    super.key,
  });

  Future<void> hideWindow() async {
    await windowManager.hide();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: hideWindow,
      icon: const Icon(Icons.visibility_off_rounded),
      tooltip: context.locale.hideWindow,
    );
  }
}
