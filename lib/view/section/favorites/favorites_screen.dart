import 'package:book_culinary/view/section/favorites/cubit/favorites_cubit.dart';
import 'package:book_culinary/view/section/favorites/cubit/favorites_state.dart';
import 'package:book_culinary/view/section/favorites/state/favorites_screen_error.dart';
import 'package:book_culinary/view/section/favorites/state/favorites_screen_loading.dart';
import 'package:book_culinary/view/section/favorites/state/favorites_screen_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late final FavoritesCubit _favoritesCubit;

  @override
  void initState() {
    _favoritesCubit = context.read();
    _favoritesCubit.fetchAllFavoritesMeals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      bloc: _favoritesCubit,
      builder: (context, state) {
        return Column(
          children: [
            state.status.when(
                loading: () => const FavoritesScreenLoading(),
                error: (error) => const FavoritesScreenError(),
                success: () => const FavoritesScreenSuccess()),
          ],
        );
      },
      listener: (context, state) {
        if (state.error != null) {}
      },
    );
  }
}
