import 'package:clipboard/common/failure.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:timeago/timeago.dart' as timeago;

extension MaterialStateExtension<T> on T {
  /// Convert into material state property
  MaterialStateProperty<T> get msp => MaterialStateProperty.all(this);
}

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  bool get isDarkMode => theme.brightness == Brightness.dark;
  ResponsiveBreakpointsData get breakpoints => ResponsiveBreakpoints.of(this);
}

extension SnackbarExtension on BuildContext {
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbar(
      SnackBar snackBar) {
    scaffoldMessenger.hideCurrentSnackBar();
    return scaffoldMessenger.showSnackBar(snackBar);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showFailureSnackbar(
      Failure failure) {
    final isMobile = breakpoints.isMobile;
    return showSnackbar(
      SnackBar(
        content: Text(failure.message),
        behavior: isMobile ? SnackBarBehavior.fixed : SnackBarBehavior.floating,
        width: isMobile ? null : 400,
        showCloseIcon: !isMobile,
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showTextSnackbar(
      String text,
      {bool isLoading = false}) {
    final isMobile = breakpoints.isMobile;
    return showSnackbar(
      SnackBar(
        content: isLoading
            ? Row(
                children: [
                  const SizedBox.square(
                    dimension: 22,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  width16,
                  Text(text)
                ],
              )
            : Text(text),
        showCloseIcon: !isMobile && !isLoading,
        behavior: isMobile ? SnackBarBehavior.fixed : SnackBarBehavior.floating,
        width: isMobile ? null : 400,
      ),
    );
  }
}

extension EnumParserExtension<T extends Enum> on List<T> {
  T? parse(String? value, [T? default_]) {
    try {
      return firstWhere((e) => e.name == value);
    } on StateError {
      return default_;
    }
  }
}

extension ListExtension<T> on List<T> {
  List<T> replace(int index, T value) {
    if (index == -1) return this;
    return [...take(index), value, ...skip(index + 1)];
  }

  List<T> replaceWhere(bool Function(T value) predicate, T value) {
    final index = indexWhere(predicate);
    return replace(index, value);
  }

  T getRandom() {
    final index = getRandomIndex(length);
    return this[index];
  }

  T? findFirst(bool Function(T value) predicate) {
    try {
      return firstWhere(predicate);
    } on StateError {
      return null;
    }
  }

  /// removes the item can create a new list
  List<T> removeWhereNL(bool Function(T value) predicate) {
    final index = indexWhere(predicate);
    if (index == -1) return this;
    return [...take(index), ...skip(index + 1)];
  }
}

extension DateTimeExtension on DateTime {
  bool isBetween(DateTime? start, DateTime? end) {
    bool startCrossed = true;
    bool endCrossed = true;

    if (start != null) {
      startCrossed = start.isBefore(this);
    }
    if (end != null) {
      endCrossed = end.isAfter(this);
    }

    return startCrossed && endCrossed;
  }

  bool isSameDate(DateTime? other, {bool trueIfNull = false}) {
    if (other == null) return trueIfNull;
    return other.year == year && other.month == month && other.day == day;
  }

  String ago([String? locale]) => timeago.format(this, locale: locale);
}
