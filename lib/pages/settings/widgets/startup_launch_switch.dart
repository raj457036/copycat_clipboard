import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartUpLaunchSwitch extends StatelessWidget {
  const StartUpLaunchSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    if (isMobilePlatform) return const SizedBox.shrink();
    final textTheme = context.textTheme;
    final colors = context.colors;
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
          title: Wrap(
            spacing: 10,
            children: [
              Text(context.locale.launchAtStartup),
              Tooltip(
                message: context.locale.experimentalDescription,
                child: Chip(
                  label: Text(context.locale.experimental),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.zero,
                  backgroundColor: colors.primary,
                  labelStyle: textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
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
