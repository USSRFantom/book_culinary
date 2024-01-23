import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'measure_unit.g.dart';

@JsonSerializable(includeIfNull: true)
@HiveType(typeId: 4)
class MeasureUnit extends HiveObject {
  @HiveField(0)
  final int id;

  MeasureUnit(
    this.id,
  );

  factory MeasureUnit.fromJson(Map<String, dynamic> json) => _$MeasureUnitFromJson(json);
}
