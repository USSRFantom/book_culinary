import 'package:book_culinary/core/error/app_error.dart';
import 'package:book_culinary/domain/models/meal.dart';
import 'package:book_culinary/view/base/bloc/state_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detailed_recipe_state.freezed.dart';

@freezed
abstract class MealState with _$MealState {
  const factory MealState({
    @Default(StateStatus.success()) StateStatus status,
    @Default(false) bool allPagesLoaded,
    @Default([]) List<Meal> meals,
    AppError? error,
  }) = _MealState;

  const MealState._();
}
