import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleDropdownTile extends StatelessWidget {
  const LocaleDropdownTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(context.locale.language),
      trailing: BlocSelector<AppConfigCubit, AppConfigState, Locale>(
        selector: (state) {
          switch (state) {
            case AppConfigLoaded(:final config):
              if (config.locale.isEmpty) return const Locale("en");
              return Locale(config.locale);
            default:
              return const Locale("en");
          }
        },
        builder: (context, state) {
          return DropdownButtonHideUnderline(
            child: DropdownButton<Locale>(
              value: state,
              enableFeedback: true,
              icon: const Icon(Icons.arrow_drop_down_rounded),
              padding: const EdgeInsets.symmetric(horizontal: padding16),
              borderRadius: radius12,
              items: [
                DropdownMenuItem(
                  value: const Locale("en"),
                  child: Text(context.locale.en),
                ),
                DropdownMenuItem(
                  value: const Locale("es"),
                  child: Text(context.locale.es),
                ),
                DropdownMenuItem(
                  value: const Locale("fr"),
                  child: Text(context.locale.fr),
                ),
                DropdownMenuItem(
                  value: const Locale("de"),
                  child: Text(context.locale.de),
                ),
              ],
              onChanged: (locale) {
                if (locale != null) {
                  context.read<AppConfigCubit>().changeLocale(
                        locale.languageCode,
                      );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
