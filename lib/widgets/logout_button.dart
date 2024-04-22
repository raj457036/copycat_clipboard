// ignore_for_file: use_build_context_synchronously

import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/di/di.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:clipboard/widgets/dialogs/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';

class LogoutButton extends StatelessWidget {
  final bool iconMode;
  const LogoutButton({
    super.key,
    this.iconMode = true,
  });

  Future<void> logout(BuildContext context, Isar db) async {
    final confirm = await const ConfirmDialog(
      title: "Logout?",
      message: "⚠️ WARNING ⚠️\n\n"
          "Logging out will delete unsynced changes in the local database. "
          "Are you sure you want to proceed?",
    ).open(context);

    if (confirm) {
      showTextSnackbar(
        "Logging you out! Please wait...",
        isLoading: true,
        closePrevious: true,
      );
      context.read<OfflinePersistanceCubit>().stopListners();
      context.read<OfflinePersistanceCubit>().reset();
      context.read<ClipboardCubit>().reset();
      context.read<SyncManagerCubit>().reset();
      context.read<DriveSetupCubit>().reset();
      context.read<AuthCubit>().logout();
      context.goNamed(RouteConstants.login);
      showTextSnackbar(
        "Logged out successfully",
        closePrevious: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (iconMode) {
      return IconButton(
        onPressed: () => logout(context, sl()),
        icon: const Icon(Icons.logout),
        tooltip: "Log out",
      );
    }

    return ElevatedButton.icon(
      onPressed: () => logout(context, sl()),
      label: const Text('Logout'),
      icon: const Icon(Icons.logout),
    );
  }
}
