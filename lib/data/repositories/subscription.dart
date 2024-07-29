import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/data/sources/subscription.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SubscriptionRepository {
  FailureOr<CustomerInfo?> get();
  FailureOr<CustomerInfo?> applyPromoCoupon(String code);
}

@LazySingleton(as: SubscriptionRepository)
class SubscriptionRepositoryImpl extends SubscriptionRepository {
  final SupabaseClient client;
  final SubscriptionSource remote;

  SubscriptionRepositoryImpl({
    required this.client,
    @Named("remote") required this.remote,
  });

  GoTrueClient get auth => client.auth;

  @override
  FailureOr<CustomerInfo?> get() async {
    final userId = auth.currentSession!.user.id;
    try {
      final info = await remote.get(userId);
      return Right(info);
    } catch (e) {
      return const Right(null);
    }
  }

  @override
  FailureOr<CustomerInfo?> applyPromoCoupon(String code) async {
    try {
      final success = await remote.applyPromoCoupon(code);
      return Right(success);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
