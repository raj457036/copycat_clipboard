import 'dart:math' show max;

import 'package:copycat_base/bloc/clip_sync_manager_cubit/clip_sync_manager_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/domain/repositories/clipboard.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/snackbar.dart';
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
      final result = await widget.clipboardRepository.getClipCounts();
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
            Icons.cloud_sync_rounded,
            size: 32,
          ),
          height10,
          Text(
            "Your Clipboard",
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
                ElevatedButton(onPressed: fetchCount, child: Text('Try Again')),
              ],
            )
          else
            Column(
              children: [
                Text("You have about ~$totalCount clips"),
                height12,
                BlocBuilder<ClipSyncManagerCubit, ClipSyncManagerState>(
                  builder: (context, state) {
                    switch (state) {
                      case ClipSyncDisabled():
                        return Text("Syncing is disabled");
                      case ClipSyncUnknown() || ClipSyncingUnknown():
                        return SizedBox(
                          width: 250,
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(10),
                            value: 0.7,
                          ),
                        );
                      case ClipSyncComplete():
                        return Text("Sync Complete Successfully");
                      case ClipSyncFailed():
                        return SizedBox.shrink();
                      case ClipSyncing(:final synced):
                        return Column(
                          children: [
                            Text("Synced $synced/${max(totalCount, synced)}"),
                            LinearProgressIndicator(
                              value: synced / max(totalCount, synced),
                            ),
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
