import 'package:book_culinary/data/repositories/meal/meal_local_repository.dart';
import 'package:book_culinary/data/repositories/meal/meal_remote_repository.dart';
import 'package:book_culinary/data/repositories/meal/meal_repository.dart';
import 'package:book_culinary/data/repositories/meals/meals_local_repository.dart';
import 'package:book_culinary/data/repositories/meals/meals_remote_repository.dart';
import 'package:book_culinary/data/repositories/meals/meals_repository.dart';
import 'package:book_culinary/view/section/detailed_recipe/cubit/detailed_recipe_cubit.dart';
import 'package:book_culinary/view/section/favorites/cubit/favorites_cubit.dart';
import 'package:book_culinary/view/section/home_screen/cubit/meals_cubit.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  await initInjections(serviceLocator);
}

Future<void> initInjections(GetIt serviceLocator) async {
  serviceLocator.registerLazySingleton(() => MealsCubit(serviceLocator()));
  serviceLocator.registerLazySingleton(() => MealCubit(serviceLocator(), serviceLocator()));
  serviceLocator.registerLazySingleton(() => FavoritesCubit(serviceLocator()));
  serviceLocator.registerLazySingleton(
    () => MealsRepository(
      MealsRemoteRepository(),
      MealsLocalRepository(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => MealRepository(
      MealRemoteRepository(),
      MealLocalRepository(),
    ),
  );

  serviceLocator.registerLazySingleton<MealRemoteRepository>(
      () => MealRemoteRepository());
  serviceLocator
      .registerLazySingleton<MealLocalRepository>(() => MealLocalRepository());
  serviceLocator.registerLazySingleton<MealsRemoteRepository>(
      () => MealsRemoteRepository());
  serviceLocator.registerLazySingleton<MealsLocalRepository>(
      () => MealsLocalRepository());
}
