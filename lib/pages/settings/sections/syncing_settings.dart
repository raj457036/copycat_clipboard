import 'package:clipboard/pages/settings/widgets/dropdowns/sync_speed_dropdown.dart';
import 'package:clipboard/pages/settings/widgets/switches/enable_sync_switch.dart';
import 'package:clipboard/pages/settings/widgets/switches/file_sync_switch.dart';
import 'package:clipboard/widgets/local_user.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SyncingSettings extends StatelessWidget {
  const SyncingSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 650),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: padding12),
        children: [
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
                SyncSpeedDropdown(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
