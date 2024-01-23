import 'package:book_culinary/core/error/app_error.dart';
import 'package:book_culinary/domain/models/meal.dart';
import 'package:book_culinary/domain/models/meals.dart';
import 'package:book_culinary/view/base/bloc/state_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites_state.freezed.dart';

@freezed
abstract class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @Default(StateStatus.success()) StateStatus status,
    @Default(false) bool allPagesLoaded,
    @Default([]) List<Meals> meals,
    AppError? error,
  }) = _FavoritesState;

  const FavoritesState._();
}
