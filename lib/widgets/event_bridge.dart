// ignore_for_file: use_build_context_synchronously

import 'package:atom_event_bus/atom_event_bus.dart';
import 'package:clipboard/widgets/dialogs/inconsistent_timing.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/bloc/auth_cubit/auth_cubit.dart';
import 'package:copycat_base/bloc/clip_sync_manager_cubit/clip_sync_manager_cubit.dart';
import 'package:copycat_base/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:copycat_base/bloc/collection_sync_manager_cubit/collection_sync_manager_cubit.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/bloc/realtime_clip_sync_cubit/realtime_clip_sync_cubit.dart';
import 'package:copycat_base/bloc/realtime_collection_sync_cubit/realtime_collection_sync_cubit.dart';
import 'package:copycat_base/bloc/window_action_cubit/window_action_cubit.dart';
import 'package:copycat_base/common/events.dart';
import 'package:copycat_base/constants/key.dart';
import 'package:copycat_base/constants/strings/route_constants.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/data/services/encryption.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/domain/services/cross_sync_listener.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EventBridge extends StatelessWidget {
  final Widget child;

  const EventBridge({
    super.key,
    required this.child,
  });

  bool shouldSync(List<String>? updatedFields, ClipboardItem item) {
    if (updatedFields == null) return true;
    if (updatedFields.contains("copiedCount") && item.copiedCount % 10 == 0) {
      // if only copied count is changed then only sync after every 10 copy operations.
      return true;
    }

    return false;
  }

  void broadcastEvent(CrossSyncEventType eventType, ClipboardItem item) {
    final eventPayload = clipboardEvent.createPayload((eventType, item));
    EventBus.emit(eventPayload);
  }

  void broadcastBatchEvent(
    CrossSyncEventType eventType,
    List<ClipboardItem> items,
  ) {
    if (items.isEmpty) return;
    if (items.length == 1) {
      broadcastEvent(eventType, items.first);
      return;
    }
    final payload = items.map((item) => (eventType, item)).toList();
    final eventPayload = clipboardBatchEvent.createPayload(payload);
    EventBus.emit(eventPayload);
  }

  @override
  Widget build(BuildContext context) {
    // bool firstTime = true;
    return MultiBlocListener(
      listeners: [
        if (isDesktopPlatform)
          BlocListener<AppConfigCubit, AppConfigState>(
            listenWhen: (previous, current) =>
                previous.config.view != current.config.view,
            listener: (context, state) {
              final view = state.config.view;
              if (view != AppView.windowed) {
                rootNavKey.currentContext?.goNamed(RouteConstants.home);
              }
              final size = view == AppView.windowed
                  ? initialWindowSize
                  : state.config.windowSize;
              context.read<WindowActionCubit>().setup(view, size);
            },
          ),
        BlocListener<AppConfigCubit, AppConfigState>(
          listenWhen: (previous, current) {
            final prev = previous.config;
            final curr = current.config;
            return prev.enableSync != curr.enableSync ||
                prev.syncSpeed != curr.syncSpeed;
          },
          listener: (context, state) async {
            final config = state.config;
            final clipSync = context.read<ClipSyncManagerCubit>();
            final realtimeClip = context.read<RealtimeClipSyncCubit>();
            final collectionSync = context.read<CollectionSyncManagerCubit>();
            final realtimeCollection =
                context.read<RealtimeCollectionSyncCubit>();

            if (config.enableSync) {
              clipSync.changeConfig(disabled: false);
              collectionSync.changeConfig(disabled: false);
              await collectionSync.syncCollections();
            } else {
              clipSync.changeConfig(disabled: true);
              collectionSync.changeConfig(disabled: true);
              realtimeClip.unsubscribe();
              realtimeCollection.unsubscribe();
              clipSync.stopPolling();
              collectionSync.stopPolling();
            }
          },
        ),
        BlocListener<CollectionSyncManagerCubit, CollectionSyncManagerState>(
          listener: (context, state) async {
            final config = context.read<AppConfigCubit>().state.config;
            final clipSync = context.read<ClipSyncManagerCubit>();
            final collectionSync = context.read<CollectionSyncManagerCubit>();
            final realtimeCollection =
                context.read<RealtimeCollectionSyncCubit>();
            switch (state) {
              case CollectionSyncComplete(:final manual):
                {
                  if (!config.enableSync) return;
                  await clipSync.syncClips(manual: manual);
                  switch (config.syncSpeed) {
                    case SyncSpeed.realtime:
                      realtimeCollection.subscribe();
                      collectionSync.stopPolling();
                    case SyncSpeed.balanced:
                      realtimeCollection.unsubscribe();
                      collectionSync.startPolling();
                  }
                }
              case CollectionSyncFailed(:final failure):
                showFailureSnackbar(failure);
            }
          },
        ),
        BlocListener<ClipSyncManagerCubit, ClipSyncManagerState>(
          listener: (context, state) {
            final config = context.read<AppConfigCubit>().state.config;
            final realtimeClip = context.read<RealtimeClipSyncCubit>();
            // final clipSync = context.read<ClipSyncManagerCubit>();

            switch (state) {
              case ClipSyncComplete():
                {
                  if (!config.enableSync) return;
                  switch (config.syncSpeed) {
                    case SyncSpeed.realtime:
                      realtimeClip.subscribe();
                    // clipSync.stopPolling();

                    case SyncSpeed.balanced:
                      realtimeClip.unsubscribe();
                    // clipSync.startPolling();
                  }
                }
              case ClipSyncFailed(:final failure):
                showFailureSnackbar(failure);
            }
          },
        ),
        BlocListener<AppConfigCubit, AppConfigState>(
          listenWhen: (previous, current) =>
              (previous.config.enc2 != current.config.enc2) ||
              (previous.config.autoEncrypt != current.config.autoEncrypt) ||
              (previous.config.clockUnSynced != current.config.clockUnSynced),
          listener: (context, state) async {
            switch (state) {
              case AppConfigLoaded(:final config):
                {
                  if (config.clockUnSynced) {
                    const InconsistentTiming().open();
                  }

                  EncrypterWorker.instance.setEncryption(config.autoEncrypt);
                  final offline = context.read<OfflinePersistenceCubit>();
                  if (!EncrypterWorker.instance.isRunning) {
                    if (config.enc2Key == null) return;
                    final authState = context.read<AuthCubit>().state;

                    if (authState is AuthenticatedAuthState) {
                      final enc1 = authState.user.enc1;
                      if (enc1 == null) return;
                      final encMngr = EncryptionManager(config.enc2Key!);
                      final enc1Decrypt = encMngr.decrypt(enc1);
                      await EncrypterWorker.instance.start(enc1Decrypt);
                    }
                  }

                  await offline.decryptAllClipboardItems();
                }
              case _:
            }
          },
        ),

        // BlocListener<SyncManagerCubit, SyncManagerState>(
        //   listener: (context, state) async {
        //     switch (state) {
        //       case PartlySyncedSyncState(collections: true):
        //         context.read<ClipCollectionCubit>().fetch(fromTop: true);
        //       case SyncedState(refreshLocalCache: true):
        //         logger.w("Synced State");
        //       case ClipboardSyncedSyncState(
        //           :final added,
        //           :final updated,
        //           :final deleted,
        //           silent: true
        //         ):
        //         logger.w(
        //             "ClipboardSyncedSyncState -> Added: $added | Updated: $updated | Deleted: $deleted");
        //       case SyncCheckFailedState(:final failure):
        //         showFailureSnackbar(failure);
        //     }
        //   },
        // ),
        BlocListener<OfflinePersistenceCubit, OfflinePersistanceState>(
          listener: (context, state) async {
            final locales = rootNavKey.currentContext!.locale;
            switch (state) {
              case OfflinePersistanceSaved(:final items, synced: true):
                showDebugSnackbar("Offline Saved ( Synced ) ${items.length}");
                broadcastBatchEvent(CrossSyncEventType.update, items);
              case OfflinePersistanceSaved(
                  :final items,
                  :final updatedFields,
                  :final created,
                  synced: false,
                ):
                {
                  final eventType = created
                      ? CrossSyncEventType.create
                      : CrossSyncEventType.update;
                  broadcastBatchEvent(eventType, items);

                  showDebugSnackbar(
                      "Offline Saved ( Not Synced ) ${items.length}");
                  final forSync =
                      items.where((item) => shouldSync(updatedFields, item));
                  final cubit = context.read<CloudPersistanceCubit>();
                  for (var item in forSync) {
                    cubit.persist(item);
                  }
                }
              case OfflinePersistanceError(:final failure):
                showFailureSnackbar(failure);
              case OfflinePersistanceDeleted(:final items):
                showTextSnackbar(
                  locales.itemDeleted,
                  closePrevious: true,
                );
                broadcastBatchEvent(CrossSyncEventType.delete, items);
              case _:
            }
          },
        ),
        BlocListener<CloudPersistanceCubit, CloudPersistanceState>(
          listener: (context, state) async {
            final locales = rootNavKey.currentContext!.locale;
            final offlineCubit = context.read<OfflinePersistenceCubit>();
            switch (state) {
              case CloudPersistanceSaved(:final item):
                showDebugSnackbar("Cloud Saved ${item.serverId}");
                offlineCubit.persist([item], synced: true);
              case CloudPersistanceDeleted(:final items):
                offlineCubit.delete(items);
              case CloudPersistanceDeleting():
                showTextSnackbar(
                  locales.deletingFromCloud,
                  isLoading: true,
                  closePrevious: true,
                );
              case CloudPersistanceError(:final failure):
                showFailureSnackbar(failure);
              case CloudPersistanceCreating(:final item) ||
                    CloudPersistanceUpdating(:final item):
                showDebugSnackbar("Creating/Updating ${item.serverId}");
                broadcastEvent(CrossSyncEventType.update, item);
              case CloudPersistanceUploadingFile(:final item) ||
                    CloudPersistanceDownloadingFile(:final item):
                showDebugSnackbar(
                    "Downloading ${item.downloadProgress} | Uploading ${item.uploadProgress}");
                broadcastEvent(CrossSyncEventType.update, item);
              case _:
            }
          },
        ),
      ],
      child: child,
    );
  }
}
