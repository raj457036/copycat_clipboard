import 'package:copycat_base/utils/utility.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

final analyticNavigationObservers = [
  if (isAnalyticsSupported)
    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)
];