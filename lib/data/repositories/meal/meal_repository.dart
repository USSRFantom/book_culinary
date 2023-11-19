import 'package:book_culinary/data/repositories/base/base_repository.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:book_culinary/data/repositories/meal/meal_local_repository.dart';
import 'package:book_culinary/data/repositories/meal/meal_remote_repository.dart';
import 'package:book_culinary/domain/models/meal.dart';

class MealRepository {
  final MealLocalRepository _localRepository;
  final MealRemoteRepository _remoteRepository;

  MealRepository(this._remoteRepository, this._localRepository);

  Future<DataResponse<List<Meal>>> fetchMeal({
    required Map<String, dynamic> params,
  }) async {
    return FetchData.fromRemoteWithSaveElseLocal<List<Meal>>(
      getFromRemote: () => _remoteRepository.getMeal(params),
      getFromLocalStorage: () => _localRepository.getMeal(),
      saveToLocalStorage: (value) => _localRepository.saveMeal(value),
    );
  }
}
