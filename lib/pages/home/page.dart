import 'package:clipboard/pages/home/widgets/appbar.dart';
import 'package:clipboard/pages/home/widgets/home_body.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/layout/custom_scaffold.dart';
import 'package:copycat_base/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:copycat_base/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:copycat_base/constants/key.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/constants/strings/strings.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_pro/widgets/drag_drop/drop_region.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_io/io.dart';
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
    final isMobile = Breakpoints.isMobile(width);
    final colors = context.colors;
    Widget scaffold = CustomScaffold(
      activeIndex: 0,
      backgroundColor: colors.surfaceContainer,
      appBar: isMobilePlatform ? const HomeAppbar() : null,
      body: const HomePageBody(),
      borderRadius: !isMobile
          ? const BorderRadius.only(
              topLeft: Radius.circular(18),
            )
          : null,
    );

    // NOTE: drag and drop doesn't work in android for now
    if (!Platform.isAndroid) {
      scaffold = ClipDropRegionProvider(
        child: scaffold,
        onDragStart: () {
          // context.read<WindowActionCubit>().dropView();
        },
      );
    }

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
        child: scaffold,
      ),
    );
  }
}
