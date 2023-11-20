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

  saveLikeMeal(Meal meal) async {
    var result = Meal(
        meal.idMeal,
        meal.strMeal,
        meal.strDrinkAlternate,
        meal.strCategory,
        meal.strArea,
        meal.strInstructions,
        meal.strMealThumb,
        meal.strTags,
        meal.strYoutube,
        meal.strIngredient1,
        meal.strIngredient2,
        meal.strIngredient3,
        meal.strIngredient4,
        meal.strIngredient5,
        meal.strIngredient6,
        meal.strIngredient7,
        meal.strIngredient8,
        meal.strIngredient9,
        meal.strIngredient10,
        meal.strIngredient11,
        meal.strIngredient12,
        meal.strIngredient13,
        meal.strIngredient14,
        meal.strIngredient15,
        meal.strIngredient16,
        meal.strIngredient17,
        meal.strIngredient18,
        meal.strIngredient19,
        meal.strIngredient20,
        meal.strMeasure1,
        meal.strMeasure2,
        meal.strMeasure3,
        meal.strMeasure4,
        meal.strMeasure5,
        meal.strMeasure6,
        meal.strMeasure7,
        meal.strMeasure8,
        meal.strMeasure9,
        meal.strMeasure10,
        meal.strMeasure11,
        meal.strMeasure12,
        meal.strMeasure13,
        meal.strMeasure14,
        meal.strMeasure15,
        meal.strMeasure16,
        meal.strMeasure17,
        meal.strMeasure18,
        meal.strMeasure19,
        meal.strMeasure20,
        meal.strSource,
        meal.strImageSource,
        meal.strCreativeCommonsConfirmed,
        meal.dateModified,
        meal.like);

    meal.like = true;
    List<Meal> listMeal = [];
    listMeal.add(result);
    emit(
      state.copyWith(
        status: const StateStatus.success(),
        meals: listMeal,
      ),
    );
    await _mealRepository.saveLikeMeal(result);
  }

  List<String> getIngredients(Meal meal) {
    List<String> ingredient = [];

    if (meal.strIngredient1 != null) {
      ingredient.add(meal.strIngredient1!);
    }
    if (meal.strIngredient2 != null) {
      ingredient.add(meal.strIngredient2!);
    }
    if (meal.strIngredient3 != null) {
      ingredient.add(meal.strIngredient3!);
    }
    if (meal.strIngredient4 != null) {
      ingredient.add(meal.strIngredient4!);
    }
    if (meal.strIngredient5 != null) {
      ingredient.add(meal.strIngredient5!);
    }
    if (meal.strIngredient6 != null) {
      ingredient.add(meal.strIngredient6!);
    }
    if (meal.strIngredient7 != null) {
      ingredient.add(meal.strIngredient7!);
    }
    if (meal.strIngredient8 != null) {
      ingredient.add(meal.strIngredient8!);
    }
    if (meal.strIngredient9 != null) {
      ingredient.add(meal.strIngredient9!);
    }
    if (meal.strIngredient10 != null) {
      ingredient.add(meal.strIngredient10!);
    }

    return ingredient;
  }

  List<String> getMeasure(Meal meal) {
    List<String> ingredient = [];

    if (meal.strMeasure1 != null) {
      ingredient.add(meal.strMeasure1!);
    }
    if (meal.strMeasure2 != null) {
      ingredient.add(meal.strMeasure2!);
    }
    if (meal.strMeasure3 != null) {
      ingredient.add(meal.strMeasure3!);
    }
    if (meal.strMeasure4 != null) {
      ingredient.add(meal.strMeasure4!);
    }
    if (meal.strMeasure5 != null) {
      ingredient.add(meal.strMeasure5!);
    }
    if (meal.strMeasure6 != null) {
      ingredient.add(meal.strMeasure6!);
    }
    if (meal.strMeasure7 != null) {
      ingredient.add(meal.strMeasure7!);
    }
    if (meal.strMeasure8 != null) {
      ingredient.add(meal.strMeasure8!);
    }
    if (meal.strMeasure9 != null) {
      ingredient.add(meal.strMeasure9!);
    }
    if (meal.strMeasure10 != null) {
      ingredient.add(meal.strMeasure10!);
    }

    return ingredient;
  }
}
