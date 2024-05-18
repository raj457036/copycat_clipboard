import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class MinimizeWindowButton extends StatelessWidget {
  const MinimizeWindowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        windowManager.minimize();
      },
      icon: const Icon(Icons.minimize),
      tooltip: "Minimize",
    );
  }
}
