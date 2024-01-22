import 'package:book_culinary/domain/models/comment.dart';
import 'package:book_culinary/domain/models/ingredients.dart';
import 'package:book_culinary/domain/models/meals.dart';
import 'package:book_culinary/domain/models/measure_ingredient.dart';
import 'package:book_culinary/domain/models/recipe_ingredient.dart';
import 'package:book_culinary/domain/models/recipe_step.dart';
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
    List<Ingredients> ingredients = context.watch<MealCubit>().state.ingredients;
    List<RecipeIngredients> recipeIngredients = context.watch<MealCubit>().state.recipeIngredients;
    List<MeasureIngredient> measureIngredient = context.watch<MealCubit>().state.measureIngredient;
    List<RecipeStep> step = context.watch<MealCubit>().state.step;
    List<Comment> comments = context.watch<MealCubit>().state.comments;
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
                      meal != null? meal.name :"",
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          meal!.like = true;
                        });
                        mealCubit.saveLikeMeal(meal!);
                      },
                      icon: meal != null? meal.like == true
                          ? Image.asset(
                              'assets/svg/like.png',
                              color: Colors.red,
                            )
                          : Image.asset('assets/svg/like.png'): Image.asset('assets/svg/like.png'),
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
                      meal != null? '${meal.duration} ${AppStrings.min}':'',
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
                  child: meal != null? Image.network(
                    meal.photo,
                    fit: BoxFit.fitWidth,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return Image.asset('assets/svg/internet.png');
                    },
                  ): const SizedBox(),
                ),
                const SizedBox(
                  height: 22,
                ),
                Text(
                  AppStrings.ingredients,
                  style: TextStyle(color: greenColor2, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: greyColors,
                      width: 3,
                    ),
                  ),
                  child: Column(children: getIngredients(ingredients, recipeIngredients, meal != null? meal.id: 0, measureIngredient)),
                ),
                const SizedBox(
                  height: 22,
                ),
                Text(
                  AppStrings.step,
                  style: TextStyle(color: greenColor2, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 18,
                ),
                Column(
                  children: getCookingSteps(step),
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
                      AppStrings.startCooking,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                comments.isNotEmpty
                    ? Column(
                        children: getComment(comments),
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
                      labelText: AppStrings.addComment,
                      labelStyle: TextStyle(color: grey2Colors),
                      suffixStyle: const TextStyle(color: Colors.green)),
                  onSubmitted: (text) {
                    setState(() {
                      clearText();
                      //comment.add(text);
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

  List<String> getMeasure(List<int> idIngredient, List<int> count, List<MeasureIngredient> measureIngredient)
  {
    List<String> measureResult = [];
    for(var index = 0; index < idIngredient.length; index++){
      for (var element in measureIngredient) {
        if (idIngredient[index] == element.id){
          if (count[index] <= 1 ){
            measureResult.add(element.one);
          }
          if (count[index] >= 1 && count[index] <= 4){
            measureResult.add(element.few);
          }
          if (count[index] > 5 ){
            measureResult.add(element.many);
          }
        }
      }
    }
    return measureResult;
  }


  List<Widget> getIngredients(List<Ingredients> ingredients, List<RecipeIngredients> recipeIngredients, int id,
      List<MeasureIngredient> measureIngredient) {
    List<Widget> result = [];
    List<int> idIngredient = [];
    List<int> count = [];
    List<String> measureResult = [];
    List<String> nameIngredient = [];
    List<int> idIngredientMeasure = [];
    for (var element in recipeIngredients) {
      if (element.recipe.id == id) {
        idIngredient.add(element.ingredient.id);
        count.add(element.count);
      }
    }


    for (var index = 0; index < ingredients.length; index++){
      for(var index2 = 0; index2 < idIngredient.length; index2++){

        if (ingredients[index].id == idIngredient[index2]){
          nameIngredient.add(ingredients[index].name);
          idIngredientMeasure.add(ingredients[index].measureUnit.id);

        }
      }
    }

    measureResult = getMeasure(idIngredientMeasure, count, measureIngredient);

    for (var index = 0; index < nameIngredient.length; index++) {
      result.add(
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nameIngredient[index],
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  "${count[index]} ${measureResult[index]}",
                  style: TextStyle(fontSize: 13, color: greyColors),
                ),
              ],
            ),
            const SizedBox(height: 17),
          ],
        ),
      );
    }

    return result;
  }

  List<Widget> getCookingSteps(List<RecipeStep> step) {
    List<Widget> result = [];
    for (int index = 0; index < step.length; index++) {
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
                      step[index].name,
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
                          "${step[index].duration} мин.",
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

  List<Widget> getComment(List<Comment> comment) {
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
                            getFormatDate(comment[index].datetime),
                            style: TextStyle(color: grey2Colors),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(comment[index].text),
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

  String getFormatDate(String date) {
    var outputFormat = DateFormat('dd.MM.yyyy');
    var parsedDate = DateTime.parse(date);
    return outputFormat.format(parsedDate).toString();
  }
}
