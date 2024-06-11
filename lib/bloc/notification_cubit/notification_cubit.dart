import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:clipboard/constants/strings/notification_constants.dart';
import 'package:clipboard/data/services/notification/controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_cubit.freezed.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final awn = AwesomeNotifications();
  NotificationCubit() : super(const NotificationState.unknown()) {
    awn.setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
  }

  Future<void> checkSetup() async {
    emit(const NotificationState.checkingPermission());
    final isAllowed = await awn.isNotificationAllowed();
    emit(
      isAllowed
          ? const NotificationState.granted()
          : const NotificationState.denied(),
    );

    checkForInitialNotification();
  }

  Future<void> checkForInitialNotification() async {
    ReceivedAction? receivedAction = await awn.getInitialNotificationAction(
      removeFromActionEvents: false,
    );

    // TODO: do something with this action
  }

  Future<void> createNotification({
    required String title,
    required String body,
  }) async {
    awn.createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: notificationChannelKey,
        actionType: ActionType.Default,
        title: title,
        body: body,
      ),
    );
  }
}
