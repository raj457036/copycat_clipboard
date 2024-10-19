import 'package:clipboard/pages/settings/widgets/drag_n_drop/drag_n_drop_switch.dart';
import 'package:clipboard/pages/settings/widgets/setting_header.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:flutter/material.dart';

class ExperimentalSettings extends StatelessWidget {
  const ExperimentalSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 650),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: padding12),
        children: const [
          SettingHeader(name: "Drag & Drop"),
          DragAndDropSwitchTile(),
          // SettingHeader(name: "Paste Stack"),
        ],
      ),
    );
  }
}
