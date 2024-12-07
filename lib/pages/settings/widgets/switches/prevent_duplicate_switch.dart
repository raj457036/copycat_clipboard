import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreventDuplicateSwitchTile extends StatelessWidget {
  const PreventDuplicateSwitchTile({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppConfigCubit>();
    return BlocSelector<AppConfigCubit, AppConfigState, bool>(
      selector: (state) {
        switch (state) {
          case AppConfigLoaded(:final config):
            return config.duplicatePrevention;
          default:
            return false;
        }
      },
      builder: (context, enabled) {
        return SwitchListTile(
          value: enabled,
          onChanged: cubit.togglePreventDuplication,
          title: Text("Avoid Immediate Duplicates"),
          subtitle: Text("Avoid copying the same content twice in a row"),
        );
      },
    );
  }
}
