import 'package:book_culinary/helpers/constants/app_string.dart';
import 'package:book_culinary/helpers/constants/constant_colors.dart';
import 'package:book_culinary/view/section/detailed_recipe/cubit/detailed_recipe_cubit.dart';
import 'package:book_culinary/view/section/favorites/cubit/favorites_cubit.dart';
import 'package:book_culinary/view/section/favorites/favorites_screen.dart';
import 'package:book_culinary/view/section/home_screen/cubit/meals_cubit.dart';
import 'package:book_culinary/view/section/home_screen/cubit/meals_state.dart';
import 'package:book_culinary/view/section/home_screen/states/home_screen_error.dart';
import 'package:book_culinary/view/section/home_screen/states/home_screen_loading.dart';
import 'package:book_culinary/view/section/home_screen/states/home_screen_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final MealsCubit _mealsCubit;
  late final MealCubit _mealCubit;

  @override
  void initState() {
    _mealsCubit = context.read();
    _mealCubit = context.read();
    _mealCubit.fetchAllIngredients();
    _mealCubit.fetchAllRecipeStep();
    _mealCubit.fetchIngredients();
    _mealCubit.fetchMeasureUnit();
    _mealsCubit.fetchAllMeals();
    super.initState();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            backgroundColor: backgroundColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: greenColor,
            unselectedItemColor: Colors.grey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/svg/pizza2.png'),
                ),
                label: AppStrings.recipes,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/svg/fridge.png'),
                ),
                label: AppStrings.fridge,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/svg/favorites.png'),
                ),
                label: AppStrings.favorites,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/svg/profile.png'),
                ),
                label: AppStrings.profile,
              ),
            ],
            onTap: (int tappedIndex) {
              _onItemTapped(tappedIndex);
            }),
        body: Padding(
          padding: const EdgeInsets.only(top: 45),
          child: <Widget>[
            BlocConsumer<MealsCubit, MealsState>(
              bloc: _mealsCubit,
              builder: (context, state) {
                return Column(
                  children: [
                    state.status.when(
                        loading: () => const HomeScreenLoading(),
                        error: (error) => const HomeScreenError(),
                        success: () => const HomeScreenSuccess()),
                  ],
                );
              },
              listener: (context, state) {
                if (state.error != null) {}
              },
            ),
            const Text(AppStrings.fridge),
            const FavoritesScreen(),
            const Text(AppStrings.profile),
          ][_selectedIndex],
        ),
      ),
    );
  }
}
