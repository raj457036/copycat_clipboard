part of 'notification_cubit.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.unknown() = UnknownNotificationState;
  const factory NotificationState.checkingPermission() =
      CheckingPermissionNotificationState;
  const factory NotificationState.granted() = GrantedNotificationState;
  const factory NotificationState.denied() = DeniedNotificationState;
}
