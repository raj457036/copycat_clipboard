import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/subscription/subscription.dart';
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
      title: const Row(
        children: [
          Text("Subscription"),
          Spacer(),
          CloseButton(),
        ],
      ),
      children: [
        const Divider(),
        const ListTile(
          title: Text(
            "BETA",
            style: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "CopyCat Clipboard is currently in the Beta phase. While we "
            "strive for a seamless experience, you may encounter occasional "
            "bugs. Stay tuned for upcoming features and enhancements.",
          ),
        ),
        const Divider(),
        ListTile(
          title: const Text("Current Plan"),
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
        const ListTile(
          title: Text("Included"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height4,
              Text("• Unlimited Clipboard Items"),
              height4,
              Text("• Support all major platforms"),
              height4,
              Text("• Supports Apple's Universal Clipboard"),
              height4,
              Text("• On-Device Storage"),
              height4,
              Text("• Google Drive Integration"),
              height4,
              Text("• Instant Search"),
              height4,
              Text("• Syncing up to Last 24 Hours"),
              height4,
              Text("• Up to 3 Collections"),
              height4,
              Text("• Auto-Sync Every 30 Seconds"),
            ],
          ),
        )
      ],
    );
  }
}
