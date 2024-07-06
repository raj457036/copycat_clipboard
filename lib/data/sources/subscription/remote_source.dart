import 'package:clipboard/common/failure.dart';
import 'package:clipboard/data/sources/subscription/subscription.dart';
import 'package:clipboard/db/subscription/subscription.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Named("remote")
@LazySingleton(as: SubscriptionSource)
class RemoteSubscriptionSource implements SubscriptionSource {
  final SupabaseClient client;
  final String table = "subscription";

  RemoteSubscriptionSource({required this.client});

  PostgrestClient get db => client.rest;
  FunctionsClient get function => client.functions;

  @override
  Future<CustomerInfo?> get(String userId) async {
    try {
      final response = await function.invoke(
        "get_rc_customer",
        method: HttpMethod.get,
      );

      return CustomerInfo.fromJson(response.data["customer"]);
    } on FunctionException catch (e) {
      throw Failure(
        message: e.details["error"] ?? "Invalid Customer",
        code: "rc-customer-fetch-failed",
      );
    }
  }

  @override
  Future<void> save(Subscription subscription) async {
    // NO-OP
  }

  @override
  Future<CustomerInfo> applyPromoCoupon(String code) async {
    try {
      final response = await function.invoke(
        "apply_promo_coupon",
        body: {"code": code},
        method: HttpMethod.post,
      );

      return CustomerInfo.fromJson(
        Map<String, dynamic>.from(response.data["customer"]),
      );
    } on FunctionException catch (e) {
      throw Failure(
        message: e.details["error"] ?? "Invalid Code",
        code: "promo-failed",
      );
    }
  }
}
