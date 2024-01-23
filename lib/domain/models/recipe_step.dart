import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'recipe_step.g.dart';

@JsonSerializable(includeIfNull: true)
@HiveType(typeId: 10)
class RecipeStep extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int duration;



  RecipeStep(
      this.id,
      this.name,
      this.duration,
      );


  factory RecipeStep.fromJson(Map<String, dynamic> json) => _$RecipeStepFromJson(json);
}
