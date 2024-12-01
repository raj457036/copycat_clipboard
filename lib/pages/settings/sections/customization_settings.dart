import 'package:clipboard/pages/settings/widgets/color_picker.dart';
import 'package:clipboard/pages/settings/widgets/smart_paste_switch.dart';
import 'package:clipboard/pages/settings/widgets/system_shortcut.dart';
import 'package:clipboard/pages/settings/widgets/theme_dropdown.dart';
import 'package:clipboard/pages/settings/widgets/theme_variant_dropdown.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:flutter/material.dart';

class CustomizationSettings extends StatelessWidget {
  const CustomizationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 650),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: padding12),
        children: const [
          ThemeDropdownTile(),
          ColorPickerTile(),
          ThemeVariantDropdown(),
          height16,
          SmartPasteSwitch(),
          ClipboardHotKeySwitch(),
        ],
      ),
    );
  }
}
