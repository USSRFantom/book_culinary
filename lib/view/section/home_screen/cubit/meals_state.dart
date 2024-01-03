import 'package:book_culinary/core/error/app_error.dart';
import 'package:book_culinary/domain/models/ingredients.dart';
import 'package:book_culinary/domain/models/meals.dart';
import 'package:book_culinary/view/base/bloc/state_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meals_state.freezed.dart';

@freezed
abstract class MealsState with _$MealsState {
  const factory MealsState({
    @Default(StateStatus.success()) StateStatus status,
    @Default(false) bool allPagesLoaded,
    @Default([]) List<Meals> meals,
    @Default([]) List<Ingredients> ingredients,
    AppError? error,
  }) = _MealsState;

  const MealsState._();
}
