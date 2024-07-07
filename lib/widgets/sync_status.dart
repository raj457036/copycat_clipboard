import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/datetime_extension.dart';
import 'package:clipboard/widgets/syncing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncStatusButton extends StatelessWidget {
  const SyncStatusButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocBuilder<SyncManagerCubit, SyncManagerState>(
      builder: (context, state) {
        bool disabled = false;
        IconData icon = Icons.sync_rounded;
        bool isSyncing = false;
        String message = context.locale.syncNow;

        switch (state) {
          case UnknownSyncState():
            disabled = true;
            isSyncing = false;
            icon = Icons.sync_lock_rounded;
            message = context.locale.syncNotAvailable;
            Future.delayed(
              const Duration(seconds: 5),
              () => syncChanges(context),
            );
            break;
          case CheckingSyncState():
            disabled = true;
            isSyncing = true;
            message = context.locale.checkingForRecord;
            break;
          case SyncingState(:final progress, :final total):
            disabled = true;
            isSyncing = true;
            message = context.locale.syncing("$progress/$total");
            break;
          case SyncCheckFailedState(:final failure):
            disabled = false;
            isSyncing = false;
            icon = Icons.sync_problem_rounded;
            message = context.locale.syncingCheckFailed(failure.message);
            break;
          case SyncedState(:final lastSynced):
            disabled = false;
            isSyncing = false;
            icon = Icons.sync_rounded;
            message = context.locale.lastSynced(
              dateTimeFormatter(context.locale.localeName).format(lastSynced),
            );
            break;
        }

        return FloatingActionButton.small(
          onPressed: disabled ? null : () => syncChanges(context),
          tooltip: message,
          heroTag: "sync-fab",
          backgroundColor: colors.secondary,
          foregroundColor: colors.onSecondary,
          child: isSyncing ? const AnimatedSyncingIcon() : Icon(icon),
        );
      },
    );
  }
}
