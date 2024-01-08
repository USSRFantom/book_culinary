import 'package:book_culinary/domain/models/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'recipe_step.g.dart';

@JsonSerializable(includeIfNull: true)
@HiveType(typeId: 8)
class RecipeStep extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int number;
  @HiveField(2)
  Recipe recipe;
  @HiveField(3)
  Recipe step;

  RecipeStep(
      this.id,
      this.number,
      this.recipe,
      this.step,
      );


  factory RecipeStep.fromJson(Map<String, dynamic> json) => _$RecipeStepFromJson(json);
}
