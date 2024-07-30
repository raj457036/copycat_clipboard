import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/db/subscription/subscription.dart';
import 'package:copycat_base/domain/repositories/subscription.dart';
import 'package:copycat_base/domain/sources/subscription.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SubscriptionRepository)
class SubscriptionRepositoryImpl extends SubscriptionRepository {
  final SubscriptionSource remote;

  SubscriptionRepositoryImpl({
    @Named("remote") required this.remote,
  });

  @override
  FailureOr<Subscription?> get({required String userId}) async {
    try {
      final info = await remote.get(userId);
      return Right(info);
    } catch (e) {
      return const Right(null);
    }
  }

  @override
  FailureOr<Subscription?> applyPromoCoupon(String code) async {
    try {
      final success = await remote.applyPromoCoupon(code);
      return Right(success);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
