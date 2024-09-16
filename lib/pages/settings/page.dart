import 'package:clipboard/pages/settings/sections/customization_settings.dart';
import 'package:clipboard/pages/settings/sections/experimental_settings.dart';
import 'package:clipboard/pages/settings/sections/general_settings.dart';
import 'package:clipboard/pages/settings/sections/security_settings.dart';
import 'package:clipboard/pages/settings/sections/syncing_settings.dart';
import 'package:clipboard/widgets/account_detail_button.dart';
import 'package:clipboard/widgets/layout/custom_scaffold.dart';
import 'package:clipboard/widgets/local_user.dart';
import 'package:clipboard/widgets/logout_button.dart';
import 'package:clipboard/widgets/scaffold_body.dart';
import 'package:clipboard/widgets/subscription/active_plan.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return DefaultTabController(
      length: 5,
      child: CustomScaffold(
        activeIndex: 3,
        appBar: AppBar(
          backgroundColor: colors.surface,
          scrolledUnderElevation: 0,
          title: Text(context.locale.settings),
          actions: const [
            ActivePlanAction(),
            width12,
            DisableForLocalUser(child: AccountDetailButton()),
            width12,
            LogoutButton(),
            width12,
          ],
        ),
        body: ScaffoldBody(
          margin: const EdgeInsets.only(
            right: padding12,
          ),
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: [
                  Tab(text: context.locale.general),
                  Tab(text: context.locale.customization),
                  Tab(text: context.locale.syncingLabel),
                  const Tab(text: "Security"),
                  Tab(text: context.locale.experimentalLabel),
                ],
              ),
              const Expanded(
                child: TabBarView(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GeneralSettings(),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomizationSettings(),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SyncingSettings(),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SecuritySettings(),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ExperimentalSettings(),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
