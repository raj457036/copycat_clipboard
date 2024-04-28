import 'package:clipboard/common/failure.dart';
import 'package:clipboard/constants/key.dart';
import 'package:clipboard/constants/numbers/breakpoints.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showSnackbar(
    SnackBar snackBar,
    {bool closePrevious = false}) {
  if (closePrevious) {
    scaffoldMessengerKey.currentState?.removeCurrentSnackBar();
  }
  return scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showFailureSnackbar(
    Failure failure) {
  final context = scaffoldMessengerKey.currentContext!;
  final mq = MediaQuery.of(context);
  final colors = context.colors;
  final isMobile = Breakpoints.isMobile(mq.size.width);
  return showSnackbar(
    SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: colors.errorContainer,
          ),
          width8,
          Expanded(
            child: Text(
              failure.message,
              maxLines: 10,
              overflow: TextOverflow.clip,
              style: TextStyle(
                color: colors.errorContainer,
              ),
            ),
          )
        ],
      ),
      closeIconColor: colors.errorContainer,
      behavior: isMobile ? SnackBarBehavior.fixed : SnackBarBehavior.floating,
      width: isMobile ? null : 480,
      showCloseIcon: !isMobile,
      backgroundColor: colors.error,
    ),
    closePrevious: true,
  );
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showTextSnackbar(
  String text, {
  bool isLoading = false,
  bool success = false,
  bool closePrevious = false,
  int? duration,
  SnackBarAction? action,
}) {
  final context = scaffoldMessengerKey.currentContext!;
  final mq = MediaQuery.of(context);
  final isMobile = Breakpoints.isMobile(mq.size.width);

  return showSnackbar(
    SnackBar(
      content: isLoading
          ? Row(
              children: [
                const SizedBox.square(
                  dimension: 22,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                width8,
                Text(text)
              ],
            )
          : Text(text),
      showCloseIcon: !isMobile && !isLoading,
      behavior: isMobile ? SnackBarBehavior.fixed : SnackBarBehavior.floating,
      width: isMobile ? null : 480,
      duration: duration != null
          ? Duration(seconds: duration)
          : isLoading
              ? const Duration(seconds: 30)
              : const Duration(seconds: 2),
      action: action,
    ),
    closePrevious: closePrevious,
  );
}

showToastMessage(BuildContext context, String message) {
  toastification.show(
    context: context,
    title: Text(message),
    autoCloseDuration: const Duration(seconds: 3),
    style: ToastificationStyle.simple,
    alignment: Alignment.bottomCenter,
  );
}
