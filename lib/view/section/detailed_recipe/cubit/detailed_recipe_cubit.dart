import 'package:book_culinary/data/repositories/meal/meal_repository.dart';
import 'package:book_culinary/domain/models/meal.dart';
import 'package:book_culinary/view/base/bloc/state_status.dart';
import 'package:book_culinary/view/section/detailed_recipe/cubit/detailed_recipe_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealCubit extends Cubit<MealState> {
  final MealRepository _mealRepository;

  MealCubit(
    this._mealRepository,
  ) : super(const MealState());

  late Meal meal;

  Future<void> fetchAllMeal(int idMeal) async {
    emit(state.copyWith(error: null, status: const StateStatus.loading()));
    final dataResponse = await _mealRepository.fetchMeal(idMeal: idMeal);
    dataResponse.when(
      data: (data) {
        emit(
          state.copyWith(
            status: const StateStatus.success(),
            meals: data,
          ),
        );
      },
      error: (error) {
        print('12312312');
        print(error);
        emit(
          state.copyWith(status: StateStatus.error(error), error: error),
        );
      },
    );
  }
}
