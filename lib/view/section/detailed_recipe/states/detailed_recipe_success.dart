import 'package:book_culinary/domain/models/meal.dart';
import 'package:book_culinary/helpers/constants/constant_colors.dart';
import 'package:book_culinary/helpers/constants/empty_data_widget.dart';
import 'package:book_culinary/view/section/detailed_recipe/cubit/detailed_recipe_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailedRecipeScreenSuccess extends StatefulWidget {
  const DetailedRecipeScreenSuccess({super.key});

  @override
  State<DetailedRecipeScreenSuccess> createState() =>
      _DetailedRecipeScreenSuccessState();
}

class _DetailedRecipeScreenSuccessState
    extends State<DetailedRecipeScreenSuccess> {
  late RefreshController _refreshController;

  late final MealCubit mealCubit;

  @override
  void initState() {
    _refreshController = RefreshController();
    mealCubit = context.read();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Meal meal = context.watch<MealCubit>().state.meals.first;
    List<String> ingredients = mealCubit.getIngredients(meal);
    List<String> measure = mealCubit.getMeasure(meal);
    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo is ScrollUpdateNotification &&
              scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
              kIsWeb &&
              // _cubit.state.allPagesLoaded
              // &&
              (defaultTargetPlatform == TargetPlatform.linux ||
                  defaultTargetPlatform == TargetPlatform.macOS ||
                  defaultTargetPlatform == TargetPlatform.windows)) {
            _refreshController.requestLoading();
          }
          return false;
        },
        child: meal.strMeal.isEmpty
            ? const EmptyDataWidget(
                text: 'Ошибка базы данных! '
                    'Потяните экран вниз для повторного получения данных',
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 17, right: 17, top: 27),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            meal.strMeal,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/svg/like.png'),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.lock_clock),
                          const SizedBox(
                            width: 11,
                          ),
                          Text(
                            '45 минут',
                            style: TextStyle(color: greenColor, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 220,
                        width: 396,
                        child: Image.network(
                          meal.strMealThumb,
                          fit: BoxFit.fitWidth,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Image.asset('assets/svg/internet.png');
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Text(
                        'Ингридиенты',
                        style: TextStyle(
                            color: greenColor2,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 15, bottom: 18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: greyColors,
                            width: 3,
                          ),
                        ),
                        child: Column(
                            children: getIngredients(ingredients, measure)),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Text(
                        'Шаги приготовления',
                        style: TextStyle(
                            color: greenColor2,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: backgroundColor),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 24),
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        color: grey2Colors,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  width: 29,
                                ),
                                Expanded(
                                  child: Text(
                                    'Кладем сыр, помидоры и базилик на основу, ставим в духовку еще на 10 минут. Пицца готова, когда сыр расплавится.',
                                    style: TextStyle(
                                        fontSize: 12, color: greyColors),
                                    maxLines: 6,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Transform.scale(
                                        scale: 1.5,
                                        child: Checkbox(
                                          value: false,
                                          onChanged: (bool? value) {},
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      Text(
                                        '01:00',
                                        style: TextStyle(
                                            color: greyColors, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: greenColor2),
                          width: 232,
                          height: 48,
                          child: const Center(
                              child: Text(
                            'Начать готовить',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  List<Widget> getIngredients(List<String> ingredients, List<String> measure) {
    List<Widget> result = [];

    for (var index = 0; index < ingredients.length; index++) {
      if (ingredients[index] != "") {
        result.add(
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ingredients[index],
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    measure[index],
                    style: TextStyle(fontSize: 13, color: greyColors),
                  ),
                ],
              ),
              const SizedBox(height: 17),
            ],
          ),
        );
      }
    }

    return result;
  }
}
