import 'package:clipboard/widgets/badges.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_pro/widgets/subscription/subscription_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeVariantDropdown extends StatelessWidget {
  const ThemeVariantDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    return SubscriptionBuilder(builder: (context, subscription) {
      final hasAccess =
          subscription != null && subscription.isActive && subscription.theming;
      return ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(context.locale.colorMode),
            width8,
            const ProBadge(),
          ],
        ),
        subtitle: Text(
          context.locale.colorModeDesc,
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
                    child: Text(context.locale.tonalSpot),
                  ),
                  DropdownMenuItem(
                    value: DynamicSchemeVariant.content,
                    child: Text(context.locale.content),
                  ),
                  DropdownMenuItem(
                    value: DynamicSchemeVariant.expressive,
                    child: Text(context.locale.expressive),
                  ),
                  DropdownMenuItem(
                    value: DynamicSchemeVariant.fidelity,
                    child: Text(context.locale.fidility),
                  ),
                  DropdownMenuItem(
                    value: DynamicSchemeVariant.fruitSalad,
                    child: Text(context.locale.fruitSalad),
                  ),
                  DropdownMenuItem(
                    value: DynamicSchemeVariant.monochrome,
                    child: Text(context.locale.monochrome),
                  ),
                  DropdownMenuItem(
                    value: DynamicSchemeVariant.neutral,
                    child: Text(context.locale.neutral),
                  ),
                  DropdownMenuItem(
                    value: DynamicSchemeVariant.rainbow,
                    child: Text(context.locale.rainbow),
                  ),
                  DropdownMenuItem(
                    value: DynamicSchemeVariant.vibrant,
                    child: Text(context.locale.vibrant),
                  ),
                ],
                onChanged: hasAccess
                    ? (variant) {
                        if (variant != null) {
                          final cubit = context.read<AppConfigCubit>();
                          cubit.setThemeColorVariant(variant);
                        }
                      }
                    : null,
              ),
            );
          },
        ),
        contentPadding: const EdgeInsets.only(
          left: padding16,
          right: padding4,
        ),
      );
    });
  }
}
