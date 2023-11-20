import 'package:book_culinary/data/repositories/base/base_repository.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:book_culinary/domain/models/meal.dart';
import 'package:book_culinary/helpers/constants/hive_boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MealLocalRepository {
  Future<void> saveMeal(List<Meal> meal) async {
    var box = await Hive.openBox<Meal>(HiveBoxes.meal);
    await box.putAll(
        Map.fromEntries(meal.map((meal) => MapEntry(meal.strMeal, meal))));
    await box.close();
  }

  Future<DataResponse<List<Meal>>> getMeal() async {
    return await FetchData.getListFromBox<Meal>(
      boxName: HiveBoxes.meals,
      sortFunc: (Meal a, Meal b) => a.idMeal!.compareTo(b.idMeal!),
    );
  }

  Future<void> saveLikeMeal(Meal meal) async {
    var box = await Hive.openBox<Meal>(HiveBoxes.like);
    await box.put(meal.idMeal, meal);
  }
}
