import 'package:clipboard/pages/settings/widgets/exclusion_rules/exclude_custom_rules.dart';
import 'package:clipboard/pages/settings/widgets/setting_header.dart';
import 'package:clipboard/widgets/layout/custom_scaffold.dart';
import 'package:clipboard/widgets/scaffold_body.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/exclusion_rules/exclusion_rules.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_io/io.dart';

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
            title: Text(context.locale.exclusionRules),
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
                    SettingHeader(
                      // icon: Icons.filter_alt_rounded,
                      name: context.locale.predefinedExclRules,
                    ),
                    SwitchListTile(
                      title: Text(context.locale.passwordManagers),
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
                    // SwitchListTile(
                    //   title: Text(context.locale.commonPasswordPatterns),
                    //   value: state.passwords,
                    //   onChanged: enable
                    //       ? (value) {
                    //           updateExclusionRules(
                    //             context,
                    //             state.copyWith(passwords: value),
                    //           );
                    //         }
                    //       : null,
                    // ),
                    SwitchListTile(
                      title: Text(context.locale.creditCardNumber),
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
                      title: Text(context.locale.phoneNumber),
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
                      title: Text(context.locale.email),
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
                    // SwitchListTile(
                    //   title: Text(context.locale.bankAccountNumber),
                    //   value: state.bankAccount,
                    //   onChanged: enable
                    //       ? (value) {
                    //           updateExclusionRules(
                    //             context,
                    //             state.copyWith(bankAccount: value),
                    //           );
                    //         }
                    //       : null,
                    // ),
                    // SwitchListTile(
                    //   title: Text(context.locale.passportNumber),
                    //   value: state
                    //       .personalInfo, // TODO: Support more personal info
                    //   onChanged: enable
                    //       ? (value) {
                    //           updateExclusionRules(
                    //             context,
                    //             state.copyWith(personalInfo: value),
                    //           );
                    //         }
                    //       : null,
                    // ),
                    if (Platform.isMacOS)
                      SwitchListTile(
                        title: Text(context.locale.sensitiveUrls),
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
