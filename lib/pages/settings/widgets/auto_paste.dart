import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutoPasteSwitch extends StatelessWidget {
  const AutoPasteSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    if (isMobile) return const SizedBox.shrink();
    return BlocSelector<AppConfigCubit, AppConfigState, bool>(
      selector: (state) {
        switch (state) {
          case AppConfigLoaded(:final config):
            return config.autoPaste;
          default:
            return false;
        }
      },
      builder: (context, state) {
        return SwitchListTile(
          value: state,
          onChanged: (value) {
            context.read<AppConfigCubit>().toggleAutoPaste(value);
          },
          title: const Text("Enable Auto Paste"),
          subtitle:
              const Text("Show paste button when possible to automatically"
                  " paste the selected item."),
        );
      },
    );
  }
}
