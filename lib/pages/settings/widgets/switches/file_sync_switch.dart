import 'package:clipboard/pages/settings/widgets/dropdowns/dont_upload_over_dropdown.dart';
import 'package:clipboard/pages/settings/widgets/google_drive_setup.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnableFileSyncSwitch extends StatelessWidget {
  const EnableFileSyncSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    final cubit = context.read<AppConfigCubit>();
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
              onChanged: enableSync ? cubit.changeFileSync : null,
              title: Text(context.locale.syncFiles),
              subtitle: Text(
                context.locale.syncFilesDesc,
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.outline,
                ),
              ),
            ),
            if (enableFileSync && enableSync) const GoogleDriveSetup(),
            if (enableFileSync && enableSync)
              const DontAutoUploadOverDropdown(),
          ],
        );
      },
    );
  }
}
