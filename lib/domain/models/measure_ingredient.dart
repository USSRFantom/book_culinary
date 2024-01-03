import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'measure_ingredient.g.dart';

@JsonSerializable(includeIfNull: true)
@HiveType(typeId: 7)
class MeasureIngredient extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String one;
  @HiveField(2)
  final String few;
  @HiveField(3)
  final String many;



  MeasureIngredient(
      this.id,
      this.one,
      this.few,
      this.many,
      );

  factory MeasureIngredient.fromJson(Map<String, dynamic> json) => _$MeasureIngredientFromJson(json);
}
