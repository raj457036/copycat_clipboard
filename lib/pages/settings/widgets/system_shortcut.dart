import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/dialogs/record_keyboard_shortcut.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotkey_manager/hotkey_manager.dart';

class SetupToggleHotKey extends StatelessWidget {
  const SetupToggleHotKey({super.key});

  @override
  Widget build(BuildContext context) {
    if (isMobile) return const SizedBox.shrink();
    final textTheme = context.textTheme;
    final colors = context.colors;
    return BlocSelector<AppConfigCubit, AppConfigState, HotKey?>(
      selector: (state) {
        return state.config.getToggleHotkey;
      },
      builder: (context, state) {
        return SwitchListTile(
          title: const Text("Clipboard Shortcut"),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height4,
              Text(
                "Effortlessly Access Clipboard Anywhere",
                style: textTheme.bodySmall?.copyWith(
                  color: colors.outline,
                ),
              ),
              height6,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Current Shortcut Key : ${state == null ? 'Unassigned' : ''}",
                    style: textTheme.bodySmall?.copyWith(
                      color: colors.outline,
                    ),
                  ),
                  if (state != null) HotKeyVirtualView(hotKey: state),
                ],
              )
            ],
          ),
          value: state != null,
          onChanged: (_) async {
            final cubit = BlocProvider.of<AppConfigCubit>(context);

            if (!_) {
              await cubit.setClipboardToggleHotkey(null);
              return;
            }

            final hotKey =
                await const RecordKeyboardShortcutDialog().open(context);
            if (hotKey != null) {
              await cubit.setClipboardToggleHotkey(hotKey);
            }
          },
        );
      },
    );
  }
}
