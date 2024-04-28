import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:clipboard/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/utils/snackbar.dart';
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
        BlocListener<AppConfigCubit, AppConfigState>(
            listenWhen: (previous, current) =>
                previous.config.autoSyncInterval !=
                current.config.autoSyncInterval,
            listener: (context, state) {
              switch (state) {
                case AppConfigLoaded(:final config):
                  context.read<SyncManagerCubit>().setupAutoSync(
                        Duration(seconds: config.autoSyncInterval),
                      );
                  break;
                case _:
              }
            }),
        BlocListener<SyncManagerCubit, SyncManagerState>(
          listener: (context, state) {
            switch (state) {
              case PartlySyncedSyncState(collections: true):
                context.read<ClipCollectionCubit>().fetch(fromTop: true);
                break;
              case PartlySyncedSyncState(clipboard: true):
                context.read<ClipboardCubit>().fetch(fromTop: true);
                break;
              case SyncedState(refreshLocalCache: true):
                context.read<ClipboardCubit>().fetch(fromTop: true);
                break;
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
              case OfflinePersistanceDeleted(:final item):
                context.read<ClipboardCubit>().deleteItem(item);
                showTextSnackbar("Item Deleted", closePrevious: true);
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
                showFailureSnackbar(failure);
                break;
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
                break;
              case CloudPersistanceCreating(:final item) ||
                    CloudPersistanceUpdating(:final item):
                context.read<ClipboardCubit>().put(item);
                break;
              case CloudPersistanceSaved(:final item):
                context
                    .read<OfflinePersistanceCubit>()
                    .persist(item, synced: true);
                // context
                //     .read<SyncManagerCubit>()
                //     .updateSyncTime(refreshLocalCache: false);
                break;
              case CloudPersistanceDeleting(:final item):
                context.read<ClipboardCubit>().put(item);
                showTextSnackbar(
                  "Deleting from cloud",
                  isLoading: true,
                  closePrevious: true,
                );
                break;
              case CloudPersistanceDeleted(:final item):
                context.read<OfflinePersistanceCubit>().delete(item);
                break;
              case CloudPersistanceError(:final item, :final failure):
                showFailureSnackbar(failure);
                context.read<ClipboardCubit>().put(item);
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
