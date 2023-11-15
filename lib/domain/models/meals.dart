import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'meals.g.dart';

@JsonSerializable(includeIfNull: true)
@HiveType(typeId: 1)
class Meals extends HiveObject {
  @HiveField(0)
  final String idMeal;
  @HiveField(1)
  final String strMeal;
  @HiveField(2)
  final String? strDrinkAlternate;
  @HiveField(3)
  final String strCategory;
  @HiveField(4)
  final String strArea;
  @HiveField(5)
  final String strInstructions;
  @HiveField(6)
  final String strMealThumb;

  Meals(
    this.idMeal,
    this.strMeal,
    this.strDrinkAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
  );

  factory Meals.fromJson(Map<String, dynamic> json) => _$MealsFromJson(json);
}
