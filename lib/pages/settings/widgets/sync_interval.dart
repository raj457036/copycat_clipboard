import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/constants/numbers/duration.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/widgets/badges.dart';
import 'package:clipboard/widgets/subscription/subscription_provider.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutoSyncInterval extends StatelessWidget {
  const AutoSyncInterval({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    return SubscriptionBuilder(
      builder: (context, subscription) {
        if (subscription == null) return const SizedBox.shrink();
        return BlocSelector<AppConfigCubit, AppConfigState, (int, bool)>(
          selector: (state) {
            switch (state) {
              case AppConfigLoaded(:final config):
                final val = config.autoSyncInterval.isNegative
                    ? $60S
                    : config.autoSyncInterval;
                return (val, config.enableSync);
              default:
                return ($60S, false);
            }
          },
          builder: (context, state) {
            final (duration, enabled) = state;
            return ListTile(
              enabled: enabled,
              title: Text(context.locale.autoSyncInterval),
              subtitle: Text(
                context.locale.autoSyncIntervalDesc(
                  prettyDuration(
                    Duration(seconds: duration),
                    abbreviated: true,
                    delimiter: " ",
                  ),
                ),
                style: textTheme.bodySmall?.copyWith(
                  color: colors.outline,
                ),
              ),
              trailing: DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: duration,
                  padding: const EdgeInsets.symmetric(horizontal: padding10),
                  borderRadius: radius12,
                  items: [
                    DropdownMenuItem(
                      enabled: subscription.syncInterval <= $5S,
                      value: $5S,
                      child: const Row(
                        children: [
                          Text("5 Sec"),
                          width8,
                          ProBadge(),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      enabled: subscription.syncInterval <= $5S,
                      value: $15S,
                      child: const Row(
                        children: [
                          Text("15 Sec"),
                          width8,
                          ProBadge(),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      enabled: subscription.syncInterval <= $5S,
                      value: $30S,
                      child: const Row(
                        children: [
                          Text("30 Sec"),
                          width8,
                          ProBadge(),
                        ],
                      ),
                    ),
                    const DropdownMenuItem(
                      value: $60S,
                      child: Text("60 Sec"),
                    ),
                    const DropdownMenuItem(
                      value: $90S,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("90 Sec"),
                      ),
                    ),
                  ],
                  onChanged: enabled
                      ? (duration) {
                          if (duration != null) {
                            context
                                .read<AppConfigCubit>()
                                .changeAutoSyncDuration(duration);
                          }
                        }
                      : null,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
