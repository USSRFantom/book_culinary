import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'ingredient.g.dart';

@JsonSerializable(includeIfNull: true)
@HiveType(typeId: 6)
class Ingredient extends HiveObject {
  @HiveField(0)
  final int id;
  Ingredient(
    this.id,
  );

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
}
