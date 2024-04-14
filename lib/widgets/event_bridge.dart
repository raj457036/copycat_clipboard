import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:clipboard/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventBridge extends StatelessWidget {
  final Widget child;

  const EventBridge({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SyncManagerCubit, SyncManagerState>(
          listener: (context, state) {
            if (state is SyncedState) {
              context.read<ClipboardCubit>().fetch(fromTop: true);
            }
          },
        ),
        BlocListener<OfflinePersistanceCubit, OfflinePersistanceState>(
          listener: (context, state) {
            switch (state) {
              case OfflinePersistanceCreating():
                // showTextSnackbar("Inserting Clip...");
                break;
              case OfflinePersistanceUpdating():
                // showTextSnackbar("Updating Clip...");
                break;
              case OfflinePersistanceSaved(
                  :final item,
                  :final created,
                  :final synced
                ):
                context.read<ClipboardCubit>().put(item, isNew: created);
                if (!synced) {
                  context.read<CloudPersistanceCubit>().persist(item);
                }
                break;
              case OfflinePersistanceError(:final failure):
                // showFailureSnackbar(failure);
                break;
              case _:
            }
          },
        ),
        BlocListener<CloudPersistanceCubit, CloudPersistanceState>(
          listener: (context, state) {
            switch (state) {
              case CloudPersistanceCreating(:final item):
                // showTextSnackbar("(Sync) Inserting Clip...");
                context.read<ClipboardCubit>().put(item);
                break;
              case CloudPersistanceUpdating(:final item):
                // showTextSnackbar("(Sync) Updating Clip...");
                context.read<ClipboardCubit>().put(item);
                break;
              case CloudPersistanceSaved(:final item):
                context
                    .read<OfflinePersistanceCubit>()
                    .persist(item, synced: true);
                context.read<SyncManagerCubit>().updateSyncTime();
                break;
              case CloudPersistanceError(:final failure):
                // showFailureSnackbar(failure);
                break;
              case _:
            }
          },
        ),
      ],
      child: child,
    );
  }
}
