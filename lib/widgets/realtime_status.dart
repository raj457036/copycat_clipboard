import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/bloc/realtime_clip_sync_cubit/realtime_clip_sync_cubit.dart';
import 'package:copycat_base/bloc/realtime_collection_sync_cubit/realtime_collection_sync_cubit.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RealTimeConnectionStatus extends StatelessWidget {
  final Widget child;
  const RealTimeConnectionStatus({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Builder(builder: (context) {
      final isRealTimeActive =
          context.watch<AppConfigCubit>().state.config.syncSpeed ==
              SyncSpeed.realtime;
      final rtClip = context.watch<RealtimeClipSyncCubit>().state;
      final rtCollection = context.watch<RealtimeCollectionSyncCubit>().state;

      if (!isRealTimeActive) {
        return child;
      }

      Icon indicator = Icon(Icons.all_inclusive);
      switch (rtClip) {
        case RealtimeClipSyncUnknown():
          indicator = Icon(
            Icons.all_inclusive,
            size: 16,
          );
        case RealtimeClipSyncConnecting():
          indicator = Icon(
            Icons.all_inclusive,
            color: Colors.yellow,
            size: 16,
          );
        case RealtimeClipSyncConnected():
          indicator = Icon(
            Icons.all_inclusive,
            color: Colors.lightGreen,
            size: 16,
          );
        case RealtimeClipSyncDisconnected():
          indicator = Icon(
            Icons.all_inclusive,
            color: Colors.red,
            size: 16,
          );
      }

      switch (rtCollection) {
        case RealtimeCollectionSyncUnknown():
          indicator = Icon(Icons.all_inclusive);
        case RealtimeCollectionSyncConnecting():
          indicator = Icon(
            Icons.all_inclusive,
            color: Colors.amber,
            size: 16,
          );
        case RealtimeCollectionSyncConnected():
          indicator = Icon(
            Icons.all_inclusive,
            color: Colors.green,
            size: 16,
          );
        case RealtimeCollectionSyncDisconnected():
          indicator = Icon(
            Icons.all_inclusive,
            color: Colors.red,
            size: 16,
          );
      }

      return Badge(
        label: Tooltip(
          message: "Realtime Connection",
          child: indicator,
        ),
        backgroundColor: colors.surface,
        child: child,
      );
    });

    // return MultiBlocListener(
    //   listeners: [
    //     BlocListener<RealtimeCollectionSyncCubit, RealtimeCollectionSyncState>(
    //       listener: (context, state) {
    //         switch (state) {
    //           case RealtimeCollectionSyncUnknown():
    //             print("RealtimeCollectionSyncUnknown");
    //           case RealtimeCollectionSyncConnecting():
    //             print("RealtimeCollectionSyncConnecting");
    //           case RealtimeCollectionSyncConnected():
    //             print("RealtimeCollectionSyncConnected");
    //           case RealtimeCollectionSyncDisconnected():
    //             print("RealtimeCollectionSyncDisconnected");
    //         }
    //       },
    //     ),
    //     BlocListener<RealtimeClipSyncCubit, RealtimeClipSyncState>(
    //       listener: (context, state) {
    //         switch (state) {
    //           case RealtimeClipSyncUnknown():
    //             print("RealtimeClipSyncUnknown");
    //           case RealtimeClipSyncConnecting():
    //             print("RealtimeClipSyncConnecting");
    //           case RealtimeClipSyncConnected():
    //             print("RealtimeClipSyncConnected");
    //           case RealtimeClipSyncDisconnected():
    //             print("RealtimeClipSyncDisconnected");
    //         }
    //       },
    //     ),
    //   ],
    //   child: child,
    // );
  }
}
