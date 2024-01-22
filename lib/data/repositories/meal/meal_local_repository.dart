import 'package:book_culinary/data/repositories/base/base_repository.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:book_culinary/domain/models/comment.dart';
import 'package:book_culinary/domain/models/meals.dart';
import 'package:book_culinary/helpers/constants/hive_boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MealLocalRepository {
  Future<void> saveMeal(Meals meal) async {
    var box = await Hive.openBox<Meals>(HiveBoxes.meal);
    await box.put(meal.id, meal);
  }

  Future<DataResponse<Meals>> getMeal(int idMeal) {
    return FetchData.getFromBoxByKey(HiveBoxes.meal, idMeal.toString());
  }

  Future<void> saveLikeMeal(Meals meal) async {
    var box = await Hive.openBox<Meals>(HiveBoxes.meal);
    await box.put(meal.id, meal);
  }

  Future<DataResponse<List<Comment>>> getComments() async {
    return await FetchData.getListFromBox<Comment>(
      boxName: HiveBoxes.comments,
      sortFunc: (Comment a, Comment b) => a.id.compareTo(b.id),
    );
  }

  Future<void> saveComments(List<Comment> comments) async {
    var box = await Hive.openBox<Comment>(HiveBoxes.comments);
    await box.putAll(Map.fromEntries(comments.map((comment) => MapEntry(comment.id, comment))));
    await box.close();
  }
}
