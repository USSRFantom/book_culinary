import 'package:book_culinary/core/http/api_routes.dart';
import 'package:book_culinary/core/http/http_client.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:book_culinary/domain/models/meal.dart';

class MealRemoteRepository {
  Future<DataResponse<Meal>> getMeal(
    int idMeal,
  ) async {
    return await httpClient.get<Meal>(
      "${ApiRoutes.getMeal}$idMeal",
    );
  }
}
