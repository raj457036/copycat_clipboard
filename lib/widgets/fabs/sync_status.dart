import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/syncing.dart';
import 'package:copycat_base/bloc/auth_cubit/auth_cubit.dart';
import 'package:copycat_base/bloc/clip_sync_manager_cubit/clip_sync_manager_cubit.dart';
import 'package:copycat_base/bloc/collection_sync_manager_cubit/collection_sync_manager_cubit.dart';
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
        Function(void Function())? setState;
        bool disabled = false;
        IconData icon = Icons.sync_rounded;
        bool isSyncing = false;
        String message = context.locale.syncNow;
        return MultiBlocListener(
          listeners: [
            BlocListener<ClipSyncManagerCubit, ClipSyncManagerState>(
              listener: (context, state) {
                setState?.call(() {
                  switch (state) {
                    case ClipSyncUnknown() || ClipSyncDisabled():
                      disabled = true;
                      isSyncing = false;
                      icon = Icons.sync_lock_rounded;
                      message = context.locale.syncNotAvailable;
                    case ClipSyncingUnknown():
                      disabled = true;
                      isSyncing = true;
                    case ClipSyncing():
                      disabled = true;
                      isSyncing = true;
                    case ClipSyncComplete():
                      disabled = false;
                      isSyncing = false;
                      icon = Icons.sync_rounded;
                      message = context.locale.synced;
                    case ClipSyncFailed(:final failure):
                      disabled = false;
                      isSyncing = false;
                      icon = Icons.sync_problem_rounded;
                      message =
                          context.locale.syncingCheckFailed(failure.message);
                  }
                });
              },
            ),
            BlocListener<CollectionSyncManagerCubit,
                CollectionSyncManagerState>(
              listener: (context, state) {
                setState?.call(() {
                  switch (state) {
                    case CollectionSyncUnknown() || CollectionSyncDisabled():
                      disabled = true;
                      isSyncing = false;
                      icon = Icons.sync_lock_rounded;
                      message = context.locale.syncNotAvailable;
                    case CollectionSyncingUnknown():
                      disabled = true;
                      isSyncing = true;
                    case CollectionSyncing():
                      disabled = true;
                      isSyncing = true;
                    case CollectionSyncComplete():
                      disabled = false;
                      isSyncing = false;
                      icon = Icons.sync_rounded;
                      message = context.locale.synced;
                    case CollectionSyncFailed(:final failure):
                      disabled = false;
                      isSyncing = false;
                      icon = Icons.sync_problem_rounded;
                      message =
                          context.locale.syncingCheckFailed(failure.message);
                  }
                });
              },
            ),
          ],
          child: StatefulBuilder(builder: (context, updateState) {
            setState = updateState;
            return FloatingActionButton.small(
              onPressed: disabled
                  ? null
                  : () => context
                      .read<CollectionSyncManagerCubit>()
                      .syncCollections(manual: true),
              tooltip: "$message • $metaKey + R",
              heroTag: "sync-fab",
              backgroundColor: colors.secondary,
              foregroundColor: colors.onSecondary,
              child: isSyncing ? const AnimatedSyncingIcon() : Icon(icon),
            );
          }),
        );
      },
    );
  }
}
