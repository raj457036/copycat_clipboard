import 'dart:math' show max;

import 'package:copycat_base/bloc/clip_sync_manager_cubit/clip_sync_manager_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/domain/repositories/clipboard.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncingClipsStep extends StatefulWidget {
  final VoidCallback onContinue;
  final ClipboardRepository clipboardRepository;
  const SyncingClipsStep({
    super.key,
    required this.onContinue,
    required this.clipboardRepository,
  });

  @override
  State<SyncingClipsStep> createState() => _SyncingClipsStepState();
}

class _SyncingClipsStepState extends State<SyncingClipsStep> {
  int totalCount = -1;
  bool fetchingCount = false;
  late final ClipSyncManagerCubit syncCubit;

  @override
  void initState() {
    super.initState();
    syncCubit = context.read<ClipSyncManagerCubit>();
    startSyncing();
  }

  Future<void> startSyncing() async {
    setState(() {
      fetchingCount = true;
    });
    try {
      if (totalCount > -1) {
        syncClips();
        return;
      }
      final lastSync = syncCubit.getLastSyncedTime();
      final result = await widget.clipboardRepository.getClipCounts(lastSync);
      result.fold(
        (l) => showFailureSnackbar(l),
        (r) {
          totalCount = r;
          syncClips();
        },
      );
    } finally {
      setState(() {
        fetchingCount = false;
      });
    }
  }

  Future<void> syncClips() async {
    await wait(1000);
    switch (syncCubit.state) {
      case ClipSyncUnknown() || ClipSyncingUnknown() || ClipSyncFailed():
        syncCubit.syncClips();
      case _:
    }
  }

  void updateTotalCount(int syncCount) {
    if (syncCount > totalCount) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          totalCount = syncCount;
        });
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
            Icons.paste_rounded,
            size: 32,
          ),
          height10,
          Text(
            "My Clipboard",
            style: textTheme.headlineMedium,
          ),
          height8,
          if (fetchingCount)
            CircularProgressIndicator()
          else if (totalCount < 0)
            Column(
              children: [
                Text("We couldn't fetch the total size of your clipboard."),
                height10,
                ElevatedButton(
                    onPressed: startSyncing, child: Text('Try Again')),
              ],
            )
          else
            Column(
              children: [
                Text("You have approximately $totalCount clips"),
                height12,
                SizedBox(width: 100, height: 20, child: Divider()),
                height8,
                BlocBuilder<ClipSyncManagerCubit, ClipSyncManagerState>(
                  builder: (context, state) {
                    switch (state) {
                      case ClipSyncDisabled():
                        return Text(
                            "Syncing is currently disabled. Please enable it to continue.");
                      case ClipSyncUnknown() || ClipSyncingUnknown():
                        return Text("Preparing to sync. Please wait...");
                      case ClipSyncComplete(:final syncCount):
                        updateTotalCount(syncCount);
                        return Column(
                          children: [
                            Text(
                                "Your $syncCount clips have been synced successfully."),
                            height10,
                            FilledButton.tonalIcon(
                              onPressed: widget.onContinue,
                              label: Text("Let's Go Home"),
                              icon: Icon(Icons.check_rounded),
                            ),
                          ],
                        );
                      case ClipSyncFailed(:final failure):
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
                      case ClipSyncing(:final synced):
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
                              "Synced: $synced of ${max(totalCount, synced)} clips.",
                            ),
                            height12,
                            Text(
                              "⚠️ Please keep this screen open during syncing to avoid data corruption or inconsistencies.",
                              style: textTheme.bodySmall?.copyWith(
                                color: Colors.yellow,
                              ),
                            )
                          ],
                        );
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
