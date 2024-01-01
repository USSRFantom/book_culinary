import 'package:book_culinary/helpers/constants/app_string.dart';
import 'package:book_culinary/view/section/detailed_recipe/cubit/detailed_recipe_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailedRecipeScreenError extends StatelessWidget {
  final String nameMeal;
  const DetailedRecipeScreenError({super.key, required this.nameMeal});

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
              onTap: () => context.read<MealCubit>().fetchAllMeal(nameMeal),
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
