import 'package:clipboard/pages/settings/widgets/exclusion_rules/exclude_custom_rules.dart';
import 'package:clipboard/pages/settings/widgets/setting_header.dart';
import 'package:clipboard/widgets/layout/custom_scaffold.dart';
import 'package:clipboard/widgets/scaffold_body.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/exclusion_rules/exclusion_rules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExclusionRulesPage extends StatelessWidget {
  const ExclusionRulesPage({super.key});

  Future<void> updateExclusionRules(
    BuildContext context,
    ExclusionRules rules,
  ) async {
    final cubit = context.read<AppConfigCubit>();
    final granted = await cubit.focusWindow.isAccessibilityPermissionGranted();
    if (!granted) {
      await cubit.focusWindow.openAccessibilityPermissionSetting();
      return;
    }
    cubit.updateExclusionRule(rules);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppConfigCubit, AppConfigState, ExclusionRules>(
      selector: (state) {
        return state.config.copyExclusionRules;
      },
      builder: (context, state) {
        final enable = state.enable;
        return CustomScaffold(
          activeIndex: 2,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: const Text("Exclusion Rules"),
            actions: [
              Switch(
                value: state.enable,
                onChanged: (value) {
                  updateExclusionRules(
                    context,
                    state.copyWith(enable: value),
                  );
                },
              ),
              width16,
            ],
          ),
          body: ScaffoldBody(
            child: Align(
              alignment: Alignment.centerLeft,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 650),
                child: ListView(
                  children: [
                    ExcludeCustomRules(enabled: enable),
                    const Divider(),
                    height8,
                    const SettingHeader(
                      // icon: Icons.filter_alt_rounded,
                      name: "Predefined Exclusion Rules",
                    ),
                    SwitchListTile(
                      title: const Text("Password Manager"),
                      value: state.passwordManager,
                      onChanged: enable
                          ? (value) {
                              updateExclusionRules(
                                context,
                                state.copyWith(passwordManager: value),
                              );
                            }
                          : null,
                    ),
                    SwitchListTile(
                      title: const Text("Common Password Patterns"),
                      value: state.passwords,
                      onChanged: enable
                          ? (value) {
                              updateExclusionRules(
                                context,
                                state.copyWith(passwords: value),
                              );
                            }
                          : null,
                    ),
                    SwitchListTile(
                      title: const Text("Credit Card Number"),
                      value: state.creditCard,
                      onChanged: enable
                          ? (value) {
                              updateExclusionRules(
                                context,
                                state.copyWith(creditCard: value),
                              );
                            }
                          : null,
                    ),
                    SwitchListTile(
                      title: const Text("Phone Number"),
                      value: state.phone,
                      onChanged: enable
                          ? (value) {
                              updateExclusionRules(
                                context,
                                state.copyWith(phone: value),
                              );
                            }
                          : null,
                    ),
                    SwitchListTile(
                      title: const Text("Email"),
                      value: state.email,
                      onChanged: enable
                          ? (value) {
                              updateExclusionRules(
                                context,
                                state.copyWith(email: value),
                              );
                            }
                          : null,
                    ),
                    SwitchListTile(
                      title: const Text("Bank Account Number"),
                      value: state.bankAccount,
                      onChanged: enable
                          ? (value) {
                              updateExclusionRules(
                                context,
                                state.copyWith(bankAccount: value),
                              );
                            }
                          : null,
                    ),
                    SwitchListTile(
                      title: const Text("Passport Number"),
                      value: state
                          .personalInfo, // TODO: Support more personal info
                      onChanged: enable
                          ? (value) {
                              updateExclusionRules(
                                context,
                                state.copyWith(personalInfo: value),
                              );
                            }
                          : null,
                    ),
                    SwitchListTile(
                      title: const Text("Sensitive Urls"),
                      value: state.sensitiveUrls,
                      onChanged: enable
                          ? (value) {
                              updateExclusionRules(
                                context,
                                state.copyWith(sensitiveUrls: value),
                              );
                            }
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
