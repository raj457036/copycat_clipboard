import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeDropdown extends StatelessWidget {
  const ThemeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppConfigCubit, AppConfigState, ThemeMode>(
      selector: (state) {
        switch (state) {
          case AppConfigLoaded(:final config):
            return config.themeMode;
          default:
            return ThemeMode.system;
        }
      },
      builder: (context, state) {
        return DropdownButtonHideUnderline(
          child: DropdownButton<ThemeMode>(
            value: state,
            padding: const EdgeInsets.symmetric(horizontal: padding16),
            borderRadius: radius12,
            items: const [
              DropdownMenuItem(
                value: ThemeMode.system,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.contrast_rounded),
                    width12,
                    Text("System"),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: ThemeMode.light,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.light_mode_rounded),
                    width12,
                    Text("Light"),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: ThemeMode.dark,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.dark_mode_rounded),
                    width12,
                    Text("Dark"),
                  ],
                ),
              ),
            ],
            onChanged: (themeMode) {
              if (themeMode != null) {
                context.read<AppConfigCubit>().changeThemeMode(themeMode);
              }
            },
          ),
        );
      },
    );
  }
}
