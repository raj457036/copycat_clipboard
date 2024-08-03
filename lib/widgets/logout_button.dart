// ignore_for_file: use_build_context_synchronously

import 'package:clipboard/di/di.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/dialogs/confirm_dialog.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/bloc/auth_cubit/auth_cubit.dart';
import 'package:copycat_base/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:copycat_base/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:copycat_base/bloc/window_action_cubit/window_action_cubit.dart';
import 'package:copycat_base/data/services/encryption.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:copycat_pro/bloc/monetization_cubit/monetization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

      EncrypterWorker.instance.dispose();
      context.read<OfflinePersistanceCubit>().stopListners();
      context.read<DriveSetupCubit>().reset();

      await Future.wait([
        context.read<MonetizationCubit>().logout(),
        context.read<ClipCollectionCubit>().reset(),
        context.read<SyncManagerCubit>().reset(),
        if (isDesktopPlatform) context.read<WindowActionCubit>().reset(),
        context.read<AuthCubit>().logout(),
        context.read<AppConfigCubit>().reset(),
        clearPersistedRootDir(),
        db.writeTxn(() => db.clear()),
      ]);

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
