import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/utils/datetime_extension.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:clipboard/widgets/syncing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncStatusButton extends StatelessWidget {
  const SyncStatusButton({super.key});

  Future<void> syncNow(BuildContext context, DateTime? lastSync) async {
    final now = DateTime.now().toUtc();
    if (lastSync != null && now.difference(lastSync).inSeconds < 60) {
      showTextSnackbar(
        '✋ Last sync was less than 1 minutes ago.',
      );
      return;
    }

    final syncManagerCubit = BlocProvider.of<SyncManagerCubit>(context);
    await syncManagerCubit.syncChanges();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyncManagerCubit, SyncManagerState>(
      builder: (context, state) {
        bool disabled = false;
        IconData icon = Icons.sync_rounded;
        bool isSyncing = false;
        String message = "Sync now";
        DateTime? lastSync;

        switch (state) {
          case UnknownSyncState():
            disabled = true;
            isSyncing = false;
            icon = Icons.sync_lock_rounded;
            message = "Sync is not available";
            break;
          case CheckingSyncState():
            disabled = true;
            isSyncing = true;
            message = "Checking for records.";
            break;
          case SyncingState(:final progress, :final total):
            disabled = true;
            isSyncing = true;
            message = "Syncing $progress/$total";
            break;
          case SyncCheckFailedState(:final failure):
            disabled = false;
            isSyncing = false;
            icon = Icons.sync_problem_rounded;
            message = "Sync check failed: ${failure.message}";
            break;
          case SyncedState(:final lastSynced):
            disabled = false;
            isSyncing = false;
            lastSync = lastSynced;
            icon = Icons.sync_rounded;
            message = "Last synced at ${dateTimeFormatter.format(lastSynced)}";
            break;
        }

        return IconButton(
          onPressed: disabled ? null : () => syncNow(context, lastSync),
          icon: isSyncing ? const AnimatedSyncingIcon() : Icon(icon),
          tooltip: message,
        );
      },
    );
  }
}
