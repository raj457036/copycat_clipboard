import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_io/io.dart';

class StartUpLaunchSwitch extends StatelessWidget {
  const StartUpLaunchSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    if (isMobilePlatform || Platform.isMacOS) return const SizedBox.shrink();
    return BlocSelector<AppConfigCubit, AppConfigState, bool>(
      selector: (state) {
        switch (state) {
          case AppConfigLoaded(:final config):
            return config.launchAtStartup;
          default:
            return false;
        }
      },
      builder: (context, state) {
        return SwitchListTile(
          value: state,
          onChanged: (value) {
            context.read<AppConfigCubit>().setLaunchAtStartup(value);
          },
          title: const Text("Launch at Startup"),
          subtitle: const Text(
            "Enable to start the app automatically when your device starts.",
          ),
        );
      },
    );
  }
}
