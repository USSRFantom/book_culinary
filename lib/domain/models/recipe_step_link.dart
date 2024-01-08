import 'package:book_culinary/domain/models/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'recipe_step_link.g.dart';

@JsonSerializable(includeIfNull: true)
@HiveType(typeId: 8)
class RecipeStepLink extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int number;
  @HiveField(2)
  Recipe recipe;
  @HiveField(3)
  Recipe step;

  RecipeStepLink(
      this.id,
      this.number,
      this.recipe,
      this.step,
      );


  factory RecipeStepLink.fromJson(Map<String, dynamic> json) => _$RecipeStepLinkFromJson(json);
}
