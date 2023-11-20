import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'meal.freezed.dart';
part 'meal.g.dart';

@freezed
@HiveType(typeId: 2)
class Meal extends HiveObject with _$Meal {
  Meal._();

  Meal get copy {
    final objectInstance = Meal();
    return objectInstance;
  }

  factory Meal({
    @JsonKey(name: 'idMeal') @HiveField(0) @Default('') String idMeal,
    @JsonKey(name: 'strMeal') @HiveField(1) @Default('') String strMeal,
    @JsonKey(name: 'strDrinkAlternate')
    @HiveField(2)
    @Default('')
        String strDrinkAlternate,
    @JsonKey(name: 'strCategory') @HiveField(3) @Default('') String strCategory,
    @JsonKey(name: 'strArea') @HiveField(4) @Default('') String strArea,
    @JsonKey(name: 'strInstructions')
    @HiveField(5)
    @Default('')
        String strInstructions,
    @JsonKey(name: 'strMealThumb')
    @HiveField(6)
    @Default('')
        String strMealThumb,
    @JsonKey(name: 'strTags') @HiveField(7) @Default('') String strTags,
    @JsonKey(name: 'strYoutube') @HiveField(8) @Default('') String strYoutube,
    @JsonKey(name: 'strIngredient1')
    @HiveField(9)
    @Default('')
        String strIngredient1,
    @JsonKey(name: 'strIngredient2')
    @HiveField(10)
    @Default('')
        String strIngredient2,
    @JsonKey(name: 'strIngredient3')
    @HiveField(11)
    @Default('')
        String strIngredient3,
    @JsonKey(name: 'strIngredient4')
    @HiveField(12)
    @Default('')
        String strIngredient4,
    @JsonKey(name: 'strIngredient5')
    @HiveField(13)
    @Default('')
        String strIngredient5,
    @JsonKey(name: 'strIngredient6')
    @HiveField(14)
    @Default('')
        String strIngredient6,
    @JsonKey(name: 'strIngredient7')
    @HiveField(15)
    @Default('')
        String strIngredient7,
    @JsonKey(name: 'strIngredient8')
    @HiveField(16)
    @Default('')
        String strIngredient8,
    @JsonKey(name: 'strIngredient9')
    @HiveField(17)
    @Default('')
        String strIngredient9,
    @JsonKey(name: 'strIngredient10')
    @HiveField(18)
    @Default('')
        String strIngredient10,
    @JsonKey(name: 'strIngredient11')
    @HiveField(19)
    @Default('')
        String strIngredient11,
    @JsonKey(name: 'strIngredient12')
    @HiveField(20)
    @Default('')
        String strIngredient12,
    @JsonKey(name: 'strIngredient13')
    @HiveField(21)
    @Default('')
        String strIngredient13,
    @JsonKey(name: 'strIngredient14')
    @HiveField(22)
    @Default('')
        String strIngredient14,
    @JsonKey(name: 'strIngredient15')
    @HiveField(23)
    @Default('')
        String strIngredient15,
    @JsonKey(name: 'strIngredient16')
    @HiveField(24)
    @Default('')
        String strIngredient16,
    @JsonKey(name: 'strIngredient17')
    @HiveField(25)
    @Default('')
        String strIngredient17,
    @JsonKey(name: 'strIngredient18')
    @HiveField(26)
    @Default('')
        String strIngredient18,
    @JsonKey(name: 'strIngredient19')
    @HiveField(27)
    @Default('')
        String strIngredient19,
    @JsonKey(name: 'strIngredient20')
    @HiveField(28)
    @Default('')
        String strIngredient20,
    @JsonKey(name: 'strMeasure1')
    @HiveField(29)
    @Default('')
        String strMeasure1,
    @JsonKey(name: 'strMeasure2')
    @HiveField(30)
    @Default('')
        String strMeasure2,
    @JsonKey(name: 'strMeasure3')
    @HiveField(31)
    @Default('')
        String strMeasure3,
    @JsonKey(name: 'strMeasure4')
    @HiveField(32)
    @Default('')
        String strMeasure4,
    @JsonKey(name: 'strMeasure5')
    @HiveField(33)
    @Default('')
        String strMeasure5,
    @JsonKey(name: 'strMeasure6')
    @HiveField(34)
    @Default('')
        String strMeasure6,
    @JsonKey(name: 'strMeasure7')
    @HiveField(35)
    @Default('')
        String strMeasure7,
    @JsonKey(name: 'strMeasure8')
    @HiveField(36)
    @Default('')
        String strMeasure8,
    @JsonKey(name: 'strMeasure9')
    @HiveField(37)
    @Default('')
        String strMeasure9,
    @JsonKey(name: 'strMeasure10')
    @HiveField(38)
    @Default('')
        String strMeasure10,
    @JsonKey(name: 'strMeasure11')
    @HiveField(39)
    @Default('')
        String strMeasure11,
    @JsonKey(name: 'strMeasure12')
    @HiveField(40)
    @Default('')
        String strMeasure12,
    @JsonKey(name: 'strMeasure13')
    @HiveField(41)
    @Default('')
        String strMeasure13,
    @JsonKey(name: 'strMeasure14')
    @HiveField(42)
    @Default('')
        String strMeasure14,
    @JsonKey(name: 'strMeasure15')
    @HiveField(43)
    @Default('')
        String strMeasure15,
    @JsonKey(name: 'strMeasure16')
    @HiveField(44)
    @Default('')
        String strMeasure16,
    @JsonKey(name: 'strMeasure17')
    @HiveField(45)
    @Default('')
        String strMeasure17,
    @JsonKey(name: 'strMeasure18')
    @HiveField(46)
    @Default('')
        String strMeasure18,
    @JsonKey(name: 'strMeasure19')
    @HiveField(47)
    @Default('')
        String strMeasure19,
    @JsonKey(name: 'strMeasure20')
    @HiveField(48)
    @Default('')
        String strMeasure20,
    @JsonKey(name: 'strSource') @HiveField(49) @Default('') String strSource,
    @JsonKey(name: 'strImageSource')
    @HiveField(50)
    @Default('')
        String strImageSource,
    @JsonKey(name: 'strCreativeCommonsConfirmed')
    @HiveField(51)
    @Default('')
        String strCreativeCommonsConfirmed,
    @JsonKey(name: 'dateModified')
    @HiveField(52)
    @Default('')
        String dateModified,
    @HiveField(53) @Default(false) bool like,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}
