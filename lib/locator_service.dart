import 'package:book_culinary/data/repositories/meats/meals_local_repository.dart';
import 'package:book_culinary/data/repositories/meats/meals_remote_repository.dart';
import 'package:book_culinary/data/repositories/meats/meals_repository.dart';
import 'package:book_culinary/view/section/home_screen/cubit/meals_cubit.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  await initInjections(serviceLocator);
}

Future<void> initInjections(GetIt serviceLocator) async {
  serviceLocator.registerLazySingleton(
    () => MealsRepository(
      MealsRemoteRepository(),
      MealsLocalRepository(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => MealsCubit(serviceLocator()),
  );

  serviceLocator.registerLazySingleton<MealsRemoteRepository>(
      () => MealsRemoteRepository());
  serviceLocator.registerLazySingleton<MealsLocalRepository>(
      () => MealsLocalRepository());
}
