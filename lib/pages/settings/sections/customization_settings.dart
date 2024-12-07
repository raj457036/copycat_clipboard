import 'package:clipboard/pages/settings/widgets/color_picker.dart';
import 'package:clipboard/pages/settings/widgets/dropdowns/theme_dropdown.dart';
import 'package:clipboard/pages/settings/widgets/dropdowns/theme_variant_dropdown.dart';
import 'package:clipboard/pages/settings/widgets/switches/smart_paste_switch.dart';
import 'package:clipboard/pages/settings/widgets/switches/system_shortcut_switch.dart';
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
