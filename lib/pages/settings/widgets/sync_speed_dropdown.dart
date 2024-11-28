import 'package:clipboard/widgets/badges.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/constants/numbers/duration.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_pro/widgets/subscription/subscription_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncSpeedDropdown extends StatelessWidget {
  const SyncSpeedDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    return SubscriptionBuilder(
      builder: (context, subscription) {
        return BlocSelector<AppConfigCubit, AppConfigState, (SyncSpeed, bool)>(
          selector: (state) {
            switch (state) {
              case AppConfigLoaded(:final config):
                return (
                  config.syncSpeed,
                  config.enableSync,
                );
              default:
                return (SyncSpeed.balanced, false);
            }
          },
          builder: (context, state) {
            final (speed, enabled) = state;
            return ListTile(
              enabled: enabled,
              title: Text(context.locale.autoSyncInterval),
              subtitle: Text(
                context.locale.autoSyncIntervalDesc,
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.outline,
                ),
              ),
              trailing: DropdownButtonHideUnderline(
                child: DropdownButton<SyncSpeed>(
                  value: speed,
                  padding: const EdgeInsets.symmetric(horizontal: padding10),
                  borderRadius: radius12,
                  items: [
                    if (subscription != null)
                      DropdownMenuItem(
                        enabled: subscription.syncInterval < $10S,
                        value: SyncSpeed.realtime,
                        child: const Row(
                          children: [
                            Text("⚡ Realtime"),
                            width8,
                            ProBadge(),
                          ],
                        ),
                      ),
                    DropdownMenuItem(
                      value: SyncSpeed.balanced,
                      child: Text(context.locale.$45Sec),
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
