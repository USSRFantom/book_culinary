import 'package:book_culinary/core/http/api_routes.dart';
import 'package:book_culinary/core/http/http_client.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:book_culinary/domain/models/meal.dart';

class MealRemoteRepository {
  Future<DataResponse<List<Meal>>> getMeal(
    Map<String, dynamic>? params,
  ) async {
    Map<String, dynamic> queryParameters = {};
    if (params != null) {
      for (var entry in params.entries) {
        if (entry.value != null) {
          queryParameters[entry.key] = entry.value;
        }
      }
    }
    return await httpClient.getList<Meal>(
      ApiRoutes.getMeals,
      Meal.fromJson,
      queryParameters: queryParameters,
    );
  }
}
