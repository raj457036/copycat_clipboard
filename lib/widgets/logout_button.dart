// ignore_for_file: use_build_context_synchronously

import 'package:clipboard/widgets/dialogs/confirm_dialog.dart';
import 'package:copycat_base/bloc/auth_cubit/auth_cubit.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutButton extends StatelessWidget {
  final bool enabled;
  final bool iconMode;
  const LogoutButton({
    super.key,
    this.iconMode = true,
    this.enabled = true,
  });

  Future<void> logout(BuildContext context) async {
    final confirm = await ConfirmDialog(
      title: context.locale.logout,
      message: context.locale.logoutMessage,
    ).open(context);

    if (confirm) {
      showTextSnackbar(
        context.locale.loggingYouOut,
        isLoading: true,
        closePrevious: true,
      );

      await context.read<AuthCubit>().logout();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (iconMode) {
      return IconButton(
        onPressed: enabled ? () => logout(context) : null,
        icon: const Icon(Icons.logout),
        tooltip: context.locale.logout,
      );
    }

    return ElevatedButton.icon(
      onPressed: enabled ? () => logout(context) : null,
      label: Text(context.locale.logout),
      icon: const Icon(Icons.logout),
    );
  }
}
