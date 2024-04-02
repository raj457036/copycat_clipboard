import 'package:clipboard/db/converters/datetime.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'clip.freezed.dart';
part 'clip.g.dart';

@Freezed(
  addImplicitFinal: false,
)
class Clip with _$Clip {
  const Clip._();

  @Entity(realClass: Clip)
  factory Clip({
    /// common properties
    @Default(0) @Id() int localId,
    @Unique() String? id,
    @DateTimeConverter()
    @Property(type: PropertyType.date)
    required DateTime created,
    @DateTimeConverter()
    @Property(type: PropertyType.date)
    DateTime? lastSynced,

    // specific properties
    String? text,
  }) = _Clip;

  factory Clip.fromJson(Map<String, dynamic> json) => _$ClipFromJson(json);
}
