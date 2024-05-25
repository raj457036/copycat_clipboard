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
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/logout_button.dart';
import 'package:clipboard/widgets/minimize_window.dart';
import 'package:clipboard/widgets/nav_rail.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final floatingActionButton =
        getFloatingActionButton(context, 3, isMobile: isMobile);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        actions: [
          if (isDesktop) const MinimizeWindowButton(),
          const LogoutButton(),
          width12,
        ],
      ),
      body: LeftNavRail(
        floatingActionButton: floatingActionButton,
        navbarActiveIndex: 3,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: padding16),
          child: OverflowBar(
            alignment: MainAxisAlignment.start,
            overflowAlignment: OverflowBarAlignment.start,
            spacing: 20,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 570),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                constraints: const BoxConstraints(maxWidth: 570),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
        ),
      ),
    );
  }
}
