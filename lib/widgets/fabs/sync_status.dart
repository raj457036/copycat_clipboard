import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/syncing.dart';
import 'package:copycat_base/bloc/auth_cubit/auth_cubit.dart';
import 'package:copycat_base/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncStatusFAB extends StatelessWidget {
  const SyncStatusFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocSelector<AuthCubit, AuthState, bool>(
      selector: (state) {
        return state is LocalAuthenticatedAuthState;
      },
      builder: (context, isLocal) {
        if (isLocal) return const SizedBox.shrink();
        return BlocBuilder<SyncManagerCubit, SyncManagerState>(
          builder: (context, state) {
            bool disabled = false;
            IconData icon = Icons.sync_rounded;
            bool isSyncing = false;
            String message = context.locale.syncNow;

            switch (state) {
              case UnknownSyncState():
                disabled = false;
                isSyncing = false;
                icon = Icons.sync_lock_rounded;
                message = context.locale.syncNotAvailable;
                break;
              case SyncCheckFailedState(:final failure):
                disabled = false;
                isSyncing = false;
                icon = Icons.sync_problem_rounded;
                message = context.locale.syncingCheckFailed(failure.message);
                break;
              case SyncedState():
                disabled = false;
                isSyncing = false;
                icon = Icons.sync_rounded;
                message = context.locale.synced;
                break;
              case CheckingSyncState(needDbRebuilding: true):
                disabled = true;
                isSyncing = true;
                message = context.locale.rebuildingDB;
                break;
              default:
                disabled = true;
                isSyncing = true;
                message = context.locale.checkingForRecord;
                break;
            }
            return FloatingActionButton.small(
              onPressed: disabled ? null : () => syncChanges(context),
              tooltip: "$message • $metaKey + R",
              heroTag: "sync-fab",
              backgroundColor: colors.secondary,
              foregroundColor: colors.onSecondary,
              child: isSyncing ? const AnimatedSyncingIcon() : Icon(icon),
            );
          },
        );
      },
    );
  }
}
