import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'meal.g.dart';

@JsonSerializable(includeIfNull: true)
@HiveType(typeId: 2)
class Meal extends HiveObject {
  @HiveField(0)
  String? idMeal;
  @HiveField(1)
  String? strMeal;
  @HiveField(2)
  String? strDrinkAlternate;
  @HiveField(3)
  String? strCategory;
  @HiveField(4)
  String? strArea;
  @HiveField(5)
  String? strInstructions;
  @HiveField(6)
  String? strMealThumb;
  @HiveField(7)
  String? strTags;
  @HiveField(8)
  String? strYoutube;
  @HiveField(9)
  String? strIngredient1;
  @HiveField(10)
  String? strIngredient2;
  @HiveField(11)
  String? strIngredient3;
  @HiveField(12)
  String? strIngredient4;
  @HiveField(13)
  String? strIngredient5;
  @HiveField(14)
  String? strIngredient6;
  @HiveField(15)
  String? strIngredient7;
  @HiveField(16)
  String? strIngredient8;
  @HiveField(17)
  String? strIngredient9;
  @HiveField(18)
  String? strIngredient10;
  @HiveField(19)
  String? strIngredient11;
  @HiveField(20)
  String? strIngredient12;
  @HiveField(21)
  String? strIngredient13;
  @HiveField(22)
  String? strIngredient14;
  @HiveField(23)
  String? strIngredient15;
  @HiveField(24)
  String? strIngredient16;
  @HiveField(25)
  String? strIngredient17;
  @HiveField(26)
  String? strIngredient18;
  @HiveField(27)
  String? strIngredient19;
  @HiveField(28)
  String? strIngredient20;
  @HiveField(29)
  String? strMeasure1;
  @HiveField(30)
  String? strMeasure2;

  @HiveField(31)
  String? strMeasure3;

  @HiveField(32)
  String? strMeasure4;

  @HiveField(33)
  String? strMeasure5;

  @HiveField(34)
  String? strMeasure6;

  @HiveField(35)
  String? strMeasure7;

  @HiveField(36)
  String? strMeasure8;

  @HiveField(37)
  String? strMeasure9;

  @HiveField(38)
  String? strMeasure10;

  @HiveField(39)
  String? strMeasure11;

  @HiveField(40)
  String? strMeasure12;

  @HiveField(41)
  String? strMeasure13;

  @HiveField(42)
  String? strMeasure14;

  @HiveField(43)
  String? strMeasure15;

  @HiveField(44)
  String? strMeasure16;

  @HiveField(45)
  String? strMeasure17;

  @HiveField(46)
  String? strMeasure18;

  @HiveField(47)
  String? strMeasure19;

  @HiveField(48)
  String? strMeasure20;
  @HiveField(49)
  String? strSource;

  @HiveField(50)
  String? strImageSource;

  @HiveField(51)
  String? strCreativeCommonsConfirmed;

  @HiveField(52)
  String? dateModified;
  @HiveField(53)
  bool? like;

  Meal(
    this.idMeal,
    this.strMeal,
    this.strDrinkAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strIngredient16,
    this.strIngredient17,
    this.strIngredient18,
    this.strIngredient19,
    this.strIngredient20,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strMeasure16,
    this.strMeasure17,
    this.strMeasure18,
    this.strMeasure19,
    this.strMeasure20,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
    this.like,
  );

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}
