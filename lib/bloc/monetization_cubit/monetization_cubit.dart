import 'package:bloc/bloc.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/data/repositories/subscription.dart';
import 'package:clipboard/db/subscription/subscription.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:universal_io/io.dart';

part 'monetization_cubit.freezed.dart';
part 'monetization_state.dart';

@singleton
class MonetizationCubit extends Cubit<MonetizationState> {
  final SubscriptionRepository repo;
  bool _setupDone = false;

  MonetizationCubit(this.repo) : super(const MonetizationState.unknown()) {
    if (revenuCatSupportedPlatform) {
      Purchases.addCustomerInfoUpdateListener(onCustomerInfoUpdate);
    }
  }

  @override
  Future<void> close() async {
    await super.close();
    if (revenuCatSupportedPlatform) {
      Purchases.removeCustomerInfoUpdateListener(onCustomerInfoUpdate);
    }
  }

  void onCustomerInfoUpdate(CustomerInfo info) {
    final proEntitlement = info.entitlements.active["pro features"];
    late Subscription subscription;
    if (proEntitlement != null) {
      final activeTill = DateTime.parse(proEntitlement.expirationDate!);
      subscription = Subscription.pro(
        info.originalAppUserId,
        activeTill,
        proEntitlement.productIdentifier == "rc_promo_pro features_custom",
      );
    } else {
      subscription = Subscription.free(info.originalAppUserId);
    }

    emit(MonetizationState.active(customer: info, subscription: subscription));
  }

  Future<Failure?> applyPromoCode(String code) async {
    final result = await repo.applyPromoCoupon(code);
    return result.fold((l) => l, (r) {
      if (r == null) return;
      onCustomerInfoUpdate(r);
      return null;
    });
  }

  Future<void> login(String userId) async {
    if (revenuCatSupportedPlatform) {
      if (!_setupDone) {
        await setupRevenuCat(userId);
      }

      await Purchases.logIn(userId);
      try {
        final result = await Purchases.getCustomerInfo();
        onCustomerInfoUpdate(result);
      } catch (e) {
        logger.e("Couldn't get customer info", error: e);
      }
    } else {
      final result = await repo.get();
      result.fold((l) => logger.e(l), (r) {
        if (r == null) return;
        onCustomerInfoUpdate(r);
      });
    }
  }

  Future<void> logout() async {
    emit(const MonetizationState.unknown());
  }

  Future<void> setupRevenuCat(String userId) async {
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
