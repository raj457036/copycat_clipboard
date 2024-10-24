import 'package:copycat_base/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:copycat_base/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClipboardChangeListener extends StatelessWidget {
  final Widget child;

  const ClipboardChangeListener({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SyncManagerCubit, SyncManagerState>(
          listener: (context, state) {
            switch (state) {
              case PartlySyncedSyncState(clipboard: true):
                context.read<ClipboardCubit>().fetch(fromTop: true);
              case SyncedState(refreshLocalCache: true):
                context.read<ClipboardCubit>().fetch(fromTop: true);
              case ClipboardSyncedSyncState(
                  :final added,
                  :final updated,
                  :final deleted,
                  silent: true
                ):
                {
                  if (added > 0 || updated > 0 || deleted > 0) {
                    final cubit = context.read<ClipboardCubit>();

                    final fetched = cubit.fetchIfInitBatch();

                    if (!fetched) {
                      showTextSnackbar(
                        context.locale.newUpdates(added, updated, deleted),
                        duration: 30,
                        closePrevious: true,
                        action: SnackBarAction(
                          label: context.locale.refreshNow,
                          onPressed: () {
                            cubit.fetch(fromTop: true);
                          },
                        ),
                      );
                    }
                  }
                }
            }
          },
        ),
        BlocListener<OfflinePersistanceCubit, OfflinePersistanceState>(
          listener: (context, state) {
            switch (state) {
              case OfflinePersistanceDeleted(:final items):
                {
                  context.read<ClipboardCubit>().deleteItem(items);
                  showTextSnackbar(
                    context.locale.itemDeleted,
                    closePrevious: true,
                  );
                }
              case OfflinePersistanceSaved(
                  :final items,
                  :final created,
                ):
                {
                  final cubit = context.read<ClipboardCubit>();
                  for (var item in items) {
                    cubit.put(item, isNew: created);
                  }
                }
              case _:
            }
          },
        ),
        BlocListener<CloudPersistanceCubit, CloudPersistanceState>(
          listener: (context, state) {
            switch (state) {
              case CloudPersistanceUploadingFile(:final item) ||
                    CloudPersistanceDownloadingFile(:final item):
                context.read<ClipboardCubit>().put(item);
              case CloudPersistanceCreating(:final item) ||
                    CloudPersistanceUpdating(:final item):
                context.read<ClipboardCubit>().put(item);
              case CloudPersistanceDeleting(:final items):
                final cubit = context.read<ClipboardCubit>();
                items.forEach(cubit.put);
                showTextSnackbar(
                  context.locale.deletingFromCloud,
                  isLoading: true,
                  closePrevious: true,
                );
              case CloudPersistanceError(:final item, :final failure):
                showFailureSnackbar(failure);
                if (item != null) {
                  context.read<ClipboardCubit>().put(item);
                }
              case _:
            }
          },
        ),
      ],
      child: child,
    );
  }
}
