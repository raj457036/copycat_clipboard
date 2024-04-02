import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime?, int?> {
  const DateTimeConverter();

  @override
  DateTime? fromJson(int? value) {
    if (value == null) return null;

    return DateTime.fromMillisecondsSinceEpoch(value);
  }

  @override
  int? toJson(DateTime? value) {
    if (value == null) return null;

    return value.millisecondsSinceEpoch;
  }
}
