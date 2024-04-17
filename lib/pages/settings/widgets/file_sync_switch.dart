import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/pages/settings/widgets/issue_card.dart';
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
            if (enableFileSync && enableSync)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: padding16),
                child: IssueCard(
                  color: Colors.deepOrange,
                  description:
                      "Google Drive not connected, File and media syncing is disabled.\n\n"
                      "Note: Your files and media are synced securely across "
                      "devices using Google Drive to protect your privacy.",
                ),
              ),
            if (enableFileSync && enableSync)
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.read<CloudPersistanceCubit>().connectDrive();
                  },
                  icon: const Icon(Icons.add_to_drive_rounded),
                  label: const Text("Connect Google Drive"),
                ),
              ),
          ],
        );
      },
    );
  }
}
