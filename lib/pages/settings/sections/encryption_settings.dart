import 'package:clipboard/pages/settings/widgets/e2ee_settings.dart';
import 'package:clipboard/widgets/local_user.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:flutter/material.dart';

class EncryptionSettings extends StatelessWidget {
  const EncryptionSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 650),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: padding12),
        children: const [
          DisableForLocalUser(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                E2EESettings(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
