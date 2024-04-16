import 'package:clipboard/common/failure.dart';
import 'package:clipboard/constants/key.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showFailureSnackbar(
  Failure failure,
) {
  final context = appKey.currentContext;
  if (context == null) {
    return null;
  }
  return appKey.currentContext?.showFailureSnackbar(failure);
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showTextSnackbar(
  String text, {
  bool isLoading = false,
}) {
  return appKey.currentContext?.showTextSnackbar(
    text,
    isLoading: isLoading,
  );
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showSnackbar(
  SnackBar snackBar,
) {
  return appKey.currentContext?.showSnackbar(snackBar);
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
