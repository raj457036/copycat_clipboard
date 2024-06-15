// ignore_for_file: use_build_context_synchronously

import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/bloc/window_action_cubit/window_action_cubit.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/data/services/encryption.dart';
import 'package:clipboard/di/di.dart';
import 'package:clipboard/l10n/l10n.dart';
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
      context.read<OfflinePersistanceCubit>().stopListners();
      context.read<OfflinePersistanceCubit>().reset();
      context.read<SyncManagerCubit>().reset();
      context.read<DriveSetupCubit>().reset();
      context.read<WindowActionCubit>().reset();
      context.read<AuthCubit>().logout();
      context.goNamed(RouteConstants.login);
      context.read<AppConfigCubit>().reset();
      EncrypterWorker.instance.dispose();
      showTextSnackbar(
        context.locale.logoutSuccess,
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
        tooltip: context.locale.logout,
      );
    }

    return ElevatedButton.icon(
      onPressed: () => logout(context, sl()),
      label: Text(context.locale.logout),
      icon: const Icon(Icons.logout),
    );
  }
}
