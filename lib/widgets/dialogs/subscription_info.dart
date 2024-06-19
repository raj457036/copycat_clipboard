import 'package:clipboard/constants/numbers/breakpoints.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/datetime_extension.dart';
import 'package:clipboard/widgets/subscription/subscription_provider.dart';
import 'package:flutter/material.dart';

class SubscriptionInfoDialog extends StatelessWidget {
  const SubscriptionInfoDialog({super.key});

  Future<void> open(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => this,
    );
  }

  Future<void> upgrade(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = Breakpoints.isMobile(constraints.maxWidth);
      return AlertDialog(
        title: Row(
          children: [
            Text(context.locale.subscription),
            const Spacer(),
            const CloseButton(),
          ],
        ),
        insetPadding: isMobile
            ? const EdgeInsets.all(padding8)
            : const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
        contentPadding: isMobile ? EdgeInsets.zero : null,
        content: SizedBox(
          width: 450,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
              SubscriptionBuilder(
                  autoDowngrade: false,
                  builder: (context, state) {
                    final expired = !state.isActive;
                    final isTrial = state.isTrial;
                    return ListTile(
                      title: Text(context.locale.currentPlan),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(state.planName),
                              if (expired) const Text(" • Expired")
                            ],
                          ),
                          height2,
                          if (isTrial && state.trialEnd != null)
                            Text(
                              "Trial till "
                              "${dateTimeFormatter(context.locale.localeName).format(state.trialEnd!)}",
                            ),
                        ],
                      ),
                      trailing: expired
                          ? ElevatedButton.icon(
                              onPressed: () => upgrade(context),
                              icon: const Icon(Icons.workspace_premium_rounded),
                              label: const Text('UPGRADE'),
                            )
                          : null,
                    );
                  }),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const TabBar(tabs: [
                        Tab(text: "Free"),
                        Tab(text: "Pro"),
                      ]),
                      Expanded(
                        child: TabBarView(children: [
                          SingleChildScrollView(
                            child: ListTile(
                              title: Text(context.locale.included),
                              subtitle: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  height4,
                                  ListTile(
                                    leading: const Icon(Icons.paste_rounded),
                                    title: Text(
                                      context.locale.unlimitedClipboardItems,
                                    ),
                                    subtitle: const Text(
                                        "Never run out of space with unlimited clipboard items, ensuring you always have access to your most recent copies."),
                                  ),
                                  height4,
                                  ListTile(
                                    leading: const Icon(Icons.devices),
                                    title: Text(
                                      context.locale.supportAllMajorPlatforms,
                                    ),
                                    subtitle: const Text(
                                        "Seamlessly sync across all major platforms—Android, iOS, Windows, macOS, and Linux —for uninterrupted productivity anywhere."),
                                  ),
                                  height4,
                                  ListTile(
                                    leading: const Icon(
                                        Icons.fiber_smart_record_outlined),
                                    title: Text(context.locale
                                        .supportsAppleUniversalClipboard),
                                    subtitle: const Text(
                                        "Effortlessly transfer clipboard content between your Apple devices with support for Apple's Universal Clipboard."),
                                  ),
                                  height4,
                                  ListTile(
                                    leading: const Icon(Icons.storage_rounded),
                                    title: Text(context.locale.onDeviceStorage),
                                    subtitle: const Text(
                                        "Keep your data secure with on-device storage, ensuring your clipboard items are always within reach and under your control."),
                                  ),
                                  height4,
                                  ListTile(
                                    leading:
                                        const Icon(Icons.add_to_drive_rounded),
                                    title: Text(
                                        context.locale.googleDriveIntegration),
                                    subtitle: const Text(
                                        "Securely store files and media on Google Drive, integrating seamlessly with CopyCat Clipboard for enhanced data management."),
                                  ),
                                  height4,
                                  ListTile(
                                    leading:
                                        const Icon(Icons.manage_search_rounded),
                                    title: Text(context.locale.instantSearch),
                                    subtitle: const Text(
                                        "Find what you need instantly with powerful instant search capabilities, making retrieval of clipboard items fast and efficient."),
                                  ),
                                  height4,
                                  ListTile(
                                    leading:
                                        const Icon(Icons.cloud_sync_rounded),
                                    title: Text(
                                        context.locale.syncingUpToLast24Hours),
                                    subtitle: const Text(
                                        "Access and sync your clipboard history for up to 24 hours, ensuring you never lose important copies."),
                                  ),
                                  height4,
                                  ListTile(
                                    leading: const Icon(
                                        Icons.collections_bookmark_rounded),
                                    title:
                                        Text(context.locale.upTo3Collections),
                                    subtitle: const Text(
                                        "Organize your clipboard items into up to 3 collections, providing simple categorization for better workflow management."),
                                  ),
                                  height4,
                                  ListTile(
                                    leading: const Icon(Icons.sync_alt_rounded),
                                    title: Text(
                                      context.locale.autoSyncEvery60Seconds,
                                    ),
                                    subtitle: const Text(
                                        "Enjoy automatic syncing of clipboard items every 60 seconds, keeping your devices up-to-date without manual intervention."),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SingleChildScrollView(
                            child: ListTile(
                              title: Text("With PRO ✨"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  height4,
                                  Text("Everything included in Free +"),
                                  height4,
                                  ListTile(
                                    leading: Icon(Icons.security_rounded),
                                    title:
                                        Text("Support End-to-End Encryption"),
                                    subtitle: Text(
                                      "E2EE will make everything encrypted for superior privacy.",
                                    ),
                                  ),
                                  height4,
                                  ListTile(
                                    leading: Icon(
                                        Icons.collections_bookmark_rounded),
                                    title: Text("Up to 50 Collections"),
                                    subtitle: Text(
                                      "Organize your clipboard items into up to 50 collections for ultimate management.",
                                    ),
                                  ),
                                  height4,
                                  ListTile(
                                    leading: Icon(
                                        Icons.collections_bookmark_rounded),
                                    title: Text("Syncing up to Last 720 Hours"),
                                    subtitle: Text(
                                      "Enjoy extended access to your clipboard "
                                      "history with syncing for the last 30 days.",
                                    ),
                                  ),
                                  height4,
                                  ListTile(
                                    leading: Icon(Icons.sync_rounded),
                                    title: Text("Real Time Synchronization"),
                                    subtitle: Text(
                                      "Experience lightning-fast syncing every 5 seconds.",
                                    ),
                                  ),
                                  height4,
                                  ListTile(
                                    leading: Icon(Icons.support_agent_rounded),
                                    title: Text("Faster and Priority Support"),
                                    subtitle: Text(
                                      "Get prompt and prioritized support as a PRO user.",
                                    ),
                                  ),
                                  height4,
                                  ListTile(
                                    leading: Icon(Icons.new_releases_rounded),
                                    title: Text("Early Access to New Features"),
                                    subtitle: Text(
                                      "Be the first to try out new features and updates.",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
