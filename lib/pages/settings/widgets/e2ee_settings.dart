import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/widgets/badges.dart';
import 'package:clipboard/widgets/dialogs/e2ee_dialog.dart';
import 'package:clipboard/widgets/subscription/subscription_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class E2EESettings extends StatelessWidget {
  const E2EESettings({super.key});

  @override
  Widget build(BuildContext context) {
    return SubscriptionBuilder(
      builder: (context, subscription) {
        if (subscription == null) return const SizedBox.shrink();
        return BlocSelector<AppConfigCubit, AppConfigState, (bool, bool)>(
          selector: (state) {
            switch (state) {
              case AppConfigLoaded(:final config):
                return (config.enc2 != null, config.autoEncrypt);
              default:
                return (false, false);
            }
          },
          builder: (context, state) {
            final (setup, autoEncrypt) = state;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  title: const Row(
                    children: [
                      Text("End-to-End Encryption Vault"),
                      width8,
                      ProBadge(),
                    ],
                  ),
                  subtitle: const Text(
                    "Access your E2EE vault settings",
                  ),
                  // enabled: subscription.encrypt,
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => const E2EESettingDialog().show(context),
                ),
                SwitchListTile(
                  value: autoEncrypt,
                  onChanged: setup
                      ? (value) {
                          context
                              .read<AppConfigCubit>()
                              .toggleAutoEncrypt(value);
                        }
                      : null,
                  title: const Row(
                    children: [
                      Text("Encrypt Clipboard"),
                      width8,
                      ProBadge(),
                    ],
                  ),
                  subtitle: const Text(
                    "Encrypt clipboard before syncing with the cloud.",
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
