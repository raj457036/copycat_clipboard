import 'package:copycat_base/constants/strings/route_constants.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ToLoginPage extends StatelessWidget {
  const ToLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        context.goNamed(RouteConstants.login);
      },
      label: Text(context.locale.signIn),
      icon: Icon(Icons.login),
    );
  }
}
