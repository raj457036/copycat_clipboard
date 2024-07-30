part of 'monetization_cubit.dart';

@freezed
class MonetizationState with _$MonetizationState {
  const factory MonetizationState.unknown() = MonetizationUnknown;
  const factory MonetizationState.active({
    required Subscription subscription,
  }) = MonetizationActive;
}
