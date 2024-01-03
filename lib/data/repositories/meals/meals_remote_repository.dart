import 'package:book_culinary/core/http/api_routes.dart';
import 'package:book_culinary/core/http/http_client.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:book_culinary/domain/models/ingredients.dart';
import 'package:book_culinary/domain/models/meals.dart';
import 'package:book_culinary/domain/models/measure_ingredient.dart';
import 'package:book_culinary/domain/models/recipe_ingredient.dart';

class MealsRemoteRepository {
  Future<DataResponse<List<Meals>>> getMeals() async {
    return await httpClient.getList<Meals>(
      ApiRoutes.getMeals,
      Meals.fromJson,
    );
  }

  Future<DataResponse<List<RecipeIngredients>>> getRecipeIngredients() async {
    return await httpClient.getList<RecipeIngredients>(
      ApiRoutes.getRecipeIngredient,
      RecipeIngredients.fromJson,
    );
  }


  Future<DataResponse<List<Ingredients>>> getAllIngredients() async {
    return await httpClient.getList<Ingredients>(
      ApiRoutes.getIngredients,
      Ingredients.fromJson,
    );
  }


  Future<DataResponse<List<MeasureIngredient>>> getMeasureUnit() async {
    return await httpClient.getList<MeasureIngredient>(
      ApiRoutes.getMeasureUnit,
      MeasureIngredient.fromJson,
    );
  }


}
