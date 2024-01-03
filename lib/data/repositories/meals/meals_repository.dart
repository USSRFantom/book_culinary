import 'package:book_culinary/data/repositories/base/base_repository.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:book_culinary/data/repositories/meals/meals_local_repository.dart';
import 'package:book_culinary/data/repositories/meals/meals_remote_repository.dart';
import 'package:book_culinary/domain/models/ingredients.dart';
import 'package:book_culinary/domain/models/meal.dart';
import 'package:book_culinary/domain/models/meals.dart';

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

  Future<DataResponse<List<Ingredients>>> fetchIngredients() async {
    return FetchData.fromRemoteWithSaveElseLocal<List<Ingredients>>(
      getFromRemote: () => _remoteRepository.getIngredients(),
      getFromLocalStorage: () => _localRepository.getIngredients(),
      saveToLocalStorage: (value) => _localRepository.saveIngredients(value),
    );
  }



  Future<DataResponse<List<Meals>>> getFavoritesMeals() async {
    return FetchData.fromLocal(
        getFromLocalStorage: _localRepository.getFavoritesMeals);
  }
}
