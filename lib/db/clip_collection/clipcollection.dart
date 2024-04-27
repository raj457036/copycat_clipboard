import 'package:clipboard/db/base.dart';
import 'package:clipboard/db/json_converters/datetime_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'clipcollection.freezed.dart';
part 'clipcollection.g.dart';

@freezed
@Collection(ignore: {"copyWith"})
class ClipCollection with _$ClipCollection, IsarIdMixin {
  ClipCollection._();

  factory ClipCollection({
    @JsonKey(name: "id", includeToJson: false) String? serverId,
    @JsonKey(name: "created") @DateTimeConverter() required DateTime created,
    @JsonKey(name: "modified") @DateTimeConverter() required DateTime modified,
    required String title,
    String? description,
    required String emoji,
  }) = _ClipCollection;

  factory ClipCollection.fromJson(Map<String, dynamic> json) =>
      _$ClipCollectionFromJson(json);

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get titleWords => Isar.splitWords((title));

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get descriptionWords => Isar.splitWords((description ?? ''));
}
