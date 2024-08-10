import 'package:clipboard/di/di.dart';
import 'package:clipboard/pages/settings/widgets/dont_copy_over.dart';
import 'package:clipboard/pages/settings/widgets/e2ee_settings.dart';
import 'package:clipboard/pages/settings/widgets/enable_sync_switch.dart';
import 'package:clipboard/pages/settings/widgets/file_sync_switch.dart';
import 'package:clipboard/pages/settings/widgets/pause_till.dart';
import 'package:clipboard/pages/settings/widgets/setting_header.dart';
import 'package:clipboard/pages/settings/widgets/smart_paste_switch.dart';
import 'package:clipboard/pages/settings/widgets/startup_launch_switch.dart';
import 'package:clipboard/pages/settings/widgets/sync_interval.dart';
import 'package:clipboard/pages/settings/widgets/system_shortcut.dart';
import 'package:clipboard/pages/settings/widgets/theme_dropdown.dart';
import 'package:clipboard/widgets/account_detail_button.dart';
import 'package:clipboard/widgets/local_user.dart';
import 'package:clipboard/widgets/locale_dropdown.dart';
import 'package:clipboard/widgets/logout_button.dart';
import 'package:clipboard/widgets/scaffold_body.dart';
import 'package:clipboard/widgets/subscription/active_plan.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/constants/strings/asset_constants.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final info = sl<PackageInfo>();
    final version = info.version;
    final build = info.buildNumber;
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    final colors = context.colors;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.surface,
        scrolledUnderElevation: 0,
        title: Text(context.locale.settings),
        actions: [
          ActivePlanAction(compact: isMobile),
          width12,
          const DisableForLocalUser(child: AccountDetailButton()),
          width12,
          const LogoutButton(),
          width12,
        ],
      ),
      body: ScaffoldBody(
        margin: const EdgeInsets.only(
          right: padding12,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: padding16),
            child: LayoutBuilder(builder: (context, constraints) {
              final isTablet = Breakpoints.isMobile(constraints.maxWidth) ||
                  Breakpoints.isTablet(constraints.maxWidth);
              final halfWidth = isTablet ? 890.0 : constraints.maxWidth / 2;

              return Flex(
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: isTablet ? Axis.vertical : Axis.horizontal,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: halfWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SettingHeader(
                          name: context.locale.basicLocal,
                          tooltip: context.locale.localSettingsDesc,
                        ),
                        height10,
                        ListTile(
                          title: Text(context.locale.theme),
                          trailing: const ThemeDropdown(),
                        ),
                        height10,
                        ListTile(
                          title: Text(context.locale.language),
                          trailing: const LocaleDropdown(),
                        ),
                        height10,
                        const SmartPasteSwitch(),
                        const SetupToggleHotKey(),
                        const DontAutoCopyOver(),
                        const PauseTill(),
                        const StartUpLaunchSwitch(),
                        height10,
                      ],
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: halfWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SettingHeader(
                          name: context.locale.syncLocal,
                          tooltip: context.locale.localSettingsDesc,
                        ),
                        height10,
                        DisableForLocalUser(
                          ifLocal: ListTile(
                            leading: const Icon(Icons.sync_disabled),
                            enabled: false,
                            title: Text(context.locale.syncConfigNotAvailable),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              EnableSyncSwitch(),
                              EnableFileSyncSwitch(),
                              AutoSyncInterval(),
                            ],
                          ),
                        ),
                        DisableForLocalUser(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              height20,
                              SettingHeader(
                                name: context.locale.advanceSecurity,
                                tooltip: context.locale.localSettingsDesc,
                              ),
                              height10,
                              const E2EESettings(),
                            ],
                          ),
                        ),
                        const Divider(),
                        AboutListTile(
                          dense: true,
                          icon: const Icon(Icons.info_outline),
                          applicationName: "CopyCat Clipboard",
                          applicationIcon: Image.asset(
                            AssetConstants.copyCatIcon,
                            width: 60,
                          ),
                          applicationVersion: "$version+$build",
                          applicationLegalese:
                              "Copyright (c) 2024 Entility Studio",
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
