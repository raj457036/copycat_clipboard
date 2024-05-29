import 'package:clipboard/common/failure.dart';
import 'package:clipboard/data/sources/subscription/subscription.dart';
import 'package:clipboard/db/subscription/subscription.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SubscriptionRepository {
  FailureOr<Subscription?> get();
}

@LazySingleton(as: SubscriptionRepository)
class SubscriptionRepositoryImpl extends SubscriptionRepository {
  final SupabaseClient client;
  final SubscriptionSource local;
  final SubscriptionSource remote;

  SubscriptionRepositoryImpl({
    required this.client,
    @Named("local") required this.local,
    @Named("remote") required this.remote,
  });

  GoTrueClient get auth => client.auth;

  @override
  FailureOr<Subscription?> get() async {
    final userId = auth.currentSession!.user.id;
    try {
      final sub = await remote.get(userId);
      if (sub != null) {
        local.save(sub);
        return Right(sub);
      }
      final freeSub = Subscription.free(userId);
      return Right(freeSub);
    } catch (e) {
      final sub = await local.get(userId);
      if (sub == null) {
        return Left(Failure.fromException(e));
      }
      return Right(sub);
    }
  }
}
