import 'package:clipboard/widgets/locale_dropdown_button.dart';
import 'package:clipboard/widgets/logout_button.dart';
import 'package:flutter/material.dart';

class LocaleAndLogoutRow extends StatelessWidget {
  final bool enableLogout;
  const LocaleAndLogoutRow({super.key, this.enableLogout = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LocaleDropdownButton(),
        LogoutButton(
          enabled: enableLogout,
        ),
      ],
    );
  }
}
