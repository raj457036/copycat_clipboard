import 'package:bloc/bloc.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/common/logging.dart';
import 'package:copycat_base/db/subscription/subscription.dart';
import 'package:copycat_base/domain/repositories/analytics.dart';
import 'package:copycat_base/domain/repositories/subscription.dart';
import 'package:copycat_pro/data/services/monitization_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'monetization_cubit.freezed.dart';
part 'monetization_state.dart';

@singleton
class MonetizationCubit extends Cubit<MonetizationState>
    with MonetizationService {
  final AnalyticsRepository analyticsRepo;
  final SubscriptionRepository repo;

  MonetizationCubit({
    required this.repo,
    required this.analyticsRepo,
  }) : super(const MonetizationState.unknown()) {
    onSubscriptionAvailable = onSubscriptionChange;
    setupListeners();
  }

  @override
  Future<void> close() async {
    await super.close();
    stopListeners();
  }

  void onSubscriptionChange(Subscription subscription) {
    emit(MonetizationState.active(subscription: subscription));
  }

  Future<Failure?> applyPromoCode(String code) async {
    final result = await repo.applyPromoCoupon(code);
    return result.fold((l) => l, (subscription) {
      if (subscription == null) return;
      onSubscriptionChange(subscription);
      analyticsRepo.logAnalyticsEvent(
        name: "Apply Promo Code",
        parameters: {
          "promo_code": code,
        },
      );
      return null;
    });
  }

  Future<void> login(String userId) async {
    final done = await setUser(userId);
    if (!done) {
      final result = await repo.get(userId: userId);
      result.fold((l) => logger.e(l), (subscription) {
        if (subscription == null) return;
        onSubscriptionChange(subscription);
      });
    }
  }

  Future<void> logout() async {
    emit(const MonetizationState.unknown());
  }
}
