import 'package:book_culinary/domain/models/meals.dart';
import 'package:book_culinary/view/section/%20detailed_recipe/detailed_recipe_screen.dart';
import 'package:book_culinary/view/section/home_screen/cubit/meals_cubit.dart';
import 'package:book_culinary/view/section/home_screen/widgets/card_recipe.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreenSuccess extends StatefulWidget {
  const HomeScreenSuccess({super.key});

  @override
  State<HomeScreenSuccess> createState() => _HomeScreenSuccessState();
}

class _HomeScreenSuccessState extends State<HomeScreenSuccess> {
  late RefreshController _refreshController;
  late final MealsCubit _cubit;

  @override
  void initState() {
    _refreshController = RefreshController();
    _cubit = context.read();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Meals> meals = context.watch<MealsCubit>().state.meals;

    return NotificationListener<ScrollNotification>(
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
      child: SmartRefresher(
        header: const ClassicHeader(
          releaseText: '',
          refreshingText: '',
          idleText: '',
          completeText: '',
        ),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            if (mode == LoadStatus.loading) {
              return Container(
                alignment: Alignment.center,
                height: 56,
                child: const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
        controller: _refreshController,
        onRefresh: () {
          _cubit
              .fetchAllMeals()
              .whenComplete(_refreshController.refreshCompleted);
        },

        // child: stores.isEmpty
        //     ? const EmptyDataWidget(
        //         text: AppStrings.storesScreenStoresListEmptyTitle)
        //     :
        child: Expanded(
          child: ListView.separated(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailedRecipeScreen()),
                      );
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
      ),
    );
  }
}
