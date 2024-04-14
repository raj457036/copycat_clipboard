import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncStatusButton extends StatelessWidget {
  const SyncStatusButton({super.key});

  Future<void> syncNow(BuildContext context, DateTime? lastSync) async {
    final now = DateTime.now();
    if (lastSync != null && now.difference(lastSync).inSeconds < 60) {
      context.showTextSnackbar(
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
        String message = "Sync now";
        DateTime? lastSync;

        switch (state) {
          case UnknownSyncState():
            disabled = true;
            icon = Icons.sync_lock_rounded;
            message = "Sync is not available";
            break;
          case CheckingSyncState():
            disabled = true;
            icon = Icons.cloud_sync_rounded;
            message = "Checking for records.";
            break;
          case SyncingState(:final progress, :final total):
            disabled = true;
            icon = Icons.cloud_sync_rounded;
            message = "Syncing $progress/$total";
            break;
          case SyncCheckFailedState(:final failure):
            disabled = false;
            icon = Icons.sync_problem_rounded;
            message = "Sync check failed: ${failure.message}";
            break;
          case SyncedState(:final lastSynced):
            disabled = false;
            lastSync = lastSynced;
            icon = Icons.sync_rounded;
            message =
                "Last synced at ${dateFormatter.add_jm().format(lastSynced)}";
            break;
        }

        return IconButton(
          onPressed: disabled ? null : () => syncNow(context, lastSync),
          icon: Icon(icon),
          tooltip: message,
        );
      },
    );
  }
}
