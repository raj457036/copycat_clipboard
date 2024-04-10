import 'package:clipboard/common/failure.dart';
import 'package:clipboard/constants/key.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showFailureSnackbar(
  Failure failure,
) {
  return scaffoldMessengerKey.currentContext?.showFailureSnackbar(failure);
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showTextSnackbar(
  String text, {
  bool isLoading = false,
}) {
  return scaffoldMessengerKey.currentContext?.showTextSnackbar(
    text,
    isLoading: isLoading,
  );
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showSnackbar(
  SnackBar snackBar,
) {
  return scaffoldMessengerKey.currentContext?.showSnackbar(snackBar);
}
