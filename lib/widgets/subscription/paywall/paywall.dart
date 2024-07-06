import 'package:clipboard/constants/strings/asset_constants.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class CustomPaywallDialog extends StatefulWidget {
  const CustomPaywallDialog({super.key});

  @override
  State<CustomPaywallDialog> createState() => CustomPaywallStateDialog();

  Future<void> open(BuildContext context) async {
    return showDialog<void>(
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
  bool purchasing = false;
  Package? selectedPackage;
  String? errorMessage;

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
    if (purchasing) return;

    setState(() {
      purchasing = true;
      errorMessage = null;
    });
    try {
      CustomerInfo customerInfo =
          await Purchases.purchasePackage(selectedPackage!);

      if (mounted) {
        Navigator.pop(context);
        setState(() {
          purchasing = false;
          errorMessage = null;
        });
      }
    } on PlatformException catch (e) {
      setState(() {
        purchasing = false;
        errorMessage = e.message;
      });
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

    if (loading) {
      return const AlertDialog(content: loader);
    }

    final packages = currentOffering!.availablePackages;
    final plans = <Widget>[
      for (final package in packages) ...[
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: radius12,
            side: BorderSide(
              color: colors.outline,
            ),
          ),
          selected: package == selectedPackage,
          selectedTileColor: colors.primaryContainer,
          title: Text(
            package.packageType.name.title,
            style: textTheme.titleSmall?.copyWith(
              color: colors.onSurface,
            ),
          ),
          enabled: !purchasing,
          subtitle: Text(getPackagePricing(package)),
          leading: package == selectedPackage
              ? const Icon(Icons.check_circle)
              : const Icon(Icons.circle_outlined),
          onTap: () => selectPacakge(package),
          contentPadding: const EdgeInsets.only(
            left: padding12,
            right: padding12,
            bottom: padding8,
          ),
        ),
        height8
      ]
    ];

    return AlertDialog(
      content: ConstrainedBox(
        constraints: BoxConstraints.loose(const Size.fromWidth(350)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            if (errorMessage != null)
              ListTile(
                dense: true,
                title: Text(
                  errorMessage!,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colors.error,
                  ),
                  textAlign: TextAlign.center,
                ),
                subtitle: const Text(
                  "Please try again",
                  textAlign: TextAlign.center,
                ),
              )
            else
              height12,
            ...plans,
            height10,
            ElevatedButton(
              onPressed: !purchasing && selectedPackage != null
                  ? () => purchase()
                  : null,
              child: const Text('Continue'),
            ),
            height10,
            TextButton(
              onPressed: purchasing ? null : context.pop,
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
