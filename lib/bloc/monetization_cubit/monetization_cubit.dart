import 'package:bloc/bloc.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/db/subscription/subscription.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:universal_io/io.dart';

part 'monetization_cubit.freezed.dart';
part 'monetization_state.dart';

@singleton
class MonetizationCubit extends Cubit<MonetizationState> {
  bool _setupDone = false;
  MonetizationCubit() : super(const MonetizationState.unknown()) {
    Purchases.addCustomerInfoUpdateListener(onCustomerInfoUpdate);
  }

  @override
  Future<void> close() async {
    await super.close();
    Purchases.removeCustomerInfoUpdateListener(onCustomerInfoUpdate);
  }

  void onCustomerInfoUpdate(CustomerInfo info) {
    final proEntitlement = info.entitlements.active["pro features"];
    late Subscription subscription;
    if (proEntitlement != null) {
      final activeTill = DateTime.parse(proEntitlement.expirationDate!);
      subscription = Subscription.pro(
        info.originalAppUserId,
        activeTill,
      );
    } else {
      subscription = Subscription.free(info.originalAppUserId);
    }

    emit(MonetizationState.active(customer: info, subscription: subscription));
  }

  Future<void> login(String userId) async {
    await setupRevenuCat(userId);
    if (!_setupDone) return;
    await Purchases.logIn(userId);
    try {
      final result = await Purchases.getCustomerInfo();
      onCustomerInfoUpdate(result);
    } catch (e) {
      logger.e("Couldn't get customer info", error: e);
    }
  }

  Future<void> logout() async {
    emit(const MonetizationState.unknown());
  }

  Future<List<Package>?> fetchOfferings() async {
    try {
      final offerings = await Purchases.getOfferings();
      if (offerings.current != null) {
        // Display current offering with offerings.current
        return offerings.current?.availablePackages;
      }
    } on PlatformException catch (e) {
      // optional error handling
      logger.e(e);
      return [];
    }
    return null;
  }

  Future<void> setupRevenuCat(String userId) async {
    if (_setupDone) {
      return;
    }

    await Purchases.setLogLevel(LogLevel.debug);

    PurchasesConfiguration? configuration;
    if (Platform.isAndroid) {
      const androidPubKey =
          String.fromEnvironment("REVENUECAT_ANDROID_PUB_KEY");
      configuration = PurchasesConfiguration(androidPubKey)..appUserID = userId;
    } else if (Platform.isIOS || Platform.isMacOS) {
      const applePubKey = String.fromEnvironment("REVENUECAT_APPLE_PUB_KEY");
      configuration = PurchasesConfiguration(applePubKey)..appUserID = userId;
    }
    if (configuration != null) {
      await Purchases.configure(configuration);
      _setupDone = true;
    }
  }
}
