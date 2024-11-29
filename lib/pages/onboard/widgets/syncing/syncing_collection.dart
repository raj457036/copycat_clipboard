import 'dart:math' show max;

import 'package:copycat_base/bloc/collection_sync_manager_cubit/collection_sync_manager_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/domain/repositories/clip_collection.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncingCollectionStep extends StatefulWidget {
  final VoidCallback onContinue;
  final ClipCollectionRepository collectionRepository;
  const SyncingCollectionStep({
    super.key,
    required this.onContinue,
    required this.collectionRepository,
  });

  @override
  State<SyncingCollectionStep> createState() => _SyncingCollectionStepState();
}

class _SyncingCollectionStepState extends State<SyncingCollectionStep> {
  int totalCount = -1;
  bool fetchingCount = false;
  late final CollectionSyncManagerCubit syncCubit;

  @override
  void initState() {
    super.initState();
    syncCubit = context.read<CollectionSyncManagerCubit>();
    startSyncing();
  }

  Future<void> startSyncing() async {
    setState(() {
      fetchingCount = true;
    });
    try {
      if (totalCount > -1) {
        syncCollection();
        return;
      }
      final result = await widget.collectionRepository.getCount(local: false);
      result.fold(
        (l) => showFailureSnackbar(l),
        (r) {
          totalCount = r;
          syncCollection();
        },
      );
    } finally {
      setState(() {
        fetchingCount = false;
      });
    }
  }

  Future<void> syncCollection() async {
    await wait(1000);
    switch (syncCubit.state) {
      case CollectionSyncUnknown() ||
            CollectionSyncingUnknown() ||
            CollectionSyncFailed():
        syncCubit.syncCollections(triggerReaction: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.collections_bookmark_rounded,
            size: 32,
          ),
          height10,
          Text(
            "My Collections",
            style: textTheme.headlineMedium,
          ),
          height8,
          if (fetchingCount)
            CircularProgressIndicator()
          else if (totalCount < 0)
            Column(
              children: [
                Text(
                  "We couldn't fetch the total size of your collections.",
                ),
                height10,
                ElevatedButton(
                    onPressed: startSyncing, child: Text('Try Again')),
              ],
            )
          else
            Column(
              children: [
                Text(
                  "You have approximately $totalCount collections",
                  style: textTheme.titleMedium,
                ),
                height12,
                SizedBox(width: 100, height: 20, child: Divider()),
                height8,
                BlocBuilder<CollectionSyncManagerCubit,
                    CollectionSyncManagerState>(
                  builder: (context, state) {
                    switch (state) {
                      case CollectionSyncDisabled():
                        return Text(
                            "Syncing is currently disabled. Please enable it to continue.");
                      case CollectionSyncUnknown() ||
                            CollectionSyncingUnknown():
                        return Text("Preparing to sync. Please wait...");
                      case CollectionSyncComplete(:final syncCount):
                        return Column(
                          children: [
                            Text(
                                "Your $syncCount collections have been synced successfully."),
                            height10,
                            ElevatedButton(
                              onPressed: widget.onContinue,
                              child: Text(context.locale.continue_),
                            ),
                          ],
                        );
                      case CollectionSyncFailed(:final failure):
                        return Column(
                          children: [
                            Text("Sync Failed: ${failure.message}"),
                            height10,
                            ElevatedButton(
                              onPressed: startSyncing,
                              child: Text('Try Again'),
                            ),
                          ],
                        );
                      case CollectionSyncing(:final synced):
                        return Column(
                          children: [
                            if (totalCount > 0 || synced > 0)
                              SizedBox(
                                width: 250,
                                child: LinearProgressIndicator(
                                  borderRadius: BorderRadius.circular(10),
                                  value: synced / max(totalCount, synced),
                                ),
                              ),
                            height10,
                            Text(
                                "Synced: $synced of ${max(totalCount, synced)} collections."),
                          ],
                        );
                      case _:
                        // no-op
                        return SizedBox.shrink();
                    }
                  },
                ),
              ],
            )
        ],
      ),
    );
  }
}
