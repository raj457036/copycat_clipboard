import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/pages/settings/widgets/auto_paste.dart';
import 'package:clipboard/pages/settings/widgets/dont_copy_over.dart';
import 'package:clipboard/pages/settings/widgets/enable_sync_switch.dart';
import 'package:clipboard/pages/settings/widgets/file_sync_switch.dart';
import 'package:clipboard/pages/settings/widgets/pause_till.dart';
import 'package:clipboard/pages/settings/widgets/setting_header.dart';
import 'package:clipboard/pages/settings/widgets/sync_interval.dart';
import 'package:clipboard/pages/settings/widgets/system_shortcut.dart';
import 'package:clipboard/pages/settings/widgets/theme_dropdown.dart';
import 'package:clipboard/widgets/logout_button.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        actions: const [
          LogoutButton(),
          width12,
        ],
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: padding16),
          children: const [
            SettingHeader(
              name: "Basic • Local",
              tooltip: "These settings are applicable to this device only.",
            ),
            height10,
            ListTile(
              title: Text("Theme"),
              trailing: ThemeDropdown(),
            ),
            AutoPasteSwitch(),
            SetupToggleHotKey(),
            DontAutoCopyOver(),
            PauseTill(),
            height20,
            SettingHeader(
              name: "Sync • Local",
              tooltip: "These settings are applicable to this device only.",
            ),
            height10,
            AutoSyncInterval(),
            EnableSyncSwitch(),
            EnableFileSyncSwitch(),
          ],
        ),
      ),
    );
  }
}
