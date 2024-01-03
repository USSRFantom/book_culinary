import 'package:book_culinary/core/http/api_routes.dart';
import 'package:book_culinary/core/http/http_client.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:book_culinary/domain/models/ingredients.dart';
import 'package:book_culinary/domain/models/meals.dart';

class MealsRemoteRepository {
  Future<DataResponse<List<Meals>>> getMeals() async {
    return await httpClient.getList<Meals>(
      ApiRoutes.getMeals,
      Meals.fromJson,
    );
  }

  Future<DataResponse<List<Ingredients>>> getIngredients() async {
    return await httpClient.getList<Ingredients>(
      ApiRoutes.getIngredients,
      Ingredients.fromJson,
    );
  }

}
