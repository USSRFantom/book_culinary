import 'package:book_culinary/data/repositories/base/base_repository.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:book_culinary/data/repositories/meal/meal_local_repository.dart';
import 'package:book_culinary/data/repositories/meal/meal_remote_repository.dart';
import 'package:book_culinary/domain/models/comment.dart';
import 'package:book_culinary/domain/models/meal.dart';
import 'package:book_culinary/domain/models/meals.dart';

class MealRepository {
  final MealLocalRepository _localRepository;
  final MealRemoteRepository _remoteRepository;

  MealRepository(this._remoteRepository, this._localRepository);

  Future<DataResponse<Meals>> fetchMeal({
    required int idMeal
  }) async {
    return FetchData.fromRemoteWithSaveElseLocal<Meals>(
      getFromRemote: () => _remoteRepository.getMeal(idMeal),
      getFromLocalStorage: () => _localRepository.getMeal(idMeal),
      saveToLocalStorage: (value) => _localRepository.saveMeal(value),
    );
  }

  Future<void> saveLikeMeal(Meals meal) async {
    _localRepository.saveLikeMeal(meal);
  }

  Future<DataResponse<List<Comment>>> fetchComment() async {
    return FetchData.fromRemoteWithSaveElseLocal<List<Comment>>(
      getFromRemote: () => _remoteRepository.getComments(),
      getFromLocalStorage: () => _localRepository.getComments(),
      saveToLocalStorage: (value) => _localRepository.saveComments(value),
    );
  }

}
