import 'package:intl/intl.dart';

extension DateStartAndEndExtension on DateTime {
  /// Get the start of the day
  DateTime get dayStart {
    return DateTime(year, month, day, 0, 0, 0);
  }

  /// Get the end of the day at 23:59:59 PM
  DateTime get dayEnd {
    return DateTime(year, month, day, 23, 59, 59);
  }
}

final dateFormatter = DateFormat("d MMM yy");
final dateTimeFormatter = DateFormat.yMMMd().add_jm();
