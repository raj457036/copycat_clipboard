import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:window_manager/window_manager.dart';

class SystemShortcutListener extends StatelessWidget {
  final Widget child;
  const SystemShortcutListener({
    super.key,
    required this.child,
  });

  Future<void> toggleWindow() async {
    if (await windowManager.isFocused()) {
      await windowManager.hide();
    } else {
      await windowManager.show();
      await windowManager.focus();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isMobile) return child;
    return BlocListener<AppConfigCubit, AppConfigState>(
      listenWhen: (previous, current) =>
          previous.config.toggleHotkey != current.config.toggleHotkey,
      listener: (context, state) async {
        final hotKey = state.config.getToggleHotkey;
        await hotKeyManager.unregisterAll();
        if (hotKey == null) return;
        await hotKeyManager.register(
          hotKey,
          keyDownHandler: (hotKey_) async {
            if (hotKey == hotKey_) toggleWindow();
          },
        );
      },
      child: child,
    );
  }
}
