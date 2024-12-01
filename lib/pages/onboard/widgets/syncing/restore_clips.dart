import 'dart:math' show max;

import 'package:animate_do/animate_do.dart';
import 'package:copycat_base/bloc/clip_sync_manager_cubit/clip_sync_manager_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/sync_status/syncstatus.dart';
import 'package:copycat_base/domain/repositories/clipboard.dart';
import 'package:copycat_base/domain/repositories/restoration_status.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestoreClipsStep extends StatefulWidget {
  final VoidCallback onContinue;
  final ClipboardRepository clipboardRepository;
  final RestorationStatusRepository restorationStatusRepository;

  const RestoreClipsStep({
    super.key,
    required this.onContinue,
    required this.clipboardRepository,
    required this.restorationStatusRepository,
  });

  @override
  State<RestoreClipsStep> createState() => _RestoreClipsStepState();
}

class _RestoreClipsStepState extends State<RestoreClipsStep> {
  int totalCount = -1;
  bool fetchingCount = false;
  late final ClipSyncManagerCubit syncCubit;
  late SyncStatus? syncStatus;

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
      final syncStatusResult =
          await widget.restorationStatusRepository.getStatus();
      syncStatusResult.fold((l) => showFailureSnackbar(l), (r) {
        syncStatus = r;
      });
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
        syncCubit.syncClips(
          syncStartTs: syncStatus?.lastSyncStartPoint,
          lastSyncedCount: syncStatus?.lastKnownSyncCount ?? 0,
          restoration: true,
        );
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

  Future<void> updateSyncStatus(
    int synced,
    DateTime fromTs,
    DateTime toTs,
  ) async {
    await widget.restorationStatusRepository.setStatus(
      SyncStatus(
        lastSyncStartPoint: fromTs,
        lastSyncPoint: toTs,
        lastKnownSyncCount: synced,
        lastKnownTotalCount: totalCount,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return ZoomIn(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restore_rounded,
              size: 32,
            ),
            height10,
            Text(
              "Restore My Clipboard",
              style: textTheme.headlineMedium,
            ),
            height8,
            if (fetchingCount)
              CircularProgressIndicator()
            else if (totalCount < 0)
              Column(
                children: [
                  Text("Failed to find any clips backup."),
                  height10,
                  ElevatedButton(
                      onPressed: startSyncing, child: Text('Try Again')),
                ],
              )
            else
              Column(
                children: [
                  Text(
                    "You have approximately $totalCount clips to restore.",
                    textAlign: TextAlign.center,
                  ),
                  height12,
                  SizedBox(width: 100, height: 20, child: Divider()),
                  height8,
                  BlocConsumer<ClipSyncManagerCubit, ClipSyncManagerState>(
                    listener: (context, state) {
                      switch (state) {
                        case ClipSyncComplete(
                            :final syncCount,
                            :final fromTs,
                            :final toTs,
                          ):
                          updateSyncStatus(
                            max(syncCount, totalCount),
                            fromTs,
                            toTs,
                          );
                          updateTotalCount(syncCount);
                        case ClipSyncing(
                            :final synced,
                            :final fromTs,
                            :final toTs,
                          ):
                          updateSyncStatus(synced, fromTs, toTs);
                        case _:
                      }
                    },
                    builder: (context, state) {
                      switch (state) {
                        case ClipSyncDisabled():
                          return Text(
                            "Syncing is currently disabled. Please enable it to continue.",
                            textAlign: TextAlign.center,
                          );
                        case ClipSyncUnknown() || ClipSyncingUnknown():
                          return Text("Preparing to sync. Please wait...");
                        case ClipSyncComplete(:final syncCount):
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
                                "Your $syncCount clips have been restored successfully.",
                                textAlign: TextAlign.center,
                              ),
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
                                    borderRadius: radius12,
                                    value: synced / max(totalCount, synced),
                                  ),
                                ),
                              height10,
                              Text(
                                "Restored: $synced of ${max(totalCount, synced)} clips.",
                                textAlign: TextAlign.center,
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
