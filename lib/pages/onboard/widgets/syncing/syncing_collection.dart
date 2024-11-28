import 'dart:math' show max;

import 'package:copycat_base/bloc/collection_sync_manager_cubit/collection_sync_manager_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/domain/repositories/clip_collection.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/snackbar.dart';
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

  @override
  void initState() {
    super.initState();
    fetchCount();
  }

  Future<void> fetchCount() async {
    setState(() {
      fetchingCount = true;
    });
    try {
      final result = await widget.collectionRepository.getCount(local: false);
      result.fold(
        (l) => showFailureSnackbar(l),
        (r) => totalCount = r,
      );
    } finally {
      setState(() {
        fetchingCount = false;
      });
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
            "Collections",
            style: textTheme.headlineMedium,
          ),
          height8,
          if (fetchingCount)
            CircularProgressIndicator()
          else if (totalCount < 0)
            Column(
              children: [
                Text("We couldn't fetch the total size of your collections."),
                height10,
                ElevatedButton(onPressed: fetchCount, child: Text('Try Again')),
              ],
            )
          else
            Column(
              children: [
                Text("You have about ~$totalCount collections"),
                height12,
                BlocBuilder<CollectionSyncManagerCubit,
                    CollectionSyncManagerState>(
                  builder: (context, state) {
                    switch (state) {
                      case CollectionSyncDisabled():
                        return Text("Syncing is disabled");
                      case CollectionSyncUnknown() ||
                            CollectionSyncingUnknown():
                        return SizedBox(
                          width: 250,
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      case CollectionSyncComplete():
                        return Text("Sync Complete Successfully");
                      case CollectionSyncFailed():
                        return SizedBox.shrink();
                      case CollectionSyncing(:final synced):
                        return Column(
                          children: [
                            SizedBox(
                              width: 250,
                              child: LinearProgressIndicator(
                                borderRadius: BorderRadius.circular(10),
                                value: synced / max(totalCount, synced),
                              ),
                            ),
                            Text("Synced $synced/${max(totalCount, synced)}"),
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
