import 'package:clipboard/routes/routes.dart';
import 'package:clipboard/utils/utility.dart';

Future<void> logFeatureUsed({
  required String feature,
  Map<String, dynamic>? parameters,
}) async {
  if (!isAnalyticsSupported) return;
  await analytics.logEvent(name: "copycat_feature_used", parameters: {
    "feature": feature,
    ...?parameters,
  });
}
