import 'dart:async';

import 'package:clipboard/common/failure.dart';
import 'package:clipboard/data/sources/subscription/subscription.dart';
import 'package:clipboard/db/subscription/subscription.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:retry/retry.dart';
import 'package:universal_io/io.dart';

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
      final response = await retry(
        // Make a GET request
        () => function
            .invoke(
              "get_rc_customer",
              method: HttpMethod.get,
            )
            .timeout(const Duration(seconds: 30)),
        retryIf: (e) => e is SocketException || e is TimeoutException,
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
      final response = await retry(
        () => function
            .invoke(
              "apply_promo_coupon",
              body: {"code": code},
              method: HttpMethod.post,
            )
            .timeout(const Duration(seconds: 30)),
        retryIf: (e) => e is SocketException || e is TimeoutException,
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
