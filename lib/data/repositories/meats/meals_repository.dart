import 'package:book_culinary/data/repositories/base/base_repository.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:book_culinary/data/repositories/meats/meals_local_repository.dart';
import 'package:book_culinary/data/repositories/meats/meals_remote_repository.dart';
import 'package:book_culinary/domain/models/meals.dart';

class MealsRepository {
  final MealsLocalRepository _localRepository;
  final MealsRemoteRepository _remoteRepository;

  MealsRepository(this._remoteRepository, this._localRepository);

  Future<DataResponse<List<Meals>>> fetchMeals({
    required int page,
  }) async {
    if (page == 1) {
      return FetchData.fromRemoteWithSaveElseLocal<List<Meals>>(
        getFromRemote: () => _remoteRepository.getMeals(
          page: page,
        ),
        getFromLocalStorage: () => _localRepository.getMeals(),
        saveToLocalStorage: (value) => _localRepository.saveMeals(value),
      );
      // Загрузка следующих страниц , без фильтров
      // Получаем данные только с бэка
      // Сохраняем в кэш
    } else if (page > 1) {
      // Получаем данные только с бэка, сохраняем в кэш
      return FetchData.fromRemoteWithSave<List<Meals>>(
        getFromRemote: () => _remoteRepository.getMeals(
          page: page,
        ),
        saveToLocalStorage: (value) => _localRepository.saveMeals(value),
      );
    } else {
      return FetchData.fromRemoteWithSave<List<Meals>>(
        getFromRemote: () => _remoteRepository.getMeals(
          page: page,
        ),
        saveToLocalStorage: (value) => _localRepository.saveMeals(value),
      );
    }
  }
}
