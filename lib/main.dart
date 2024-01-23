import 'package:book_culinary/core/http/http_client.dart';
import 'package:book_culinary/domain/models/comment.dart';
import 'package:book_culinary/domain/models/ingredient.dart';
import 'package:book_culinary/domain/models/ingredients.dart';
import 'package:book_culinary/domain/models/meal.dart';
import 'package:book_culinary/domain/models/meals.dart';
import 'package:book_culinary/domain/models/measure_ingredient.dart';
import 'package:book_culinary/domain/models/measure_unit.dart';
import 'package:book_culinary/domain/models/recipe.dart';
import 'package:book_culinary/domain/models/recipe_ingredient.dart';
import 'package:book_culinary/domain/models/recipe_step.dart';
import 'package:book_culinary/domain/models/recipe_step_link.dart';
import 'package:book_culinary/domain/models/user.dart';
import 'package:book_culinary/locator_service.dart' as di;
import 'package:book_culinary/view/section/detailed_recipe/cubit/detailed_recipe_cubit.dart';
import 'package:book_culinary/view/section/favorites/cubit/favorites_cubit.dart';
import 'package:book_culinary/view/section/home_screen/cubit/meals_cubit.dart';
import 'package:book_culinary/view/section/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Hive.initFlutter();
  Hive
    ..registerAdapter(MealsAdapter())
    ..registerAdapter(MealAdapter())
    ..registerAdapter(MeasureIngredientAdapter())
    ..registerAdapter(IngredientAdapter())
    ..registerAdapter(IngredientsAdapter())
    ..registerAdapter(MeasureUnitAdapter())
    ..registerAdapter(RecipeStepLinkAdapter())
    ..registerAdapter(RecipeStepAdapter())
    ..registerAdapter(RecipeAdapter())
    ..registerAdapter(RecipeIngredientsAdapter())
    ..registerAdapter(CommentAdapter())
    ..registerAdapter(UserAdapter());

  initHttpClient();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MealsCubit>(create: (context) => serviceLocator<MealsCubit>()),
        BlocProvider<MealCubit>(create: (context) => serviceLocator<MealCubit>()),
        BlocProvider<FavoritesCubit>(create: (context) => serviceLocator<FavoritesCubit>()),
      ],
      child: ScreenUtilInit(
        builder: (context, widget) => const MainScreen(),
        designSize: const Size(375, 812),
      ),
    );
  }
}
