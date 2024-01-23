import 'package:book_culinary/domain/models/measure_unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'ingredients.g.dart';

@JsonSerializable(includeIfNull: true)
@HiveType(typeId: 3)
class Ingredients extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double caloriesForUnit;
  @HiveField(3)
  MeasureUnit measureUnit;

  Ingredients(
    this.id,
    this.name,
    this.caloriesForUnit,
    this.measureUnit,
  );

  factory Ingredients.fromJson(Map<String, dynamic> json) => _$IngredientsFromJson(json);
}
