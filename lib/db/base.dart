import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

mixin IsarIdMixin {
  @JsonKey(includeToJson: false, includeFromJson: false)
  Id id = Isar.autoIncrement;
}
