import 'package:book_culinary/data/repositories/base/base_repository.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:book_culinary/data/repositories/meal/meal_local_repository.dart';
import 'package:book_culinary/data/repositories/meal/meal_remote_repository.dart';
import 'package:book_culinary/domain/models/meal.dart';

class MealRepository {
  final MealLocalRepository _localRepository;
  final MealRemoteRepository _remoteRepository;

  MealRepository(this._remoteRepository, this._localRepository);

  Future<DataResponse<Meal>> fetchMeal({
    required int idMeal
  }) async {
    return FetchData.fromRemoteWithSaveElseLocal<Meal>(
      getFromRemote: () => _remoteRepository.getMeal(idMeal),
      getFromLocalStorage: () => _localRepository.getMeal(idMeal),
      saveToLocalStorage: (value) => _localRepository.saveMeal(value),
    );
  }

  Future<void> saveLikeMeal(Meal meal) async {
    _localRepository.saveLikeMeal(meal);
  }
}
