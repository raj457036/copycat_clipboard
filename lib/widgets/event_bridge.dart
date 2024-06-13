// ignore_for_file: use_build_context_synchronously

import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:clipboard/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/routes/utils.dart';
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
          },
        ),
        BlocListener<SyncManagerCubit, SyncManagerState>(
          listener: (context, state) {
            switch (state) {
              case PartlySyncedSyncState(collections: true):
                context.read<ClipCollectionCubit>().fetch(fromTop: true);
                break;
            }
          },
        ),
        BlocListener<OfflinePersistanceCubit, OfflinePersistanceState>(
          listener: (context, state) {
            switch (state) {
              case OfflinePersistanceSaved(:final item, synced: false):
                context.read<CloudPersistanceCubit>().persist(item);
                break;
              case OfflinePersistanceError(:final failure):
                showFailureSnackbar(failure);
                break;
              case _:
            }
          },
        ),
        BlocListener<CloudPersistanceCubit, CloudPersistanceState>(
          listener: (context, state) async {
            switch (state) {
              case CloudPersistanceSaved(:final item):
                context
                    .read<OfflinePersistanceCubit>()
                    .persist(item, synced: true);
                break;
              case CloudPersistanceDeleted(:final item):
                context.read<OfflinePersistanceCubit>().delete(item);
                break;
              case CloudPersistanceError(
                  :final retryCount,
                  :final failedAction,
                  :final item
                ):
                {
                  if (retryCount.isNegative) return;
                  if (retryCount > 2) return;

                  await waitHere(retryCount + 1);

                  switch (failedAction) {
                    case FailedAction.create ||
                          FailedAction.update ||
                          FailedAction.upload:
                      context.read<CloudPersistanceCubit>().persist(
                            item,
                            retryCount: retryCount + 1,
                          );
                      break;
                    case FailedAction.download:
                      context.read<CloudPersistanceCubit>().download(
                            item,
                            retryCount: retryCount + 1,
                          );
                      break;
                    case FailedAction.delete:
                      context.read<CloudPersistanceCubit>().delete(
                            item,
                            retryCount: retryCount + 1,
                          );
                      break;
                    default:
                  }
                }
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
