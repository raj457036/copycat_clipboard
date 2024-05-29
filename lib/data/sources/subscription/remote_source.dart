import 'package:clipboard/common/logging.dart';
import 'package:clipboard/data/sources/subscription/subscription.dart';
import 'package:clipboard/db/subscription/subscription.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Named("remote")
@LazySingleton(as: SubscriptionSource)
class RemoteSubscriptionSource implements SubscriptionSource {
  final SupabaseClient client;
  final String table = "subscription";

  RemoteSubscriptionSource({required this.client});

  PostgrestClient get db => client.rest;
  @override
  Future<Subscription?> get(String userId) async {
    try {
      final response =
          await db.from(table).select().eq("userId", userId).single();
      return Subscription.fromJson(response);
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  @override
  Future<void> save(Subscription subscription) async {
    // NO-OP
  }
}
