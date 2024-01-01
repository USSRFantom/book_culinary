import 'package:book_culinary/data/repositories/base/base_repository.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:book_culinary/domain/models/meal.dart';
import 'package:book_culinary/helpers/constants/hive_boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MealLocalRepository {
  Future<void> saveMeal(Meal meal) async {
    var box = await Hive.openBox<Meal>(HiveBoxes.meal);
    await box.put(meal.idMeal, meal);
  }

  Future<DataResponse<Meal>> getMeal(int idMeal) {
    return FetchData.getFromBoxByKey(HiveBoxes.meal, idMeal.toString());
  }

  Future<void> saveLikeMeal(Meal meal) async {
    var box = await Hive.openBox<Meal>(HiveBoxes.like);
    await box.put(meal.idMeal, meal);
  }
}
