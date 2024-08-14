import 'package:clipboard/widgets/locale_dropdown_button.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';

class LocaleDropdownTile extends StatelessWidget {
  const LocaleDropdownTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(context.locale.language),
      trailing: const LocaleDropdownButton(),
    );
  }
}
