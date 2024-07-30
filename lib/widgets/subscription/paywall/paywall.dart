import 'package:clipboard/bloc/monetization_cubit/monetization_cubit.dart';
import 'package:clipboard/constants/strings/asset_constants.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late final MonetizationCubit monetizationCubit;

  Future<void> loadOffering() async {
    if (!iapCatSupportedPlatform) return;
    final offerings = await Purchases.getOfferings();
    setState(() {
      currentOffering = offerings.current;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    monetizationCubit = context.read<MonetizationCubit>();
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
      final customerInfo = await Purchases.purchasePackage(selectedPackage!);

      monetizationCubit.onCustomerInfoUpdate(customerInfo);

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
        return "$priceStr/${context.locale.year}"
            " ($currency ${(price / 12).toStringAsFixed(2)}"
            "/${context.locale.month})";
      case PackageType.monthly:
        return "$priceStr/${context.locale.month}";
      default:
        return "-";
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;

    if (!iapCatSupportedPlatform) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(context.locale.subscription), const CloseButton()],
        ),
        content: SizedBox(
          width: 350,
          child: Text(context.locale.subscribeInSupportedPlatform),
        ),
      );
    }

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
              context.locale.unlockPremiumFeatures,
              style: textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            height10,
            Text(
              context.locale.upgradeToPro,
              style: textTheme.bodyMedium,
              textAlign: TextAlign.center,
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
                subtitle: Text(
                  context.locale.tryAgain,
                  textAlign: TextAlign.center,
                ),
              )
            else
              height16,
            ...plans,
            height10,
            ElevatedButton(
              onPressed: !purchasing && selectedPackage != null
                  ? () => purchase()
                  : null,
              child: Text(context.locale.continue_),
            ),
            height10,
            TextButton(
              onPressed: purchasing ? null : context.pop,
              child: Text(context.locale.cancel),
            ),
          ],
        ),
      ),
    );
  }
}
