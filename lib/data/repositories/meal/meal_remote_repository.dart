import 'package:book_culinary/core/http/api_routes.dart';
import 'package:book_culinary/core/http/http_client.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:book_culinary/domain/models/comment.dart';
import 'package:book_culinary/domain/models/meal.dart';
import 'package:book_culinary/domain/models/meals.dart';

class MealRemoteRepository {
  Future<DataResponse<Meals>> getMeal(int idMeal,) async {
    return await httpClient.get<Meals>(
      "${ApiRoutes.getMeal}$idMeal",
      mapper: Meals.fromJson,
    );
  }

  Future<DataResponse<List<Comment>>> getComments() async {
    return await httpClient.getList<Comment>(
      ApiRoutes.getComments,
      Comment.fromJson,
    );
  }
}
