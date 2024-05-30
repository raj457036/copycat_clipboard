import 'package:clipboard/constants/widget_styles.dart';
import 'package:flutter/material.dart';

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
    return const SimpleDialog(
      title: Row(
        children: [
          Text("Subscription"),
          Spacer(),
          CloseButton(),
        ],
      ),
      children: [
        Divider(),
        ListTile(
          title: Text(
            "BETA",
            style: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "CopyCat Clipboard is in Beta, "
            "There might be some bugs here and there, more features will be available soon.",
          ),
        ),
        Divider(),
        ListTile(
          title: Text("Current Plan"),
          subtitle: Text("FREE"),
        ),
        ListTile(
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
