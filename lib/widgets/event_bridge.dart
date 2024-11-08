// ignore_for_file: use_build_context_synchronously

import 'package:clipboard/widgets/dialogs/inconsistent_timing.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/bloc/auth_cubit/auth_cubit.dart';
import 'package:copycat_base/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:copycat_base/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/bloc/realtime_clip_sync_cubit/realtime_clip_sync_cubit.dart';
import 'package:copycat_base/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:copycat_base/bloc/window_action_cubit/window_action_cubit.dart';
import 'package:copycat_base/constants/key.dart';
import 'package:copycat_base/constants/strings/route_constants.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/data/services/encryption.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
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
          listenWhen: (previous, current) =>
              (previous.config.syncSpeed != current.config.syncSpeed) ||
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
                  if (config.enableSync) {
                    final realtimeSync = context.read<RealtimeClipSyncCubit>();

                    switch (config.syncSpeed) {
                      case SyncSpeed.realtime:
                        realtimeSync.subscribe();
                      // TODO: stop poll syncing
                      case SyncSpeed.balanced:
                        realtimeSync.unsubscribe();
                      // TODO: start poll syncing
                    }
                  }

                  EncrypterWorker.instance.setEncryption(config.autoEncrypt);

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

                  if (context.mounted) {
                    await context
                        .read<OfflinePersistanceCubit>()
                        .decryptAllClipboardItems();
                  }
                }
              case _:
            }
          },
        ),
        BlocListener<SyncManagerCubit, SyncManagerState>(
          listener: (context, state) async {
            switch (state) {
              case PartlySyncedSyncState(collections: true):
                context.read<ClipCollectionCubit>().fetch(fromTop: true);
              case SyncCheckFailedState(:final failure):
                showFailureSnackbar(failure);
            }
          },
        ),
        BlocListener<OfflinePersistanceCubit, OfflinePersistanceState>(
          listener: (context, state) async {
            switch (state) {
              case OfflinePersistanceSaved(
                  :final items,
                  synced: false,
                  :final updatedFields
                ):
                {
                  final forSync =
                      items.where((item) => shouldSync(updatedFields, item));
                  final cubit = context.read<CloudPersistanceCubit>();
                  forSync.forEach(cubit.persist);
                }
              case OfflinePersistanceError(:final failure):
                showFailureSnackbar(failure);

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
                    .persist([item], synced: true);

              case CloudPersistanceDeleted(:final items):
                context.read<OfflinePersistanceCubit>().delete(items);

              case CloudPersistanceError(:final failure):
                {
                  // TODO: improve retry strategy
                  showFailureSnackbar(failure);
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
