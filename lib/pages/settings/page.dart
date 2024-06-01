import 'package:clipboard/constants/numbers/breakpoints.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/pages/settings/widgets/dont_copy_over.dart';
import 'package:clipboard/pages/settings/widgets/enable_sync_switch.dart';
import 'package:clipboard/pages/settings/widgets/file_sync_switch.dart';
import 'package:clipboard/pages/settings/widgets/pause_till.dart';
import 'package:clipboard/pages/settings/widgets/setting_header.dart';
import 'package:clipboard/pages/settings/widgets/smart_paste_switch.dart';
import 'package:clipboard/pages/settings/widgets/startup_launch_switch.dart';
import 'package:clipboard/pages/settings/widgets/sync_interval.dart';
import 'package:clipboard/pages/settings/widgets/system_shortcut.dart';
import 'package:clipboard/pages/settings/widgets/theme_dropdown.dart';
import 'package:clipboard/routes/utils.dart';
import 'package:clipboard/widgets/logout_button.dart';
import 'package:clipboard/widgets/nav_rail.dart';
import 'package:clipboard/widgets/reset_password_button.dart';
import 'package:clipboard/widgets/subscription/active_plan.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    final floatingActionButton =
        getFloatingActionButton(context, 3, isMobile: isMobile);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        actions: [
          ActivePlanAction(compact: isMobile),
          width12,
          const ResetPasswordButton(),
          width4,
          const LogoutButton(),
          width12,
        ],
      ),
      body: LeftNavRail(
        floatingActionButton: floatingActionButton,
        navbarActiveIndex: 3,
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
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SettingHeader(
                          name: "Basic • Local",
                          tooltip:
                              "These settings are applicable to this device only.",
                        ),
                        height10,
                        ListTile(
                          title: Text("Theme"),
                          trailing: ThemeDropdown(),
                        ),
                        SmartPasteSwitch(),
                        StartUpLaunchSwitch(),
                        SetupToggleHotKey(),
                        DontAutoCopyOver(),
                        PauseTill(),
                      ],
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: halfWidth),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SettingHeader(
                          name: "Sync • Local",
                          tooltip:
                              "These settings are applicable to this device only.",
                        ),
                        height10,
                        AutoSyncInterval(),
                        EnableSyncSwitch(),
                        EnableFileSyncSwitch(),
                      ],
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
