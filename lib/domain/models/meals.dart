import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'meals.g.dart';

@JsonSerializable(includeIfNull: true)
@HiveType(typeId: 1)
class Meals extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int duration;
  @HiveField(2)
  final String photo;
  @HiveField(3)
  final String name;

  Meals(
    this.id,
    this.duration,
    this.photo,
    this.name,
  );

  factory Meals.fromJson(Map<String, dynamic> json) => _$MealsFromJson(json);
}
