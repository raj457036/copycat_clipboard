import 'package:copycat_base/domain/model/auth_user/auth_user.dart';
import 'package:copycat_base/domain/repositories/analytics.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AnalyticsRepository)
class AnalyticsRepositoryImpl implements AnalyticsRepository {
  final FirebaseAnalytics client;

  AnalyticsRepositoryImpl({required this.client});

  @override
  Future<void> logAnalyticsEvent({
    required String name,
    required Map<String, Object> parameters,
  }) async {
    if (!isAnalyticsSupported) return;
    await client.logEvent(
      name: name,
      parameters: parameters,
    );
  }

  @override
  Future<void> logFeatureUsed({
    required String feature,
    Map<String, dynamic>? parameters,
  }) async {
    if (!isAnalyticsSupported) return;
    await client.logEvent(name: "copycat_feature_used", parameters: {
      "feature": feature,
      ...?parameters,
    });
  }

  @override
  Future<void> logSignin({
    required String loginMethod,
    required Map<String, Object> parameters,
  }) async {
    if (!isAnalyticsSupported) return;
    client.logLogin(
      loginMethod: loginMethod,
      parameters: parameters,
    );
  }

  @override
  Future<void> logSignup({
    required String signUpMethod,
    required Map<String, Object> parameters,
  }) async {
    if (!isAnalyticsSupported) return;
    client.logSignUp(
      signUpMethod: signUpMethod,
      parameters: parameters,
    );
  }

  @override
  Future<void> setAnalyticUser(AuthUser user) async {
    if (!isAnalyticsSupported) return;

    await client.setUserId(id: user.userId);
    await client.setUserProperty(
      name: "name",
      value: user.displayName,
    );
    await client.setUserProperty(
      name: "email",
      value: user.email,
    );
    await client.logAppOpen();
  }
}
