import 'package:clipboard/db/subscription/subscription.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

abstract class SubscriptionSource {
  Future<CustomerInfo?> get(String userId);

  Future<void> save(Subscription subscription);

  Future<CustomerInfo?> applyPromoCoupon(String code);
}
