import 'package:clipboard/pages/settings/widgets/e2ee_settings.dart';
import 'package:clipboard/pages/settings/widgets/exclusion_rules/exclude_custom_rules.dart';
import 'package:clipboard/pages/settings/widgets/exclusion_rules/exlcude_sensitive_info.dart';
import 'package:clipboard/pages/settings/widgets/setting_header.dart';
import 'package:clipboard/widgets/local_user.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SecuritySettings extends StatelessWidget {
  const SecuritySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 650),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: padding12),
        children: [
          DisableForLocalUser(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SettingHeader(icon: Icons.key, name: context.locale.encryption),
                const E2EESettings(),
              ],
            ),
          ),
          const Divider(indent: padding12, endIndent: padding12),
          height12,
          const SettingHeader(icon: Icons.rule, name: "Exclusion Rules"),
          const ExcludeSensitiveInfoSwitchTile(),
          const ExcludeCustomRules(),
        ],
      ),
    );
  }
}
