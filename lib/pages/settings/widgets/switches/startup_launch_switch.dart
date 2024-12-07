import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartUpLaunchSwitch extends StatelessWidget {
  const StartUpLaunchSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    if (isMobilePlatform) return const SizedBox.shrink();
    final textTheme = context.textTheme;
    final colors = context.colors;
    final cubit = context.read<AppConfigCubit>();
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
          onChanged: cubit.setLaunchAtStartup,
          title: Text(context.locale.launchAtStartup),
          subtitle: Text(
            context.locale.launchAtStartupDesc,
            style: textTheme.bodyMedium?.copyWith(
              color: colors.outline,
            ),
          ),
        );
      },
    );
  }
}
