import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/constants/numbers/duration.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutoSyncInterval extends StatelessWidget {
  const AutoSyncInterval({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    return BlocSelector<AppConfigCubit, AppConfigState, int>(
      selector: (state) {
        switch (state) {
          case AppConfigLoaded(:final config):
            return config.autoSyncInterval.isNegative
                ? $90S
                : config.autoSyncInterval;
          default:
            return $90S;
        }
      },
      builder: (context, state) {
        return ListTile(
          title: const Text("Auto Sync Interval"),
          subtitle: Text(
            "Clipboard will be automatically synced every "
            "${prettyDuration(Duration(seconds: state), abbreviated: true, delimiter: " ")}",
            style: textTheme.bodySmall?.copyWith(
              color: colors.outline,
            ),
          ),
          trailing: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: state,
              padding: const EdgeInsets.symmetric(horizontal: padding16),
              borderRadius: radius12,
              items: const [
                DropdownMenuItem(
                  value: $5S,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox.square(
                        dimension: 24,
                        child: Icon(
                          Icons.cloud_sync_rounded,
                          size: 12,
                        ),
                      ),
                      width12,
                      Text("5 Sec"),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: $15S,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox.square(
                        dimension: 24,
                        child: Icon(
                          Icons.cloud_sync_rounded,
                          size: 16,
                        ),
                      ),
                      width12,
                      Text("15 Sec"),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: $30S,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox.square(
                        dimension: 24,
                        child: Icon(
                          Icons.cloud_sync_rounded,
                          size: 20,
                        ),
                      ),
                      width12,
                      Text("30 Sec"),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: $60S,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox.square(
                        dimension: 24,
                        child: Icon(
                          Icons.cloud_sync_rounded,
                          size: 24,
                        ),
                      ),
                      width12,
                      Text("60 Sec"),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: $90S,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.cloud_sync_rounded, size: 28),
                      width12,
                      Text("90 Sec"),
                    ],
                  ),
                ),
              ],
              onChanged: (duration) {
                if (duration != null) {
                  context
                      .read<AppConfigCubit>()
                      .changeAutoSyncDuration(duration);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
