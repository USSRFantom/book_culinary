import 'package:book_culinary/data/repositories/meal/meal_repository.dart';
import 'package:book_culinary/domain/models/meal.dart';
import 'package:book_culinary/view/base/bloc/state_status.dart';
import 'package:book_culinary/view/section/detailed_recipe/cubit/detailed_recipe_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealCubit extends Cubit<MealState> {
  final MealRepository _mealRepository;
  MealCubit(
    this._mealRepository,
  ) : super(const MealState());

  late Meal meal;

  String _searchQuery = '';

  Future<void> fetchAllMeal(String nameMeal) async {
    _searchQuery = nameMeal;
    emit(state.copyWith(error: null));
    List<Meal> _allMeals = [];
    emit(state.copyWith(status: const StateStatus.loading()));
    _allMeals.clear();
    final dataResponse = await _mealRepository.fetchMeal(
      params: {
        "s": _searchQuery.isNotEmpty ? _searchQuery.trim().toLowerCase() : null,
      },
    );
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

  List<String> getIngredients(Meal meal) {
    List<String> ingredient = [];

    if (meal.strIngredient1 != '') {
      ingredient.add(meal.strIngredient1);
    }
    if (meal.strIngredient2 != '') {
      ingredient.add(meal.strIngredient2);
    }
    if (meal.strIngredient3 != '') {
      ingredient.add(meal.strIngredient3);
    }
    if (meal.strIngredient4 != '') {
      ingredient.add(meal.strIngredient4);
    }
    if (meal.strIngredient5 != '') {
      ingredient.add(meal.strIngredient5);
    }
    if (meal.strIngredient6 != '') {
      ingredient.add(meal.strIngredient6);
    }
    if (meal.strIngredient7 != '') {
      ingredient.add(meal.strIngredient7);
    }
    if (meal.strIngredient8 != '') {
      ingredient.add(meal.strIngredient8);
    }
    if (meal.strIngredient9 != '') {
      ingredient.add(meal.strIngredient9);
    }
    if (meal.strIngredient10 != '') {
      ingredient.add(meal.strIngredient10);
    }

    return ingredient;
  }

  List<String> getMeasure(Meal meal) {
    List<String> ingredient = [];

    if (meal.strMeasure1 != '') {
      ingredient.add(meal.strMeasure1);
    }
    if (meal.strMeasure2 != '') {
      ingredient.add(meal.strMeasure2);
    }
    if (meal.strMeasure3 != '') {
      ingredient.add(meal.strMeasure3);
    }
    if (meal.strMeasure4 != '') {
      ingredient.add(meal.strMeasure4);
    }
    if (meal.strMeasure5 != '') {
      ingredient.add(meal.strMeasure5);
    }
    if (meal.strMeasure6 != '') {
      ingredient.add(meal.strMeasure6);
    }
    if (meal.strMeasure7 != '') {
      ingredient.add(meal.strMeasure7);
    }
    if (meal.strMeasure8 != '') {
      ingredient.add(meal.strMeasure8);
    }
    if (meal.strMeasure9 != '') {
      ingredient.add(meal.strMeasure9);
    }
    if (meal.strMeasure10 != '') {
      ingredient.add(meal.strMeasure10);
    }

    return ingredient;
  }
}
