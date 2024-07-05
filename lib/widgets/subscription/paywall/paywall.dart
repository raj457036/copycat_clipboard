import 'package:clipboard/constants/strings/asset_constants.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class CustomPaywallDialog extends StatefulWidget {
  const CustomPaywallDialog({super.key});

  @override
  State<CustomPaywallDialog> createState() => CustomPaywallStateDialog();

  Future<void> open(BuildContext context) async {
    return showCupertinoDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return this;
      },
    );
  }
}

class CustomPaywallStateDialog extends State<CustomPaywallDialog> {
  Offering? currentOffering;
  bool loading = true;
  Package? selectedPackage;

  Future<void> loadOffering() async {
    final offerings = await Purchases.getOfferings();
    setState(() {
      currentOffering = offerings.current;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadOffering();
  }

  void selectPacakge(Package selected) {
    setState(() {
      selectedPackage = selected;
    });
  }

  Future<void> purchase() async {
    if (selectedPackage == null) return;
    try {
      CustomerInfo customerInfo =
          await Purchases.purchasePackage(selectedPackage!);

      if (mounted) {
        Navigator.pop(context);
      }
    } on PlatformException catch (e) {
      if (mounted) Navigator.pop(context);
      if (e.message != null) showTextSnackbar(e.message!);
    }
  }

  String getPackagePricing(Package package) {
    final currency = package.storeProduct.priceString[0];
    final price = package.storeProduct.price;
    final priceStr = package.storeProduct.priceString;
    switch (package.packageType) {
      case PackageType.annual:
        return "$priceStr/year ($currency ${(price / 12).toStringAsFixed(2)}/month)";
      case PackageType.monthly:
        return "$priceStr/month";
      default:
        return "-";
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    const loader = Center(
      child: CircularProgressIndicator(),
    );
    return CupertinoAlertDialog(
      content: loading
          ? loader
          : Column(
              children: [
                Image.asset(
                  AssetConstants.copyCatIcon,
                  width: 100,
                ),
                height16,
                Text(
                  "Unlock Premium Features",
                  style: textTheme.titleLarge,
                ),
                height16,
                Text(
                  "Upgrade to CopyCat Pro today!",
                  style: textTheme.bodyMedium,
                ),
                height16,
                for (final package in currentOffering!.availablePackages)
                  CupertinoListTile(
                    backgroundColor: package == selectedPackage
                        ? colors.primaryContainer
                        : colors.surface,
                    title: Text(
                      package.packageType.name.title,
                      style: textTheme.titleSmall?.copyWith(
                        color: colors.onSurface,
                      ),
                    ),
                    subtitle: Text(getPackagePricing(package)),
                    leadingSize: 16,
                    padding: const EdgeInsets.only(
                      left: padding12,
                      right: padding12,
                      top: padding8,
                      bottom: padding12,
                    ),
                    leading: package == selectedPackage
                        ? const Icon(Icons.check_circle)
                        : const Icon(Icons.circle_outlined),
                    onTap: () => selectPacakge(package),
                  ),
                height20,
                CupertinoButton.filled(
                  disabledColor: colors.primaryContainer,
                  onPressed: selectedPackage != null ? () => purchase() : null,
                  child: const Text('Continue'),
                ),
                CupertinoButton(
                  onPressed:
                      selectedPackage != null ? () => context.pop() : null,
                  child: const Text('Cancel'),
                ),
              ],
            ),
    );
  }
}
