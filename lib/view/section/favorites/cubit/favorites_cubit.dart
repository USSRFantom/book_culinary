import 'package:book_culinary/data/repositories/meals/meals_repository.dart';
import 'package:book_culinary/domain/models/meal.dart';
import 'package:book_culinary/view/base/bloc/state_status.dart';
import 'package:book_culinary/view/section/favorites/cubit/favorites_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final MealsRepository _mealsRepository;

  FavoritesCubit(
    this._mealsRepository,
  ) : super(const FavoritesState());

  final List<Meal> _allMeals = [];

  Future<void> fetchAllFavoritesMeals() async {
    emit(state.copyWith(error: null));
    emit(state.copyWith(status: const StateStatus.loading()));
    final dataResponse = await _mealsRepository.getFavoritesMeals();
    dataResponse.when(
      data: (data) {
        _allMeals.clear();
        _allMeals.addAll(data);
        emit(
          state.copyWith(
            status: const StateStatus.success(),
            meals: _allMeals,
          ),
        );
      },
      error: (error) {
        emit(
          state.copyWith(status: StateStatus.error(error), error: error),
        );
      },
    );
  }
}
