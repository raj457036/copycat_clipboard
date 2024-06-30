import 'package:clipboard/constants/numbers/breakpoints.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/datetime_extension.dart';
import 'package:clipboard/widgets/subscription/apply_coupon.dart';
import 'package:clipboard/widgets/subscription/subscription_provider.dart';
import 'package:flutter/material.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

class SubscriptionInfoDialog extends StatelessWidget {
  const SubscriptionInfoDialog({super.key});

  Future<void> open(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => this,
    );
  }

  Future<void> upgrade(BuildContext context) async {
    const ApplyCouponDialog().open(context);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = Breakpoints.isMobile(constraints.maxWidth);
      return SubscriptionBuilder(
          autoDowngrade: false,
          builder: (context, state) {
            final expired = !state.isActive;
            final isTrial = state.isTrial;
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
                  : const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 24.0),
              contentPadding: isMobile ? EdgeInsets.zero : null,
              content: SizedBox(
                width: 600,
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
                    ListTile(
                      title: Text(context.locale.currentPlan),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (expired)
                            Text(context.locale.expiredPlan(state.planName))
                          else
                            Text(state.planName),
                          height2,
                          if (isTrial && state.trialEnd != null)
                            Text(
                              context.locale.trialTill(
                                dateTimeFormatter(context.locale.localeName)
                                    .format(state.trialEnd!),
                              ),
                            ),
                        ],
                      ),
                      trailing: expired || state.isFree
                          ? ElevatedButton.icon(
                              onPressed: () => upgrade(context),
                              icon: const Icon(Icons.workspace_premium_rounded),
                              label: Text(context.locale.upgrade),
                            )
                          : ElevatedButton(
                              child: const Text("Purchase"),
                              onPressed: () async {
                                await RevenueCatUI.presentPaywallIfNeeded(
                                    "requiredEntitlementId");
                              },
                            ),
                    ),
                    Expanded(
                      child: DefaultTabController(
                        length: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const TabBar(tabs: [
                              Tab(text: "Free"),
                              Tab(text: "Pro ✨"),
                            ]),
                            Expanded(
                              child: TabBarView(children: [
                                SingleChildScrollView(
                                  child: ListTile(
                                    title: Text(context.locale.included),
                                    subtitle: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        height4,
                                        ListTile(
                                          leading:
                                              const Icon(Icons.paste_rounded),
                                          title: Text(
                                            context
                                                .locale.unlimitedClipboardItems,
                                          ),
                                          subtitle: Text(context.locale
                                              .unlimitedClipboardItemsDesc),
                                        ),
                                        height4,
                                        ListTile(
                                          leading: const Icon(Icons.devices),
                                          title: Text(
                                            context.locale
                                                .supportAllMajorPlatforms,
                                          ),
                                          subtitle: Text(context.locale
                                              .supportAllMajorPlatformsDesc),
                                        ),
                                        height4,
                                        ListTile(
                                          leading: const Icon(Icons
                                              .fiber_smart_record_outlined),
                                          title: Text(context.locale
                                              .supportsAppleUniversalClipboard),
                                          subtitle: Text(context.locale
                                              .supportsAppleUniversalClipboardDesc),
                                        ),
                                        height4,
                                        ListTile(
                                          leading:
                                              const Icon(Icons.storage_rounded),
                                          title: Text(
                                              context.locale.onDeviceStorage),
                                          subtitle: Text(context
                                              .locale.onDeviceStorageDesc),
                                        ),
                                        height4,
                                        ListTile(
                                          leading: const Icon(
                                              Icons.add_to_drive_rounded),
                                          title: Text(context
                                              .locale.googleDriveIntegration),
                                          subtitle: Text(context.locale
                                              .googleDriveIntegrationDesc),
                                        ),
                                        height4,
                                        ListTile(
                                          leading: const Icon(
                                              Icons.manage_search_rounded),
                                          title: Text(
                                              context.locale.instantSearch),
                                          subtitle: Text(
                                              context.locale.instantSearchDesc),
                                        ),
                                        height4,
                                        ListTile(
                                          leading: const Icon(
                                              Icons.cloud_sync_rounded),
                                          title: Text(context
                                              .locale.syncingUpToLast24Hours),
                                          subtitle: Text(context.locale
                                              .syncingUpToLast24HoursDesc),
                                        ),
                                        height4,
                                        ListTile(
                                          leading: const Icon(Icons
                                              .collections_bookmark_rounded),
                                          title: Text(
                                              context.locale.upTo3Collections),
                                          subtitle: Text(context
                                              .locale.upTo3CollectionsDesc),
                                        ),
                                        height4,
                                        ListTile(
                                          leading: const Icon(
                                              Icons.sync_alt_rounded),
                                          title: Text(
                                            context
                                                .locale.autoSyncEvery60Seconds,
                                          ),
                                          subtitle: Text(context.locale
                                              .autoSyncEvery60SecondsDesc),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: ListTile(
                                    title: Text(context.locale.withPro),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        height4,
                                        Text(context.locale.withProDesc),
                                        height4,
                                        ListTile(
                                          leading: const Icon(
                                              Icons.security_rounded),
                                          title:
                                              Text(context.locale.supportE2EE),
                                          subtitle: Text(
                                            context.locale.supportE2EEDesc,
                                          ),
                                        ),
                                        height4,
                                        ListTile(
                                          leading: const Icon(Icons
                                              .collections_bookmark_rounded),
                                          title: Text(
                                              context.locale.upto50Collection),
                                          subtitle: Text(
                                            context.locale.upto50CollectionDesc,
                                          ),
                                        ),
                                        height4,
                                        ListTile(
                                          leading: const Icon(Icons
                                              .collections_bookmark_rounded),
                                          title: Text(
                                              context.locale.syncLast720Hr),
                                          subtitle: Text(
                                            context.locale.syncLast720HrDesc,
                                          ),
                                        ),
                                        height4,
                                        ListTile(
                                          leading:
                                              const Icon(Icons.sync_rounded),
                                          title:
                                              Text(context.locale.realtimeSync),
                                          subtitle: Text(
                                            context.locale.realtimeSyncDesc,
                                          ),
                                        ),
                                        height4,
                                        ListTile(
                                          leading: const Icon(
                                              Icons.support_agent_rounded),
                                          title: Text(
                                              context.locale.prioritySupport),
                                          subtitle: Text(
                                            context.locale.prioritySupportDesc,
                                          ),
                                        ),
                                        height4,
                                        ListTile(
                                          leading: const Icon(
                                              Icons.new_releases_rounded),
                                          title: Text(context
                                              .locale.earlyAccessToNewFeature),
                                          subtitle: Text(
                                            context.locale
                                                .earlyAccessToNewFeatureDesc,
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
    });
  }
}
