import 'package:book_culinary/data/repositories/meals/meals_repository.dart';
import 'package:book_culinary/domain/models/ingredients.dart';
import 'package:book_culinary/domain/models/meals.dart';
import 'package:book_culinary/view/base/bloc/state_status.dart';
import 'package:book_culinary/view/section/home_screen/cubit/meals_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsCubit extends Cubit<MealsState> {
  final MealsRepository _mealsRepository;

  MealsCubit(
    this._mealsRepository,
  ) : super(const MealsState());

  final List<Meals> _allMeals = [];
  final List<Ingredients> _allIngredients = [];

  Future<void> fetchAllMeals() async {
    emit(state.copyWith(error: null, status: const StateStatus.loading()));
    _allMeals.clear();
    final dataResponse = await _mealsRepository.fetchMeals();
    dataResponse.when(
      data: (data) {
        emit(
          state.copyWith(
            status: const StateStatus.success(),
            meals: data,
          ),
        );
        if (data.isNotEmpty) {
          _allMeals.addAll(data);
        }
      },
      error: (error) {
        print('22222');
        print(error.message);
        emit(
          state.copyWith(status: StateStatus.error(error), error: error),
        );
      },
    );
  }

  Future<void> fetchAllIngredients() async {
    final dataResponse = await _mealsRepository.fetchIngredients();
    dataResponse.when(
      data: (data) {
        emit(
          state.copyWith(
            status: const StateStatus.success(),
            ingredients: data,
          ),
        );
        if (data.isNotEmpty) {
          _allIngredients.addAll(data);
        }
      },
      error: (error) {},
    );
  }
}
