import 'package:bloc/bloc.dart';
import 'package:clipboard/common/logging.dart';
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
  MonetizationCubit() : super(const MonetizationState.unknown());

  Future<void> login(String userId) async {
    await setupRevenuCat(userId);
    if (!_setupDone) return;
    final result = await Purchases.logIn(userId);
    emit(MonetizationState.active(customer: result.customerInfo));
  }

  Future<void> logout() async {
    emit(const MonetizationState.unknown());
  }

  Future<Offering?> fetchOfferings() async {
    try {
      final offerings = await Purchases.getOfferings();
      if (offerings.current != null) {
        // Display current offering with offerings.current
        return offerings.current;
      }
    } on PlatformException catch (e) {
      // optional error handling
      logger.e(e);
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
