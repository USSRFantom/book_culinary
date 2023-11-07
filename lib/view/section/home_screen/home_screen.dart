import 'package:book_culinary/view/section/home_screen/cubit/meals_cubit.dart';
import 'package:book_culinary/view/section/home_screen/cubit/meals_state.dart';
import 'package:book_culinary/view/section/home_screen/states/home_screen_error.dart';
import 'package:book_culinary/view/section/home_screen/states/home_screen_loading.dart';
import 'package:book_culinary/view/section/home_screen/states/home_screen_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final MealsCubit _mealsCubit;

  @override
  void initState() {
    _mealsCubit = context.read();
    _mealsCubit.fetchAllMeals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 45),
        child: BlocConsumer<MealsCubit, MealsState>(
          bloc: _mealsCubit,
          builder: (context, state) {
            print(state);
            return state.status.when(
                loading: () => const HomeScreenLoading(),
                error: (error) => const HomeScreenError(),
                success: () => const HomeScreenSuccess());
          },
          listener: (context, state) {
            if (state.error != null) {}
          },
          //children: _listWidgetRecipe(listModelRecipe),
        ),
      ),
    );
  }
}
