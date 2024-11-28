import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_io/io.dart';

class SmartPasteSwitch extends StatelessWidget {
  const SmartPasteSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    if (isMobilePlatform || Platform.isLinux) return const SizedBox.shrink();
    final textTheme = context.textTheme;
    final colors = context.colors;
    return BlocSelector<AppConfigCubit, AppConfigState, bool>(
      selector: (state) {
        switch (state) {
          case AppConfigLoaded(:final config):
            return config.smartPaste;
          default:
            return false;
        }
      },
      builder: (context, state) {
        return SwitchListTile(
          value: state,
          onChanged: (value) async {
            final cubit = context.read<AppConfigCubit>();
            final hasPermission =
                await cubit.focusWindow.requestAccessibilityPermission();
            if (hasPermission) {
              cubit.toggleSmartPaste(value);
            }
          },
          title: Text(context.locale.smartPaste),
          subtitle: Text(
            context.locale.smartPasteDesc,
            style: textTheme.bodyMedium?.copyWith(
              color: colors.outline,
            ),
          ),
        );
      },
    );
  }
}
