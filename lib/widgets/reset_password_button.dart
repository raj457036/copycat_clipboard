import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordButton extends StatelessWidget {
  final bool iconButton;
  const ResetPasswordButton({
    super.key,
    this.iconButton = true,
  });

  Future<void> resetPassword(BuildContext context) async {
    context.pushNamed(RouteConstants.resetPassword);
  }

  @override
  Widget build(BuildContext context) {
    if (iconButton) {
      return IconButton.filledTonal(
        icon: const Icon(Icons.lock_person_rounded),
        tooltip: 'Reset Password',
        onPressed: () => resetPassword(context),
      );
    }
    return ElevatedButton.icon(
      icon: const Icon(Icons.lock_person_rounded),
      label: const Text('Reset Password'),
      onPressed: () => resetPassword(context),
    );
  }
}
