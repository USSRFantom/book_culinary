import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'recipe.g.dart';

@JsonSerializable(includeIfNull: true)
@HiveType(typeId: 9)
class Recipe extends HiveObject {
  @HiveField(0)
  final int id;

  Recipe(
    this.id,
  );

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
