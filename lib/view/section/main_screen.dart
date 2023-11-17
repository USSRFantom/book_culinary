import 'package:book_culinary/helpers/constants/constant_colors.dart';
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

  @override
  void initState() {
    _mealsCubit = context.read();
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
    return Scaffold(
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
              label: 'Рецепты',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/svg/fridge.png'),
              ),
              label: 'Холодильник',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/svg/favorites.png'),
              ),
              label: 'Избранное',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/svg/profile.png'),
              ),
              label: 'Профиль',
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
          Text('Холодильник'),
          Text('Избранное'),
          Text('Профиль'),
        ][_selectedIndex],
      ),
    );
  }
}
