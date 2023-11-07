import 'package:book_culinary/data/repositories/base/base_repository.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:book_culinary/domain/models/meals.dart';
import 'package:book_culinary/helpers/constants/hive_boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MealsLocalRepository {
  Future<void> saveMeals(List<Meals> meals) async {
    var box = await Hive.openBox<Meals>(HiveBoxes.meals);
    await box.putAll(
      Map.fromEntries(meals.map((meals) => MapEntry(meals.idMeal, meals))),
    );
    // await box.close();
  }

  Future<DataResponse<List<Meals>>> getMeals() async {
    return await FetchData.getListFromBox(
      boxName: HiveBoxes.meals,
    );
  }
}
