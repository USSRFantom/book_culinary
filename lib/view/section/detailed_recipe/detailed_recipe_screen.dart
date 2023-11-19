import 'package:book_culinary/helpers/constants/constant_colors.dart';
import 'package:book_culinary/view/section/detailed_recipe/cubit/detailed_recipe_cubit.dart';
import 'package:book_culinary/view/section/detailed_recipe/cubit/detailed_recipe_state.dart';
import 'package:book_culinary/view/section/detailed_recipe/states/detailed_recipe_error.dart';
import 'package:book_culinary/view/section/detailed_recipe/states/detailed_recipe_loading.dart';
import 'package:book_culinary/view/section/detailed_recipe/states/detailed_recipe_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailedRecipeScreen extends StatefulWidget {
  final String nameMeal;

  const DetailedRecipeScreen(this.nameMeal, {Key? key}) : super(key: key);

  @override
  State<DetailedRecipeScreen> createState() => _DetailedRecipeScreenState();
}

class _DetailedRecipeScreenState extends State<DetailedRecipeScreen> {
  late final MealCubit mealCubit;

  @override
  void initState() {
    mealCubit = context.read();
    mealCubit.fetchAllMeal(widget.nameMeal);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Рецепт',
            style: TextStyle(color: greenColor2, fontSize: 20),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Image(
              image: AssetImage(
                'assets/svg/megafon.png',
              ),
            ),
          ),
        ],
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Image(
            image: AssetImage(
              'assets/svg/back.png',
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<MealCubit, MealState>(
        bloc: mealCubit,
        builder: (context, state) {
          return Column(
            children: [
              state.status.when(
                  loading: () => const DetailedRecipeScreenLoading(),
                  error: (error) => DetailedRecipeScreenError(
                        nameMeal: widget.nameMeal,
                      ),
                  success: () => const DetailedRecipeScreenSuccess()),
            ],
          );
        },
        listener: (context, state) {
          if (state.error != null) {}
        },
      ),
    );
  }
}
