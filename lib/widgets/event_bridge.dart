// ignore_for_file: use_build_context_synchronously

import 'package:atom_event_bus/atom_event_bus.dart';
import 'package:clipboard/di/di.dart';
import 'package:clipboard/widgets/dialogs/inconsistent_timing.dart';
import 'package:copycat_base/bloc/android_bg_clipboard_cubit/android_bg_clipboard_cubit.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/bloc/auth_cubit/auth_cubit.dart';
import 'package:copycat_base/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:copycat_base/bloc/clip_sync_manager_cubit/clip_sync_manager_cubit.dart';
import 'package:copycat_base/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:copycat_base/bloc/collection_sync_manager_cubit/collection_sync_manager_cubit.dart';
import 'package:copycat_base/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/bloc/realtime_clip_sync_cubit/realtime_clip_sync_cubit.dart';
import 'package:copycat_base/bloc/realtime_collection_sync_cubit/realtime_collection_sync_cubit.dart';
import 'package:copycat_base/bloc/window_action_cubit/window_action_cubit.dart';
import 'package:copycat_base/common/events.dart';
import 'package:copycat_base/common/logging.dart';
import 'package:copycat_base/constants/key.dart';
import 'package:copycat_base/constants/strings/route_constants.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/data/services/encryption.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/domain/services/cross_sync_listener.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:copycat_pro/bloc/monetization_cubit/monetization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';

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

  Future<void> setupEncryption(BuildContext context) async {
    final config = context.read<AppConfigCubit>().state.config;
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
  }

  Future<void> resetAll(BuildContext context) async {
    EncrypterWorker.instance.dispose();
    final Isar db = sl();
    context.read<OfflinePersistenceCubit>().stopListeners();
    context.read<DriveSetupCubit>().reset();
    context.read<ClipSyncManagerCubit>().stopPolling();
    context.read<CollectionSyncManagerCubit>().stopPolling();
    context.read<RealtimeClipSyncCubit>().unsubscribe();
    context.read<RealtimeCollectionSyncCubit>().unsubscribe();
    context.read<RealtimeCollectionSyncCubit>().unsubscribe();
    context.read<ClipSyncManagerCubit>().reset();
    context.read<CollectionSyncManagerCubit>().reset();
    await context.read<AndroidBgClipboardCubit?>()?.reset();
    await Future.wait([
      context.read<MonetizationCubit>().logout(),
      context.read<ClipCollectionCubit>().reset(),
      // context.read<SyncManagerCubit>().reset(),
      if (isDesktopPlatform) context.read<WindowActionCubit>().setWindowdView(),
      clearPersistedRootDir(),
      db.writeTxn(() => db.clear()),
    ]);

    if (context.mounted) {
      showTextSnackbar(
        rootNavKey.currentContext?.locale.logoutSuccess ?? "Logout Success",
        closePrevious: true,
      );
    }
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
              case CollectionSyncComplete(:final manual, restoration: false):
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
              case _:
            }
          },
        ),
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) async {
            switch (state) {
              case AuthenticatedAuthState(:final user):
                {
                  await context.read<MonetizationCubit>().login(user.userId);
                  final configCubit = context.read<AppConfigCubit>();
                  await configCubit.load();
                  await context.read<ClipCollectionCubit>().fetch();
                  setupEncryption(context);
                  final config = configCubit.state.config;
                  if (config.onBoardComplete) {
                    context.read<DriveSetupCubit>().fetch();
                    context.read<OfflinePersistenceCubit>().startListners();
                    // starts
                    context
                        .read<CollectionSyncManagerCubit>()
                        .syncChanges(null, manual: false, restoration: false);

                    rootNavKey.currentContext?.goNamed(RouteConstants.home);
                  } else {
                    rootNavKey.currentContext?.goNamed(RouteConstants.onboard);
                  }
                }
              case UnauthenticatedAuthState(:final failure):
                if (failure == null) await resetAll(context);
                context.read<AppConfigCubit>().reset();
                rootNavKey.currentContext?.goNamed(RouteConstants.login);
              case UnknownAuthState() || AuthenticatingAuthState():
                logger.i(
                    "Auth State Unknown or Authenticating or Unauthenticated");
                rootNavKey.currentContext?.goNamed(RouteConstants.login);
                closeSnackbar();
                await context.windowAction?.show();
              case LocalAuthenticatedAuthState():
                {
                  rootNavKey.currentContext?.goNamed(RouteConstants.home);
                  await Future.wait([
                    context.read<AppConfigCubit>().load(),
                    context.read<ClipCollectionCubit>().fetch(),
                    context.read<OfflinePersistenceCubit>().startListners(),
                  ]);
                }
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
                  setupEncryption(context);
                }
              case _:
            }
          },
        ),
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
              case CloudPersistanceError(:final failure, :final item):
                showFailureSnackbar(failure);
                if (item != null) {
                  broadcastEvent(CrossSyncEventType.update, item);
                }
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
