import 'dart:math' show max;

import 'package:animate_do/animate_do.dart';
import 'package:copycat_base/bloc/collection_sync_manager_cubit/collection_sync_manager_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/domain/repositories/clip_collection.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestoreCollectionStep extends StatefulWidget {
  final VoidCallback onContinue;
  final ClipCollectionRepository collectionRepository;
  const RestoreCollectionStep({
    super.key,
    required this.onContinue,
    required this.collectionRepository,
  });

  @override
  State<RestoreCollectionStep> createState() => _RestoreCollectionStepState();
}

class _RestoreCollectionStepState extends State<RestoreCollectionStep> {
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

    if (totalCount == 0) {
      widget.onContinue();
      return;
    }

    switch (syncCubit.state) {
      case CollectionSyncUnknown() ||
            CollectionSyncingUnknown() ||
            CollectionSyncFailed():
        syncCubit.syncCollections(restoration: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return ZoomIn(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.collections_bookmark_rounded,
              size: 32,
            ),
            height10,
            Text(
              "Restore My Collections",
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium,
            ),
            height8,
            if (fetchingCount)
              CircularProgressIndicator()
            else if (totalCount < 0)
              Column(
                children: [
                  Text("Failed to find any collections backup.",
                      textAlign: TextAlign.center),
                  height10,
                  ElevatedButton(
                      onPressed: startSyncing, child: Text('Try Again')),
                ],
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "You have approximately $totalCount collections",
                    textAlign: TextAlign.center,
                    style: textTheme.titleMedium,
                  ),
                  height12,
                  SizedBox(width: 100, height: 20, child: Divider()),
                  height8,
                  BlocConsumer<CollectionSyncManagerCubit,
                      CollectionSyncManagerState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      switch (state) {
                        case CollectionSyncDisabled():
                          return Text(
                            "Syncing is currently disabled. Please enable it to continue.",
                            textAlign: TextAlign.center,
                          );
                        case CollectionSyncUnknown() ||
                              CollectionSyncingUnknown():
                          return Text("Preparing to sync. Please wait...");
                        case CollectionSyncComplete(:final syncCount):
                          return Column(
                            children: [
                              const SizedBox(
                                width: 250,
                                child: LinearProgressIndicator(
                                  borderRadius: radius12,
                                  value: 1,
                                ),
                              ),
                              height10,
                              Text(
                                "Your $syncCount collections have been restored successfully.",
                                textAlign: TextAlign.center,
                              ),
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
                                    borderRadius: radius12,
                                    value: synced / max(totalCount, synced),
                                  ),
                                ),
                              height10,
                              Text(
                                "Restored: $synced of ${max(totalCount, synced)} collections.",
                              ),
                              height12,
                              Text(
                                "⚠️ Please keep this screen open during syncing to avoid data corruption or inconsistencies.",
                                textAlign: TextAlign.center,
                                style: textTheme.bodySmall?.copyWith(
                                  color: Colors.deepOrange,
                                  fontStyle: FontStyle.italic,
                                ),
                              )
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
      ),
    );
  }
}
