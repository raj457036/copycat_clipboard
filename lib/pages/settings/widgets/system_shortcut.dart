import 'package:clipboard/widgets/dialogs/record_keyboard_shortcut.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotkey_manager/hotkey_manager.dart';

class SetupToggleHotKey extends StatelessWidget {
  const SetupToggleHotKey({super.key});

  @override
  Widget build(BuildContext context) {
    if (isMobilePlatform) return const SizedBox.shrink();
    final textTheme = context.textTheme;
    final colors = context.colors;
    return BlocSelector<AppConfigCubit, AppConfigState, HotKey?>(
      selector: (state) {
        return state.config.getToggleHotkey;
      },
      builder: (context, state) {
        return SwitchListTile(
          title: Text(context.locale.clipboardShortcut),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height4,
              Text(
                context.locale.clipboardShortcutDesc,
                style: textTheme.bodySmall?.copyWith(
                  color: colors.outline,
                ),
              ),
              height6,
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    context.locale.clipboardShortcutPreview(
                      state == null ? context.locale.unassigned : '',
                    ),
                    maxLines: 2,
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
