import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/constants/numbers/duration.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/widgets/badges.dart';
import 'package:clipboard/widgets/subscription/subscription_provider.dart';
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
        return BlocSelector<AppConfigCubit, AppConfigState, (int, bool)>(
          selector: (state) {
            switch (state) {
              case AppConfigLoaded(:final config):
                final val = config.autoSyncInterval.isNegative
                    ? $45S
                    : config.autoSyncInterval;
                return (
                  val,
                  config.enableSync,
                );
              default:
                return ($45S, false);
            }
          },
          builder: (context, state) {
            final (duration, enabled) = state;
            return ListTile(
              enabled: enabled,
              title: Text(context.locale.autoSyncInterval),
              subtitle: Text(
                context.locale.autoSyncIntervalDesc,
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
                    if (subscription != null)
                      DropdownMenuItem(
                        enabled: subscription.syncInterval <= $5S,
                        value: $5S,
                        child: Row(
                          children: [
                            Text(context.locale.$5Sec),
                            width8,
                            const ProBadge(),
                          ],
                        ),
                      ),
                    if (subscription != null)
                      DropdownMenuItem(
                        enabled: subscription.syncInterval <= $5S,
                        value: $10S,
                        child: Row(
                          children: [
                            Text(context.locale.$10Sec),
                            width8,
                            const ProBadge(),
                          ],
                        ),
                      ),
                    if (subscription != null)
                      DropdownMenuItem(
                        enabled: subscription.syncInterval <= $5S,
                        value: $20S,
                        child: Row(
                          children: [
                            Text(context.locale.$20Sec),
                            width8,
                            const ProBadge(),
                          ],
                        ),
                      ),
                    DropdownMenuItem(
                      value: $45S,
                      child: Text(context.locale.$45Sec),
                    ),
                    DropdownMenuItem(
                      value: $60S,
                      child: Text(context.locale.$60Sec),
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
