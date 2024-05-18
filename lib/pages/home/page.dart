import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:clipboard/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/constants/numbers/breakpoints.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/clip_card.dart';
import 'package:clipboard/widgets/compact_mode_toggle.dart';
import 'package:clipboard/widgets/minimize_window.dart';
import 'package:clipboard/widgets/pin_to_top_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _loadMore(BuildContext context) async {
    await context.read<ClipboardCubit>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final textTheme = context.textTheme;
    final isMobile = Breakpoints.isMobile(width);
    return MultiBlocListener(
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
                        'Changes Available:\n $added Added, $updated Updated and $deleted Deleted',
                        duration: 30,
                        closePrevious: true,
                        action: SnackBarAction(
                          label: "Refresh Now",
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
                showTextSnackbar("Item Deleted", closePrevious: true);
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
                  "Deleting from cloud",
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
          title: const Text("Clipboard"),
          titleTextStyle: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          actions: [
            if (isDesktop) const MinimizeWindowButton(),
            if (isDesktop) const PinToTopToggleButton(),
            if (isDesktop) const CompactModeToggleButton(),
            width12,
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async => await syncChanges(context),
          child: BlocSelector<ClipboardCubit, ClipboardState,
              (List<ClipboardItem>, bool, bool)>(
            selector: (state) {
              return (state.items, state.hasMore, state.loading);
            },
            builder: (context, state) {
              final (items, hasMore, loading) = state; //Subject;

              if (items.isEmpty) {
                if (loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return const Center(
                  child: Text("Your clipboard is empty."),
                );
              }

              return GridView.builder(
                padding: insetLTR16,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  crossAxisSpacing: padding8,
                  mainAxisSpacing: padding8,
                  childAspectRatio: isMobile ? 2 / 3 : 1,
                ),
                itemCount: items.length + (hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == items.length) {
                    return Card.outlined(
                      margin: EdgeInsets.zero,
                      child: Center(
                        child: TextButton.icon(
                          onPressed: () => _loadMore(context),
                          label: const Text(
                            "Load More",
                          ),
                          icon: const Icon(Icons.read_more),
                        ),
                      ),
                    );
                  }

                  final item = items[index];
                  return ClipCard(
                    key: ValueKey("clipboard-item-${item.id}"),
                    item: item,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
