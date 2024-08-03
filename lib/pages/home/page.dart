import 'package:clipboard/pages/home/widgets/home_body.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/compact_mode_toggle.dart';
import 'package:clipboard/widgets/hide_window_button.dart';
import 'package:clipboard/widgets/pin_to_top_toggle.dart';
import 'package:clipboard/widgets/share_listener.dart';
import 'package:clipboard/widgets/subscription/active_plan.dart';
import 'package:copycat_base/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:copycat_base/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:copycat_base/constants/key.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/constants/strings/asset_constants.dart';
import 'package:copycat_base/constants/strings/strings.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrader/upgrader.dart';

final upgrader = Upgrader(
  storeController: UpgraderStoreController(
    onMacOS: () => UpgraderAppcastStore(appcastURL: macAppcastUrl),
    onWindows: () => UpgraderAppcastStore(appcastURL: windowsAppcastUrl),
    onLinux: () => UpgraderAppcastStore(appcastURL: linuxAppcastUrl),
  ),
);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final textTheme = context.textTheme;
    final isMobile = Breakpoints.isMobile(width);

    return UpgradeAlert(
      navigatorKey: rootNavKey,
      upgrader: upgrader,
      showIgnore: false,
      shouldPopScope: () => true,
      dialogStyle: isApplePlatform
          ? UpgradeDialogStyle.cupertino
          : UpgradeDialogStyle.material,
      child: MultiBlocListener(
        listeners: [
          BlocListener<SyncManagerCubit, SyncManagerState>(
            listener: (context, state) {
              switch (state) {
                case PartlySyncedSyncState(clipboard: true):
                  context.read<ClipboardCubit>().fetch(fromTop: true);
                  break;
                case SyncedState(refreshLocalCache: true):
                  context.read<ClipboardCubit>().fetch(fromTop: true);
                  break;
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
                  break;
              }
            },
          ),
          BlocListener<OfflinePersistanceCubit, OfflinePersistanceState>(
            listener: (context, state) {
              switch (state) {
                case OfflinePersistanceDeleted(:final item):
                  context.read<ClipboardCubit>().deleteItem(item);
                  showTextSnackbar(
                    context.locale.itemDeleted,
                    closePrevious: true,
                  );
                case OfflinePersistanceSaved(
                    :final item,
                    :final created,
                  ):
                  context.read<ClipboardCubit>().put(item, isNew: created);
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
                case CloudPersistanceDeleting(:final item):
                  context.read<ClipboardCubit>().put(item);
                  showTextSnackbar(
                    context.locale.deletingFromCloud,
                    isLoading: true,
                    closePrevious: true,
                  );
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
        child: Scaffold(
          appBar: AppBar(
            title: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -13,
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: Image.asset(
                      AssetConstants.catImage,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 53),
                  child: Text(context.locale.appName),
                ),
              ],
            ),
            titleTextStyle: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            actions: [
              ActivePlanAction(compact: isMobile),
              width12,
              if (isDesktopPlatform) const PinToTopToggleButton(),
              if (isDesktopPlatform) const CompactModeToggleButton(),
              if (isDesktopPlatform) const HideWindowButton(),
              width12,
            ],
          ),
          body: ShareListener.fromPlatform(
            child: const HomePageBody(),
          ),
        ),
      ),
    );
  }
}
