import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartUpLaunchSwitch extends StatelessWidget {
  const StartUpLaunchSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    if (isMobilePlatform) return const SizedBox.shrink();

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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(context.locale.launchAtStartup),
              width8,
              const ExperimentalBadge(),
            ],
          ),
          subtitle: Text(
            context.locale.launchAtStartupDesc,
          ),
        );
      },
    );
  }
}
