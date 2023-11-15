import 'package:book_culinary/data/repositories/base/base_repository.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:book_culinary/data/repositories/meats/meals_local_repository.dart';
import 'package:book_culinary/data/repositories/meats/meals_remote_repository.dart';
import 'package:book_culinary/domain/models/meals.dart';

class MealsRepository {
  final MealsLocalRepository _localRepository;
  final MealsRemoteRepository _remoteRepository;

  MealsRepository(this._remoteRepository, this._localRepository);

  Future<DataResponse<List<Meals>>> fetchMeals(
    int page,
    Map<String, dynamic>? params,
  ) async {
    if (page == 1) {
      return FetchData.fromRemoteWithSaveElseLocal<List<Meals>>(
        getFromRemote: () => _remoteRepository.getMeals(params),
        getFromLocalStorage: () => _localRepository.getMeals(),
        saveToLocalStorage: (value) => _localRepository.saveMeals(value),
      );
    } else if (page > 1) {
      return FetchData.fromRemoteWithSave<List<Meals>>(
        getFromRemote: () => _remoteRepository.getMeals(params),
        saveToLocalStorage: (value) => _localRepository.saveMeals(value),
      );
    } else {
      return FetchData.fromRemoteWithSave<List<Meals>>(
        getFromRemote: () => _remoteRepository.getMeals(
          params,
        ),
        saveToLocalStorage: (value) => _localRepository.saveMeals(value),
      );
    }
  }
}
