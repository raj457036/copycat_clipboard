import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeVariantDropdown extends StatelessWidget {
  const ThemeVariantDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    return ListTile(
      title: const Text("Color Mode"),
      subtitle: Text(
        "Select the color mode to customize the appearance of the app. The default option is Tonal Spot.",
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
              items: const [
                DropdownMenuItem(
                  value: DynamicSchemeVariant.tonalSpot,
                  child: Text("Tonal Spot"),
                ),
                DropdownMenuItem(
                  value: DynamicSchemeVariant.content,
                  child: Text("Content"),
                ),
                DropdownMenuItem(
                  value: DynamicSchemeVariant.expressive,
                  child: Text("Expressive"),
                ),
                DropdownMenuItem(
                  value: DynamicSchemeVariant.fidelity,
                  child: Text("Fidelity"),
                ),
                DropdownMenuItem(
                  value: DynamicSchemeVariant.fruitSalad,
                  child: Text("Fruit Salad"),
                ),
                DropdownMenuItem(
                  value: DynamicSchemeVariant.monochrome,
                  child: Text("Monochrome"),
                ),
                DropdownMenuItem(
                  value: DynamicSchemeVariant.neutral,
                  child: Text("Neutral"),
                ),
                DropdownMenuItem(
                  value: DynamicSchemeVariant.rainbow,
                  child: Text("Rainbow"),
                ),
                DropdownMenuItem(
                  value: DynamicSchemeVariant.vibrant,
                  child: Text("Vibrant"),
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
