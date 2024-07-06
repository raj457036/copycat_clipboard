import 'package:clipboard/data/sources/subscription/subscription.dart';
import 'package:clipboard/db/subscription/subscription.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

@Named("local")
@LazySingleton(as: SubscriptionSource)
class LocalSubscriptionSource implements SubscriptionSource {
  final Isar db;

  LocalSubscriptionSource({required this.db});

  @override
  Future<CustomerInfo?> get(String userId) async {
    throw UnimplementedError();
  }

  @override
  Future<void> save(Subscription subscription) async {
    if (subscription.serverId == null) return;
    final sub = await db.txn(
      () => db.subscriptions
          .filter()
          .serverIdEqualTo(subscription.serverId)
          .findFirst(),
    );

    if (sub != null) subscription.applyId(sub);
    await db.writeTxn(() => db.subscriptions.put(subscription));
  }

  @override
  Future<CustomerInfo> applyPromoCoupon(String code) {
    throw UnimplementedError();
  }
}
