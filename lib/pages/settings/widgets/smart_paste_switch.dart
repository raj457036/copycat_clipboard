import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmartPasteSwitch extends StatelessWidget {
  const SmartPasteSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    if (isMobilePlatform) return const SizedBox.shrink();
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
          onChanged: (value) {
            context.read<AppConfigCubit>().toggleSmartPaste(value);
          },
          title: Text(context.locale.smartPaste),
          subtitle: Text(
            context.locale.smartPasteDesc,
          ),
        );
      },
    );
  }
}
