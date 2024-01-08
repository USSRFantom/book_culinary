import 'package:book_culinary/data/repositories/base/base_repository.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:book_culinary/domain/models/ingredients.dart';
import 'package:book_culinary/domain/models/meals.dart';
import 'package:book_culinary/domain/models/measure_ingredient.dart';
import 'package:book_culinary/domain/models/recipe_ingredient.dart';
import 'package:book_culinary/domain/models/recipe_step.dart';
import 'package:book_culinary/helpers/constants/hive_boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MealsLocalRepository {
  Future<void> saveMeals(List<Meals> meals) async {
    var box = await Hive.openBox<Meals>(HiveBoxes.meals);
    await box.putAll(Map.fromEntries(meals.map((meal) => MapEntry(meal.id, meal))));
    await box.close();
  }

  Future<void> saveAllIngredients(List<Ingredients> meals) async {
    var box = await Hive.openBox<Ingredients>(HiveBoxes.ingredients);
    await box.putAll(Map.fromEntries(meals.map((ingredient) => MapEntry(ingredient.id, ingredient))));
    await box.close();
  }

  Future<void> saveAllRecipeStep(List<RecipeStep> recipeStep) async {
    var box = await Hive.openBox<RecipeStep>(HiveBoxes.recipeStep);
    await box.putAll(Map.fromEntries(recipeStep.map((recipeStep) => MapEntry(recipeStep.id, recipeStep))));
    await box.close();
  }




  Future<void> saveRecipeIngredients(List<RecipeIngredients> meals) async {
    var box = await Hive.openBox<RecipeIngredients>(HiveBoxes.recipe);
    await box.putAll(Map.fromEntries(meals.map((ingredient) => MapEntry(ingredient.id, ingredient))));
    await box.close();
  }

  Future<void> saveMeasureUnit(List<MeasureIngredient> meals) async {
    var box = await Hive.openBox<MeasureIngredient>(HiveBoxes.measure);
    await box
        .putAll(Map.fromEntries(meals.map((measureIngredient) => MapEntry(measureIngredient.id, measureIngredient))));
    await box.close();
  }

  Future<DataResponse<List<Meals>>> getMeals() async {
    return await FetchData.getListFromBox<Meals>(
      boxName: HiveBoxes.meals,
      sortFunc: (Meals a, Meals b) => a.id.compareTo(b.id),
    );
  }

  Future<DataResponse<List<Ingredients>>> getAllIngredients() async {
    return await FetchData.getListFromBox<Ingredients>(
      boxName: HiveBoxes.ingredients,
      sortFunc: (Ingredients a, Ingredients b) => a.id.compareTo(b.id),
    );
  }

  Future<DataResponse<List<RecipeStep>>> getAllRecipeStep() async {
    return await FetchData.getListFromBox<RecipeStep>(
      boxName: HiveBoxes.recipeStep,
      sortFunc: (RecipeStep a, RecipeStep b) => a.id.compareTo(b.id),
    );
  }



  Future<DataResponse<List<RecipeIngredients>>> getRecipeIngredients() async {
    return await FetchData.getListFromBox<RecipeIngredients>(
      boxName: HiveBoxes.recipe,
      sortFunc: (RecipeIngredients a, RecipeIngredients b) => a.id.compareTo(b.id),
    );
  }

  Future<DataResponse<List<MeasureIngredient>>> getMeasureUnit() async {
    return await FetchData.getListFromBox<MeasureIngredient>(
      boxName: HiveBoxes.measure,
      sortFunc: (MeasureIngredient a, MeasureIngredient b) => a.id.compareTo(b.id),
    );
  }

  Future<DataResponse<List<Meals>>> getFavoritesMeals() async {
    return await FetchData.getListFromBox<Meals>(boxName: HiveBoxes.meal);
  }
}
