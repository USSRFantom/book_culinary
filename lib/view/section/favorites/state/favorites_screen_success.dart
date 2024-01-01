import 'package:book_culinary/domain/models/meal.dart';
import 'package:book_culinary/helpers/constants/empty_data_widget.dart';
import 'package:book_culinary/view/section/detailed_recipe/detailed_recipe_screen.dart';
import 'package:book_culinary/view/section/favorites/cubit/favorites_cubit.dart';
import 'package:book_culinary/view/section/home_screen/widgets/card_recipe.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FavoritesScreenSuccess extends StatefulWidget {
  const FavoritesScreenSuccess({super.key});

  @override
  State<FavoritesScreenSuccess> createState() => _FavoritesScreenSuccessState();
}

class _FavoritesScreenSuccessState extends State<FavoritesScreenSuccess> {
  late RefreshController _refreshController;
  late final FavoritesCubit _cubit;

  @override
  void initState() {
    _refreshController = RefreshController();
    _cubit = context.read();
    _cubit.fetchAllFavoritesMeals();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Meal> meals = context.watch<FavoritesCubit>().state.meals;

    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo is ScrollUpdateNotification &&
              scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
              kIsWeb &&
              _cubit.state.allPagesLoaded &&
              (defaultTargetPlatform == TargetPlatform.linux ||
                  defaultTargetPlatform == TargetPlatform.macOS ||
                  defaultTargetPlatform == TargetPlatform.windows)) {
            _refreshController.requestLoading();
          }
          return false;
        },
        child: meals.isEmpty
            ? const EmptyDataWidget(
                text: 'Ошибка базы данных! '
                    'Потяните экран вниз для повторного получения данных',
              )
            : ListView.separated(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 20,
                  top: 20,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => DetailedRecipeScreen(
                          //           meals[index].)),
                          // );
                        },
                        child: CardRecipe(
                          img: meals[index].strMealThumb!,
                          title: meals[index].strMeal!,
                          time: 0,
                        ),
                      ),
                      const SizedBox(height: 24)
                    ],
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemCount: meals.length,
              ),
      ),
    );
  }
}
