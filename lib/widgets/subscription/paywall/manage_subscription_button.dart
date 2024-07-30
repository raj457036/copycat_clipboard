import 'package:clipboard/bloc/monetization_cubit/monetization_cubit.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:copycat_base/db/subscription/subscription.dart';
import 'package:copycat_base/utils/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ManageSubscriptionButton extends StatelessWidget {
  const ManageSubscriptionButton({super.key});

  Future<void> manageSubscription(
    BuildContext context,
    Subscription subscription,
  ) async {
    if (subscription.managementUrl != null) {
      launchUrlString(subscription.managementUrl!);
      return;
    }
    if (subscription.source == "PROMO") {
      // ignore: use_build_context_synchronously
      final till = dateTimeFormatter(context.locale.localeName)
          .format(subscription.activeTill!);
      // ignore: use_build_context_synchronously
      showTextSnackbar(context.locale.promoSub(till));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonetizationCubit, MonetizationState>(
      builder: (context, state) {
        return state.when(
            unknown: () => const SizedBox.shrink(),
            active: (sub) {
              return ElevatedButton(
                onPressed: () => manageSubscription(context, sub),
                child: Text(context.locale.manageSubscriptions),
              );
            });
      },
    );
  }
}
