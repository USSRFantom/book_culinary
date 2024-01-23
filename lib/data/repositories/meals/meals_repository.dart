import 'package:book_culinary/data/repositories/base/base_repository.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:book_culinary/data/repositories/meals/meals_local_repository.dart';
import 'package:book_culinary/data/repositories/meals/meals_remote_repository.dart';
import 'package:book_culinary/domain/models/ingredients.dart';
import 'package:book_culinary/domain/models/meals.dart';
import 'package:book_culinary/domain/models/measure_ingredient.dart';
import 'package:book_culinary/domain/models/recipe_ingredient.dart';
import 'package:book_culinary/domain/models/recipe_step.dart';
import 'package:book_culinary/domain/models/recipe_step_link.dart';

class MealsRepository {
  final MealsLocalRepository _localRepository;
  final MealsRemoteRepository _remoteRepository;

  MealsRepository(this._remoteRepository, this._localRepository);

  Future<DataResponse<List<Meals>>> fetchMeals() async {
    return FetchData.fromRemoteWithSaveElseLocal<List<Meals>>(
      getFromRemote: () => _remoteRepository.getMeals(),
      getFromLocalStorage: () => _localRepository.getMeals(),
      saveToLocalStorage: (value) => _localRepository.saveMeals(value),
    );
  }

  Future<DataResponse<List<Ingredients>>> fetchAllIngredients() async {
    return FetchData.fromRemoteWithSaveElseLocal<List<Ingredients>>(
      getFromRemote: () => _remoteRepository.getAllIngredients(),
      getFromLocalStorage: () => _localRepository.getAllIngredients(),
      saveToLocalStorage: (value) => _localRepository.saveAllIngredients(value),
    );
  }

  Future<DataResponse<List<RecipeStepLink>>> fetchAllRecipeStepLink() async {
    return FetchData.fromRemoteWithSaveElseLocal<List<RecipeStepLink>>(
      getFromRemote: () => _remoteRepository.getAllRecipeStepLink(),
      getFromLocalStorage: () => _localRepository.getAllRecipeStepLink(),
      saveToLocalStorage: (value) => _localRepository.saveAllRecipeStepLink(value),
    );
  }

  Future<DataResponse<List<RecipeStep>>> fetchAllRecipeStep() async {
    return FetchData.fromRemoteWithSaveElseLocal<List<RecipeStep>>(
      getFromRemote: () => _remoteRepository.getAllRecipeStep(),
      getFromLocalStorage: () => _localRepository.getAllRecipeStep(),
      saveToLocalStorage: (value) => _localRepository.saveAllRecipeStep(value),
    );
  }


  Future<DataResponse<List<RecipeIngredients>>> fetchRecipeIngredients() async {
    return FetchData.fromRemoteWithSaveElseLocal<List<RecipeIngredients>>(
      getFromRemote: () => _remoteRepository.getRecipeIngredients(),
      getFromLocalStorage: () => _localRepository.getRecipeIngredients(),
      saveToLocalStorage: (value) => _localRepository.saveRecipeIngredients(value),
    );
  }

  Future<DataResponse<List<MeasureIngredient>>> fetchMeasureUnit() async {
    return FetchData.fromRemoteWithSaveElseLocal<List<MeasureIngredient>>(
      getFromRemote: () => _remoteRepository.getMeasureUnit(),
      getFromLocalStorage: () => _localRepository.getMeasureUnit(),
      saveToLocalStorage: (value) => _localRepository.saveMeasureUnit(value),
    );
  }

  Future<DataResponse<List<Meals>>> getFavoritesMeals() async {
    return FetchData.fromLocal(getFromLocalStorage: _localRepository.getFavoritesMeals);
  }
}

