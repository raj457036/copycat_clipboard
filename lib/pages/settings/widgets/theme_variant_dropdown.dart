import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeVariantDropdown extends StatelessWidget {
  const ThemeVariantDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    final locale = context.locale;
    return ListTile(
      title: Text(locale.colorMode),
      subtitle: Text(
        locale.colorModeDesc,
        style: textTheme.bodySmall?.copyWith(
          color: colors.outline,
        ),
      ),
      trailing:
          BlocSelector<AppConfigCubit, AppConfigState, DynamicSchemeVariant>(
        selector: (state) {
          return state.config.themeVariant;
        },
        builder: (context, variant) {
          return DropdownButtonHideUnderline(
            child: DropdownButton<DynamicSchemeVariant>(
              value: variant,
              padding: const EdgeInsets.symmetric(horizontal: padding16),
              borderRadius: radius12,
              items: [
                DropdownMenuItem(
                  value: DynamicSchemeVariant.tonalSpot,
                  child: Text(locale.tonalSpot),
                ),
                DropdownMenuItem(
                  value: DynamicSchemeVariant.content,
                  child: Text(locale.content),
                ),
                DropdownMenuItem(
                  value: DynamicSchemeVariant.expressive,
                  child: Text(locale.expressive),
                ),
                DropdownMenuItem(
                  value: DynamicSchemeVariant.fidelity,
                  child: Text(locale.fidility),
                ),
                DropdownMenuItem(
                  value: DynamicSchemeVariant.fruitSalad,
                  child: Text(locale.fruitSalad),
                ),
                DropdownMenuItem(
                  value: DynamicSchemeVariant.monochrome,
                  child: Text(locale.monochrome),
                ),
                DropdownMenuItem(
                  value: DynamicSchemeVariant.neutral,
                  child: Text(locale.neutral),
                ),
                DropdownMenuItem(
                  value: DynamicSchemeVariant.rainbow,
                  child: Text(locale.rainbow),
                ),
                DropdownMenuItem(
                  value: DynamicSchemeVariant.vibrant,
                  child: Text(locale.vibrant),
                ),
              ],
              onChanged: (variant) {
                if (variant != null) {
                  final cubit = context.read<AppConfigCubit>();
                  cubit.setThemeColorVariant(variant);
                }
              },
            ),
          );
        },
      ),
      contentPadding: const EdgeInsets.only(
        left: padding16,
        right: padding4,
      ),
    );
  }
}
