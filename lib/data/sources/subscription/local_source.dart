import 'package:clipboard/data/sources/subscription/subscription.dart';
import 'package:clipboard/db/subscription/subscription.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@Named("local")
@LazySingleton(as: SubscriptionSource)
class LocalSubscriptionSource implements SubscriptionSource {
  final Isar db;

  LocalSubscriptionSource({required this.db});

  @override
  Future<Subscription?> get(String userId) async {
    final sub = await db.txn(
      () => db.subscriptions
          .filter()
          .userIdEqualTo(userId)
          .sortByModifiedDesc()
          .findFirst(),
    );

    return sub;
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
  Future<Subscription> applyPromoCoupon(String code) {
    throw UnimplementedError();
  }
}
