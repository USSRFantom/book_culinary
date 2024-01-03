import 'package:book_culinary/data/repositories/meal/meal_repository.dart';
import 'package:book_culinary/data/repositories/meals/meals_repository.dart';
import 'package:book_culinary/domain/models/ingredients.dart';
import 'package:book_culinary/domain/models/meal.dart';
import 'package:book_culinary/domain/models/meals.dart';
import 'package:book_culinary/view/base/bloc/state_status.dart';
import 'package:book_culinary/view/section/detailed_recipe/cubit/detailed_recipe_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealCubit extends Cubit<MealState> {
  final MealRepository _mealRepository;
  final MealsRepository _mealsRepository;


  MealCubit(
    this._mealRepository,
      this._mealsRepository,
  ) : super(const MealState());

  late Meal meal;
  final List<Ingredients> _allIngredients = [];

  Future<void> fetchAllMeal(int idMeal) async {
    emit(state.copyWith(error: null, status: const StateStatus.loading()));
    final dataResponse = await _mealRepository.fetchMeal(idMeal: idMeal);
    dataResponse.when(
      data: (data) {
        emit(
          state.copyWith(
            status: const StateStatus.success(),
            meals: data,
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

  Future<void> saveLikeMeal(Meals meals) async {
    emit(
      state.copyWith(
        status: const StateStatus.success(),
        meals: meals,
      ),
    );
    _mealRepository.saveLikeMeal(meals);
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
