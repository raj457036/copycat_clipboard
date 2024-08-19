import 'package:clipboard/widgets/badges.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_pro/widgets/subscription/subscription_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_io/io.dart';

class DragAndDropSwitchTile extends StatelessWidget {
  const DragAndDropSwitchTile({super.key});

  @override
  Widget build(BuildContext context) {
    // final side = MediaQuery.of(context).size.shortestSide;
    // final isTablet = side > Breakpoints.sm;
    bool isDNDSupported = true;
    if (Platform.isAndroid) isDNDSupported = false;

    return BlocSelector<AppConfigCubit, AppConfigState, bool>(
      selector: (state) {
        switch (state) {
          case AppConfigLoaded(:final config):
            return config.enableDragNDrop;
          default:
            return false;
        }
      },
      builder: (context, enabled) {
        return SubscriptionBuilder(
          builder: (context, subscription) {
            final isInPlan = subscription != null &&
                subscription.isActive &&
                subscription.dragNdrop;
            return SwitchListTile(
                value: isDNDSupported && enabled,
                onChanged: isInPlan && isDNDSupported
                    ? (value) {
                        context.read<AppConfigCubit>().toggleDragNDrop(value);
                      }
                    : null,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(context.locale.dragNdrop),
                    width8,
                    const ProBadge(),
                  ],
                ),
                subtitle: isDNDSupported
                    ? Text(context.locale.dragNdropDesc)
                    : Text(context.locale.featureNotSupported));
          },
        );
      },
    );
  }
}
