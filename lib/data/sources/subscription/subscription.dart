import 'package:clipboard/db/subscription/subscription.dart';

abstract class SubscriptionSource {
  Future<Subscription?> get(String userId);

  Future<void> save(Subscription subscription);

  Future<Subscription> applyPromoCoupon(String code);
}
