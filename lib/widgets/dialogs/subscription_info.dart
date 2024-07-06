import 'package:clipboard/constants/numbers/breakpoints.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/datetime_extension.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/subscription/apply_coupon.dart';
import 'package:clipboard/widgets/subscription/paywall/paywall.dart';
import 'package:clipboard/widgets/subscription/subscription_provider.dart';
import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SubscriptionInfoDialog extends StatelessWidget {
  final bool entitlementGrantMode;
  const SubscriptionInfoDialog({
    super.key,
    this.entitlementGrantMode = false,
  });

  Future<void> open(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => this,
    );
  }

  Future<void> upgradeByPromoCode(BuildContext context) async {
    if (entitlementGrantMode) {
      const ApplyCouponDialog().open(context);
    }
  }

  Future<void> upgrade(BuildContext context) async {
    if (isMobilePlatform) {
      await RevenueCatUI.presentPaywall(
        displayCloseButton: true,
      );
      return;
    }
    if (Platform.isMacOS) {
      const CustomPaywallDialog().open(context);
    }
  }

  Future<void> manageSubscription() async {
    final customer = await Purchases.getCustomerInfo();
    if (customer.managementURL != null) {
      launchUrlString(customer.managementURL!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = Breakpoints.isMobile(constraints.maxWidth);
        final freePlanIncludes = [
          (
            null,
            context.locale.included,
            null,
          ),
          (
            const Icon(Icons.paste_rounded),
            context.locale.unlimitedClipboardItems,
            context.locale.unlimitedClipboardItemsDesc,
          ),
          (
            const Icon(Icons.devices),
            context.locale.supportAllMajorPlatforms,
            context.locale.supportAllMajorPlatformsDesc,
          ),
          (
            const Icon(Icons.fiber_smart_record_outlined),
            context.locale.supportsAppleUniversalClipboard,
            context.locale.supportsAppleUniversalClipboardDesc,
          ),
          (
            const Icon(Icons.storage_rounded),
            context.locale.onDeviceStorage,
            context.locale.onDeviceStorageDesc,
          ),
          (
            const Icon(Icons.add_to_drive_rounded),
            context.locale.googleDriveIntegration,
            context.locale.googleDriveIntegrationDesc,
          ),
          (
            const Icon(Icons.manage_search_rounded),
            context.locale.instantSearch,
            context.locale.instantSearchDesc,
          ),
          (
            const Icon(Icons.cloud_sync_rounded),
            context.locale.syncingUpToLast24Hours,
            context.locale.syncingUpToLast24HoursDesc,
          ),
          (
            const Icon(Icons.collections_bookmark_rounded),
            context.locale.upTo3Collections,
            context.locale.upTo3CollectionsDesc,
          ),
          (
            const Icon(Icons.sync_alt_rounded),
            context.locale.autoSyncEvery60Seconds,
            context.locale.autoSyncEvery60SecondsDesc,
          )
        ];

        final proPlanIncludes = [
          (
            null,
            context.locale.withPro,
            context.locale.withProDesc,
          ),
          (
            const Icon(Icons.security_rounded),
            context.locale.supportE2EE,
            context.locale.supportE2EEDesc,
          ),
          (
            const Icon(Icons.collections_bookmark_rounded),
            context.locale.upto50Collection,
            context.locale.upto50CollectionDesc,
          ),
          (
            const Icon(Icons.collections_bookmark_rounded),
            context.locale.syncLast720Hr,
            context.locale.syncLast720HrDesc,
          ),
          (
            const Icon(Icons.sync_rounded),
            context.locale.realtimeSync,
            context.locale.realtimeSyncDesc,
          ),
          (
            const Icon(Icons.support_agent_rounded),
            context.locale.prioritySupport,
            context.locale.prioritySupportDesc,
          ),
          (
            const Icon(Icons.new_releases_rounded),
            context.locale.earlyAccessToNewFeature,
            context.locale.earlyAccessToNewFeatureDesc,
          ),
        ];
        return SubscriptionBuilder(
          autoDowngrade: false,
          builder: (context, state) {
            if (state == null) {
              return AlertDialog(
                title: Text(context.locale.subscription),
                content: Text(context.locale.nothingHere),
              );
            }

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
                              onLongPress: () => upgradeByPromoCode(context),
                              icon: const Icon(Icons.workspace_premium_rounded),
                              label: Text(context.locale.upgrade),
                            )
                          : ElevatedButton(
                              onPressed: manageSubscription,
                              child: const Text("Manage Subscription"),
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
                                ListView.builder(
                                  itemCount: freePlanIncludes.length,
                                  itemBuilder: (context, index) {
                                    final (icon, title, subtitle) =
                                        freePlanIncludes[index];
                                    return ListTile(
                                      leading: icon,
                                      title: Text(title),
                                      subtitle: subtitle != null
                                          ? Text(subtitle)
                                          : null,
                                    );
                                  },
                                ),
                                ListView.builder(
                                  itemCount: proPlanIncludes.length,
                                  itemBuilder: (context, index) {
                                    final (icon, title, subtitle) =
                                        proPlanIncludes[index];
                                    return ListTile(
                                      leading: icon,
                                      title: Text(title),
                                      subtitle: Text(subtitle),
                                    );
                                  },
                                ),
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
          },
        );
      },
    );
  }
}
