import 'package:clipboard/widgets/window_focus_manager.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotkey_manager/hotkey_manager.dart';

class SystemShortcutListener extends StatelessWidget {
  final Widget child;

  const SystemShortcutListener({
    super.key,
    required this.child,
  });

  Future<void> toggleWindow(BuildContext context) async {
    final focusManager = WindowFocusManager.of(context);
    focusManager?.toggleWindow();
  }

  @override
  Widget build(BuildContext context) {
    if (isMobilePlatform) return child;

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
            if (hotKey == hotKey_) toggleWindow(context);
          },
        );
      },
      child: child,
    );
  }
}
