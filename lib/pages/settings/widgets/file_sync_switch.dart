import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/pages/settings/widgets/google_drive_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnableFileSyncSwitch extends StatelessWidget {
  const EnableFileSyncSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppConfigCubit, AppConfigState, (bool, bool)>(
      selector: (state) {
        switch (state) {
          case AppConfigLoaded(:final config):
            return (config.enableSync, config.enableFileSync);
          default:
            return (false, false);
        }
      },
      builder: (context, state) {
        final (enableSync, enableFileSync) = state;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SwitchListTile(
              value: enableFileSync,
              onChanged: enableSync
                  ? (value) {
                      context.read<AppConfigCubit>().changeFileSync(value);
                    }
                  : null,
              title: const Text("Sync Files and Medias"),
              subtitle: const Text(
                "Keep your files and media items updated across devices.",
              ),
            ),
            if (enableFileSync && enableSync) const GoogleDriveSetup(),
          ],
        );
      },
    );
  }
}
