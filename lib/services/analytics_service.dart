import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics_service.g.dart';

@riverpod
FirebaseAnalytics analytics(Ref ref) {
  return FirebaseAnalytics.instance;
}

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> trackButtonClick({
    required String buttonVariant,
    required String colorVariant,
  }) async {
    await _analytics.logEvent(
      name: 'button_clicked',
      parameters: {
        'button_variant': buttonVariant,
        'color_variant': colorVariant,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  Future<void> trackEngagement({
    required String colorVariant,
    required int sessionDuration,
  }) async {
    await _analytics.logEvent(
      name: 'user_engagement',
      parameters: {
        'color_variant': colorVariant,
        'session_duration_ms': sessionDuration,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  Future<void> trackConversion({
    required String testVariant,
    required String conversionType,
  }) async {
    await _analytics.logEvent(
      name: 'conversion',
      parameters: {
        'test_variant': testVariant,
        'conversion_type': conversionType,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  Future<void> setUserProperty({
    required String name,
    required String value,
  }) async {
    await _analytics.setUserProperty(name: name, value: value);
  }
}

@riverpod
AnalyticsService analyticsService(Ref ref) {
  return AnalyticsService();
}
