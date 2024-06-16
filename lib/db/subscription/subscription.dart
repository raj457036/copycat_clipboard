import 'package:clipboard/constants/numbers/duration.dart';
import 'package:clipboard/db/base.dart';
import 'package:clipboard/db/json_converters/datetime_converters.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'subscription.freezed.dart';
part 'subscription.g.dart';

@Collection(ignore: {"copyWith"})
@freezed
class Subscription with _$Subscription, IsarIdMixin {
  Subscription._();

  factory Subscription({
    @JsonKey(name: "id", includeToJson: false) int? serverId,
    @JsonKey(name: "created") @DateTimeConverter() required DateTime created,
    @JsonKey(name: "modified") @DateTimeConverter() required DateTime modified,
    required String userId,
    required String planName,
    required String subId,
    required String source,
    @DateTimeConverter() DateTime? trialStart,
    @DateTimeConverter() DateTime? trialEnd,
    @Default(3) int collections,
    @JsonKey(name: "syncHr") @Default(24) int syncHours,
    @Default(true) bool ads,
    @JsonKey(name: "syncInt") @Default($60S) int syncInterval,
    @Default(false) bool edit,
    @Default(false) bool encrypt,
    String? encryptKey,
    @DateTimeConverter() DateTime? activeTill,
    @JsonKey(name: "devices") @Default(3) int maxSyncDevices,
  }) = _Subscription;

  static Subscription free(String userId) {
    return Subscription(
      created: now(),
      modified: now(),
      userId: userId,
      planName: "FREE",
      subId: "",
      source: "",
    );
  }

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}
