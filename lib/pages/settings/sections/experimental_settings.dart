import 'package:clipboard/pages/settings/widgets/android_clipboard/setting_tile.dart';
import 'package:clipboard/pages/settings/widgets/drag_n_drop/drag_n_drop_switch.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

class ExperimentalSettings extends StatelessWidget {
  const ExperimentalSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 650),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: padding12),
        children: [
          DragAndDropSwitchTile(),
          if (Platform.isAndroid) AndroidClipboardSettingListTile(),
        ],
      ),
    );
  }
}
