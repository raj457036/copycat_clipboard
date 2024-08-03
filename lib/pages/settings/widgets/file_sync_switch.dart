import 'package:clipboard/pages/settings/widgets/dont_upload_over.dart';
import 'package:clipboard/pages/settings/widgets/google_drive_setup.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/l10n/l10n.dart';
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
              title: Text(context.locale.syncFiles),
              subtitle: Text(context.locale.syncFilesDesc),
            ),
            if (enableFileSync && enableSync) const GoogleDriveSetup(),
            if (enableFileSync && enableSync) const DontAutoUploadOver(),
          ],
        );
      },
    );
  }
}
