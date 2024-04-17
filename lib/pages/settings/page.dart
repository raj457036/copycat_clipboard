import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/pages/settings/widgets/enable_sync_switch.dart';
import 'package:clipboard/pages/settings/widgets/file_sync_switch.dart';
import 'package:clipboard/pages/settings/widgets/setting_header.dart';
import 'package:clipboard/pages/settings/widgets/theme_dropdown.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: ListView(
          children: const [
            SettingHeader(name: "Basic"),
            height10,
            ListTile(
              title: Text("Theme"),
              trailing: ThemeDropdown(),
            ),
            height20,
            SettingHeader(name: "Sync"),
            height10,
            EnableSyncSwitch(),
            EnableFileSyncSwitch(),
          ],
        ),
      ),
    );
  }
}
