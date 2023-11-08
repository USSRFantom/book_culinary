import 'package:book_culinary/data/repositories/meats/meals_repository.dart';
import 'package:book_culinary/domain/models/meals.dart';
import 'package:book_culinary/view/base/bloc/state_status.dart';
import 'package:book_culinary/view/section/home_screen/cubit/meals_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsCubit extends Cubit<MealsState> {
  final MealsRepository _mealsRepository;

  MealsCubit(
    this._mealsRepository,
  ) : super(const MealsState());

  final List<Meals> _allMeals = [];
  int _page = 1;
  String _searchQuery = 'c';

  Future<void> fetchAllMeals() async {
    emit(state.copyWith(error: null));
    if (_page == 1) {
      emit(state.copyWith(status: const StateStatus.loading()));
      _allMeals.clear();
      final dataResponse = await _mealsRepository.fetchMeals(
        _page,
        {
          "f": _searchQuery.isNotEmpty
              ? _searchQuery.trim().toLowerCase()
              : null,
        },
      );
      dataResponse.when(
        data: (data) {
          emit(
            state.copyWith(
              status: const StateStatus.success(),
              meals: data,
            ),
          );
          if (data.isNotEmpty) {
            _page++;
            _allMeals.addAll(data);
          }
        },
        error: (error) {
          emit(
            state.copyWith(status: StateStatus.error(error), error: error),
          );
        },
      );
    } else {
      final dataResponse = await _mealsRepository.fetchMeals(
        _page,
        {
          "f": _searchQuery.isNotEmpty
              ? _searchQuery.trim().toLowerCase()
              : null,
        },
      );

      dataResponse.when(
        data: (data) {
          if (data.isNotEmpty) {
            List<Meals> loadedMeals = List.from(_allMeals);
            loadedMeals.addAll(data);
            emit(
              state.copyWith(
                meals: loadedMeals,
              ),
            );
            _page++;
            _allMeals.addAll(data);
          } else {
            emit(
              state.copyWith(allPagesLoaded: true),
            );
          }
        },
        error: (error) {
          emit(state.copyWith(error: error));
        },
      );
    }
  }
}
