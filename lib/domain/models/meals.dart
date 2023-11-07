import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'meals.freezed.dart';
part 'meals.g.dart';

@HiveType(typeId: 2)
@freezed
class Meals extends HiveObject with _$Meals {
  Meals._();
  @JsonSerializable(explicitToJson: true)
  factory Meals({
    @JsonKey(name: 'idMeal') @Default('') String? idMeal,
    @JsonKey(name: 'strMeal') @Default('') String? strMeal,
    @JsonKey(name: 'strDrinkAlternate') @Default('') String? strDrinkAlternate,
    @JsonKey(name: 'strCategory') @Default('') String? strCategory,
    @JsonKey(name: 'strArea') @Default('') String? strArea,
    @JsonKey(name: 'strInstructions') @Default('') String? strInstructions,
    @JsonKey(name: 'strMealThumb') @Default('') String? strMealThumb,
    @JsonKey(name: 'strTags') @Default('') String? strTags,
    @JsonKey(name: 'strYoutube') @Default('') String? strYoutube,
    @JsonKey(name: 'strIngredient1') @Default('') String? strIngredient1,
    @JsonKey(name: 'strIngredient2') @Default('') String? strIngredient2,
    @JsonKey(name: 'strIngredient3') @Default('') String? strIngredient3,
    @JsonKey(name: 'strIngredient4') @Default('') String? strIngredient4,
    @JsonKey(name: 'strIngredient5') @Default('') String? strIngredient5,
    @JsonKey(name: 'strIngredient6') @Default('') String? strIngredient6,
    @JsonKey(name: 'strIngredient7') @Default('') String? strIngredient7,
    @JsonKey(name: 'strIngredient8') @Default('') String? strIngredient8,
    @JsonKey(name: 'strIngredient9') @Default('') String? strIngredient9,
    @JsonKey(name: 'strIngredient10') @Default('') String? strIngredient10,
    @JsonKey(name: 'strIngredient11') @Default('') String? strIngredient11,
    @JsonKey(name: 'strIngredient12') @Default('') String? strIngredient12,
    @JsonKey(name: 'strIngredient13') @Default('') String? strIngredient13,
    @JsonKey(name: 'strIngredient14') @Default('') String? strIngredient14,
    @JsonKey(name: 'strIngredient15') @Default('') String? strIngredient15,
    @JsonKey(name: 'strIngredient16') @Default('') String? strIngredient16,
    @JsonKey(name: 'strIngredient17') @Default('') String? strIngredient17,
    @JsonKey(name: 'strIngredient18') @Default('') String? strIngredient18,
    @JsonKey(name: 'strIngredient19') @Default('') String? strIngredient19,
    @JsonKey(name: 'strIngredient20') @Default('') String? strIngredient20,
    @JsonKey(name: 'strMeasure1') @Default('') String? strMeasure1,
    @JsonKey(name: 'strMeasure2') @Default('') String? strMeasure2,
    @JsonKey(name: 'strMeasure3') @Default('') String? strMeasure3,
    @JsonKey(name: 'strMeasure4') @Default('') String? strMeasure4,
    @JsonKey(name: 'strMeasure5') @Default('') String? strMeasure5,
    @JsonKey(name: 'strMeasure6') @Default('') String? strMeasure6,
    @JsonKey(name: 'strMeasure7') @Default('') String? strMeasure7,
    @JsonKey(name: 'strMeasure8') @Default('') String? strMeasure8,
    @JsonKey(name: 'strMeasure9') @Default('') String? strMeasure9,
    @JsonKey(name: 'strMeasure10') @Default('') String? strMeasure10,
    @JsonKey(name: 'strMeasure11') @Default('') String? strMeasure11,
    @JsonKey(name: 'strMeasure12') @Default('') String? strMeasure12,
    @JsonKey(name: 'strMeasure13') @Default('') String? strMeasure13,
    @JsonKey(name: 'strMeasure14') @Default('') String? strMeasure14,
    @JsonKey(name: 'strMeasure15') @Default('') String? strMeasure15,
    @JsonKey(name: 'strMeasure16') @Default('') String? strMeasure16,
    @JsonKey(name: 'strMeasure17') @Default('') String? strMeasure17,
    @JsonKey(name: 'strMeasure18') @Default('') String? strMeasure18,
    @JsonKey(name: 'strMeasure19') @Default('') String? strMeasure19,
    @JsonKey(name: 'strMeasure20') @Default('') String? strMeasure20,
    @JsonKey(name: 'strSource') @Default('') String? strSource,
    @JsonKey(name: 'strImageSource') @Default('') String? strImageSource,
    @JsonKey(name: 'strCreativeCommonsConfirmed')
    @Default('')
        String? strCreativeCommonsConfirmed,
    @JsonKey(name: 'dateModified') @Default('') String? dateModified,
  }) = _Meals;

  factory Meals.fromJson(Map<String, dynamic> json) => _$MealsFromJson(json);
}
