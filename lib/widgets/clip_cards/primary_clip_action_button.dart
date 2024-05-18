import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:clipboard/widgets/window_focus_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrimaryClipActionButton extends StatelessWidget {
  final ClipboardItem item;
  const PrimaryClipActionButton({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppConfigCubit, AppConfigState, bool>(
      selector: (state) {
        return state.config.lastFocusedWindowId != null &&
            state.config.smartPaste;
      },
      builder: (context, hasFocusForPaste) {
        if (hasFocusForPaste) {
          final focusManager = WindowFocusManager.of(context);
          return IconButton(
            icon: const Icon(Icons.paste),
            onPressed: () async {
              await copyToClipboard(context, item, noAck: true);
              await Future.delayed(Durations.short1);
              final unfocused = await focusManager?.toggleWindow();
              if (unfocused == true) {
                await focusManager?.pasteOnFocusedWindow();
              }
            },
            tooltip: "Paste",
            style: IconButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                ),
              ),
            ),
          );
        }
        return IconButton(
          icon: const Icon(Icons.copy),
          onPressed: () => copyToClipboard(context, item),
          tooltip: "Copy",
          style: IconButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
              ),
            ),
          ),
        );
      },
    );
  }
}
