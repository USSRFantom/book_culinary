import 'package:book_culinary/data/repositories/meal/meal_repository.dart';
import 'package:book_culinary/data/repositories/meals/meals_repository.dart';
import 'package:book_culinary/domain/models/comment.dart';
import 'package:book_culinary/domain/models/ingredients.dart';
import 'package:book_culinary/domain/models/meal.dart';
import 'package:book_culinary/domain/models/meals.dart';
import 'package:book_culinary/domain/models/measure_ingredient.dart';
import 'package:book_culinary/domain/models/recipe_ingredient.dart';
import 'package:book_culinary/domain/models/recipe_step.dart';
import 'package:book_culinary/domain/models/recipe_step_link.dart';
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
  final List<RecipeIngredients> _allRecipeIngredients = [];
  final List<MeasureIngredient> _measureIngredient = [];
  final List<RecipeStepLink> _recipeStepLink = [];
  final List<RecipeStep> _recipeStep = [];

  final List<Comment> _comment = [];


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


  Future<void> fetchComment(int idMeal) async {
    emit(state.copyWith(comments: []));
    final dataResponse = await _mealRepository.fetchComment();
    _comment.clear();
    print('==');
    print(idMeal);
    print('==');
    dataResponse.when(
      data: (data) {
        for (var element in data) {
          print(idMeal);
          print(element.recipe?.id);
          if(element.recipe?.id == idMeal){
            _comment.add(element);
          }
        }
        emit(
          state.copyWith(
            comments: _comment,
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
    final dataResponse = await _mealsRepository.fetchAllIngredients();
    dataResponse.when(
      data: (data) {
        emit(
          state.copyWith(
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

  Future<void> fetchAllRecipeStepLink() async {
    final dataResponse = await _mealsRepository.fetchAllRecipeStepLink();
    dataResponse.when(
      data: (data) {
        emit(
          state.copyWith(
            recipeStepLink: data,
          ),
        );
        if (data.isNotEmpty) {
          _recipeStepLink.addAll(data);
        }
      },
      error: (error) {},
    );
  }

  Future<void> fetchAllRecipeStep() async {
    final dataResponse = await _mealsRepository.fetchAllRecipeStep();
    dataResponse.when(
      data: (data) {
        emit(
          state.copyWith(
            recipeStep: data,
          ),
        );
        if (data.isNotEmpty) {
          _recipeStep.addAll(data);
        }
      },
      error: (error) {},
    );
  }

  Future<void> fetchIngredients() async {
    final dataResponse = await _mealsRepository.fetchRecipeIngredients();
    dataResponse.when(
      data: (data) {
        emit(
          state.copyWith(
            recipeIngredients: data,
          ),
        );
        if (data.isNotEmpty) {
          _allRecipeIngredients.addAll(data);
        }
      },
      error: (error) {},
    );
  }

  Future<void> fetchMeasureUnit() async {
    final dataResponse = await _mealsRepository.fetchMeasureUnit();
    dataResponse.when(
      data: (data) {
        emit(
          state.copyWith(
            measureIngredient: data,
          ),
        );
        if (data.isNotEmpty) {
          _measureIngredient.addAll(data);
        }
      },
      error: (error) {},
    );
  }

  void getSTep(int idRecipe) {
    List<RecipeStep> result = [];

    for (var element in _recipeStepLink) {
      if (element.recipe.id == idRecipe) {
        for (var step in _recipeStep) {
          if (step.id == element.step.id){
            result.add(step);
          }

        }
      }
    }
    if (result.isNotEmpty) {
      emit(
        state.copyWith(
          step: result,
        ),
      );
    }
  }


}
