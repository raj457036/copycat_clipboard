import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/constants/strings/route_constants.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ExclusionRulesSwitchTile extends StatelessWidget {
  const ExclusionRulesSwitchTile({super.key});

  Future<void> onChanged(BuildContext context, bool value) async {
    final cubit = context.read<AppConfigCubit>();
    final granted = await cubit.focusWindow.isAccessibilityPermissionGranted();
    if (!granted) {
      await cubit.focusWindow.openAccessibilityPermissionSetting();
      return;
    }
    final config = cubit.exclusionRules.copyWith(enable: value);
    cubit.updateExclusionRule(config);
  }

  Future<void> openDetail(BuildContext context) async {
    context.goNamed(RouteConstants.exclusionRules);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppConfigCubit, AppConfigState, bool>(
      selector: (state) {
        switch (state) {
          case AppConfigLoaded(:final config):
            return config.copyExclusionRules.enable;
          default:
            return false;
        }
      },
      builder: (context, enabled) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListTile(
                title: const Text("Exclusion Rules"),
                subtitle: const Text(
                  "Prevent information from copying to clipboard. Tap to enter.",
                ),
                onTap: () => openDetail(context),
              ),
            ),
            const SizedBox(
              height: 55,
              child: VerticalDivider(
                width: 1,
                indent: 5,
                endIndent: 5,
              ),
            ),
            SizedBox(
              height: 55,
              child: InkWell(
                onTap: () => onChanged(context, !enabled),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: padding10),
                  child: Switch(
                    value: enabled,
                    onChanged: (value) => onChanged(context, value),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
