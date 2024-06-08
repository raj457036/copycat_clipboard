import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/subscription/subscription.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionInfoDialog extends StatelessWidget {
  const SubscriptionInfoDialog({super.key});

  Future<void> open(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Row(
        children: [
          Text(context.locale.subscription),
          const Spacer(),
          const CloseButton(),
        ],
      ),
      children: [
        const Divider(),
        ListTile(
          title: Text(
            context.locale.beta,
            style: const TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            context.locale.featureListDetail,
          ),
        ),
        const Divider(),
        ListTile(
          title: Text(context.locale.currentPlan),
          subtitle: BlocSelector<AuthCubit, AuthState, Subscription?>(
            selector: (state) {
              if (state is AuthenticatedAuthState) {
                return state.subscription;
              }
              return null;
            },
            builder: (context, state) {
              return Text(state?.planName ?? "FREE");
            },
          ),
        ),
        ListTile(
          title: Text(context.locale.included),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height4,
              Text(context.locale.unlimitedClipboardItems),
              height4,
              Text(context.locale.supportAllMajorPlatforms),
              height4,
              Text(context.locale.supportsAppleUniversalClipboard),
              height4,
              Text(context.locale.onDeviceStorage),
              height4,
              Text(context.locale.googleDriveIntegration),
              height4,
              Text(context.locale.instantSearch),
              height4,
              Text(context.locale.syncingUpToLast24Hours),
              height4,
              Text(context.locale.upTo3Collections),
              height4,
              Text(context.locale.autoSyncEvery30Seconds),
            ],
          ),
        )
      ],
    );
  }
}
