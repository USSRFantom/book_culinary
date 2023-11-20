import 'package:book_culinary/helpers/constants/app_string.dart';
import 'package:book_culinary/view/section/favorites/cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreenError extends StatelessWidget {
  const FavoritesScreenError({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 872,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              AppStrings.dataLoadingError,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            InkWell(
              onTap: () {
                context.read<FavoritesCubit>().fetchAllFavoritesMeals();
              },
              child: const Text(
                "Повторить",
              ),
            )
          ],
        ),
      ),
    );
  }
}
