import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExcludeSensitiveInfoSwitchTile extends StatelessWidget {
  const ExcludeSensitiveInfoSwitchTile({super.key});

  void onChanged(BuildContext context, bool value) {
    final cubit = context.read<AppConfigCubit>();
    final config = cubit.exclusionRules.copyWith(sensitiveInfo: value);
    cubit.updateExclusionRule(config);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppConfigCubit, AppConfigState, bool>(
      selector: (state) {
        switch (state) {
          case AppConfigLoaded(:final config):
            return config.copyExclusionRules.sensitiveInfo;
          default:
            return false;
        }
      },
      builder: (context, enabled) {
        return SwitchListTile(
          value: enabled,
          onChanged: (value) => onChanged(context, value),
          title: const Text("Exclude Sensitive Information"),
          subtitle: const Text(
            "Prevent passwords and sensitive data from being copied",
          ),
        );
      },
    );
  }
}
