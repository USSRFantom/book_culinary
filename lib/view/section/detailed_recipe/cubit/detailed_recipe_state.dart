import 'package:book_culinary/core/error/app_error.dart';
import 'package:book_culinary/domain/models/ingredients.dart';
import 'package:book_culinary/domain/models/meal.dart';
import 'package:book_culinary/domain/models/meals.dart';
import 'package:book_culinary/domain/models/measure_ingredient.dart';
import 'package:book_culinary/domain/models/recipe_ingredient.dart';
import 'package:book_culinary/domain/models/recipe_step.dart';
import 'package:book_culinary/domain/models/recipe_step_link.dart';
import 'package:book_culinary/view/base/bloc/state_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detailed_recipe_state.freezed.dart';

@freezed
abstract class MealState with _$MealState {
  const factory MealState({
    @Default(StateStatus.success()) StateStatus status,
    @Default(false) bool allPagesLoaded,
    @Default(null) Meals? meals,
    @Default([]) List<Ingredients> ingredients,
    @Default([]) List<RecipeIngredients> recipeIngredients,
    @Default([]) List<MeasureIngredient> measureIngredient,
    @Default([]) List<RecipeStepLink> recipeStepLink,
    @Default([]) List<RecipeStep> recipeStep,
    AppError? error,
  }) = _MealState;

  const MealState._();
}
