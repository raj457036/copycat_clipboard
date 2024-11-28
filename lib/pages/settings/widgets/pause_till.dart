import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/datetime_extension.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PauseTill extends StatelessWidget {
  const PauseTill({super.key});

  Future<void> onPressed(BuildContext context, bool isActive) async {
    if (isActive) {
      context.read<AppConfigCubit>().changePausedTill(null);
      return;
    }
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      final now_ = now();
      final pauseTill = now_.copyWith(hour: time.hour, minute: time.minute);

      if (pauseTill.isAfter(now_)) {
        // ignore: use_build_context_synchronously
        context.read<AppConfigCubit>().changePausedTill(pauseTill);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isMobilePlatform) return const SizedBox.shrink();
    final textTheme = context.textTheme;
    final colors = context.colors;
    return BlocSelector<AppConfigCubit, AppConfigState, DateTime?>(
      selector: (state) {
        switch (state) {
          case AppConfigLoaded(:final config):
            return config.pausedTill;
          default:
            return null;
        }
      },
      builder: (context, state) {
        final isActive = state != null && now().isBefore(state);
        return SwitchListTile(
          title: Text(context.locale.isPaused),
          subtitle: Text(
            context.locale.isPausedDesc(
              "$isActive",
              isActive
                  ? dateTimeFormatter(context.locale.localeName).format(state)
                  : '',
            ),
            style: textTheme.bodyMedium?.copyWith(
              color: colors.outline,
            ),
          ),
          value: isActive,
          onChanged: (value) => onPressed(context, !value),
        );
      },
    );
  }
}
