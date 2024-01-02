import 'package:book_culinary/domain/models/meal.dart';
import 'package:book_culinary/domain/models/meals.dart';
import 'package:book_culinary/helpers/constants/app_string.dart';
import 'package:book_culinary/helpers/constants/constant_colors.dart';
import 'package:book_culinary/view/section/detailed_recipe/cubit/detailed_recipe_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailedRecipeScreenSuccess extends StatefulWidget {
  const DetailedRecipeScreenSuccess({super.key});

  @override
  State<DetailedRecipeScreenSuccess> createState() => _DetailedRecipeScreenSuccessState();
}

class _DetailedRecipeScreenSuccessState extends State<DetailedRecipeScreenSuccess> {
  late RefreshController _refreshController;

  late final MealCubit mealCubit;

  List<bool?> checkCookingSteps = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<String> comment = [];
  final fieldText = TextEditingController();

  void clearText() => fieldText.clear();

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
    Meals? meal = context.watch<MealCubit>().state.meals;
    // List<String> ingredients = mealCubit.getIngredients(meal);
    // List<String> measure = mealCubit.getMeasure(meal);
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 17, right: 17, top: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      meal!.name,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                         setState(() {
                           meal.like = true;
                         });
                        mealCubit.saveLikeMeal(meal);
                      },
                      icon: meal.like == true
                          ? Image.asset(
                              'assets/svg/like.png',
                              color: Colors.red,
                            )
                          : Image.asset('assets/svg/like.png'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: Image.asset(
                        'assets/svg/clock.png',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Text(
                      '${meal!.duration} ${AppStrings.min}',
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
                  child: Image.network(
                    meal.photo!,
                    fit: BoxFit.fitWidth,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return Image.asset('assets/svg/internet.png');
                    },
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Text(
                  'Ингридиенты',
                  style: TextStyle(color: greenColor2, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 18,
                ),
                // Container(
                //   padding: const EdgeInsets.only(
                //       left: 8, right: 8, top: 15, bottom: 18),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(5),
                //     border: Border.all(
                //       color: greyColors,
                //       width: 3,
                //     ),
                //   ),
                //   child: Column(children: getIngredients(ingredients, measure)),
                // ),
                const SizedBox(
                  height: 22,
                ),
                Text(
                  'Шаги приготовления',
                  style: TextStyle(color: greenColor2, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 18,
                ),
                Column(
                  children: getCookingSteps(),
                ),
                const SizedBox(
                  height: 23,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: greenColor2),
                    width: 232,
                    height: 48,
                    child: const Center(
                        child: Text(
                      'Начать готовить',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                comment.isNotEmpty
                    ? Column(
                        children: getComment(comment),
                      )
                    : const SizedBox(
                        height: 32,
                      ),
                TextField(
                  controller: fieldText,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greenColor2, width: 2.0),
                      ),
                      suffixIcon: Image.asset('assets/svg/icon_img.png'),
                      labelText: 'оставить комментарий',
                      labelStyle: TextStyle(color: grey2Colors),
                      suffixStyle: const TextStyle(color: Colors.green)),
                  onSubmitted: (text) {
                    setState(() {
                      clearText();
                      comment.add(text);
                    });
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
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
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
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

  List<Widget> getCookingSteps() {
    List<Widget> result = [];
    for (int index = 0; index < checkCookingSteps.length; index++) {
      result.add(
        Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: checkCookingSteps[index] == true ? greenColor3 : backgroundColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(
                          color: checkCookingSteps[index] == true ? greenColor : grey2Colors,
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
                      style: TextStyle(fontSize: 12, color: greyColors),
                      maxLines: 6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            activeColor: greenColor2,
                            value: checkCookingSteps[index],
                            onChanged: (bool? valueResult) {
                              setState(() {
                                checkCookingSteps[index] = valueResult;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Text(
                          '01:00',
                          style: TextStyle(
                              color: checkCookingSteps[index] == true ? greenColor2 : greyColors, fontSize: 13),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    }

    return result;
  }

  List<Widget> getComment(List<String> comment) {
    List<Widget> result = [];

    for (int index = 0; index < comment.length; index++) {
      result.add(
        Column(
          children: [
            Row(
              children: [
                Image.asset('assets/svg/ellipse.png'),
                const SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "anna_obraztsova",
                            style: TextStyle(color: greenColor, fontSize: 16),
                          ),
                          Text(
                            getFormatDate(),
                            style: TextStyle(color: grey2Colors),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(comment[index]),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            )
          ],
        ),
      );
    }

    return result;
  }

  String getFormatDate() {
    var outputFormat = DateFormat('dd.MM.yyyy');
    return outputFormat.format(DateTime.now()).toString();
  }
}
