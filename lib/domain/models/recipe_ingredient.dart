import 'package:book_culinary/domain/models/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'recipe_ingredient.g.dart';

@JsonSerializable(includeIfNull: true)
@HiveType(typeId: 5)
class RecipeIngredients extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int count;
  @HiveField(2)
  Ingredient ingredient;
  @HiveField(3)
  Ingredient recipe;

  RecipeIngredients(
    this.id,
    this.count,
    this.ingredient,
    this.recipe,
  );

  factory RecipeIngredients.fromJson(Map<String, dynamic> json) => _$RecipeIngredientsFromJson(json);
}
