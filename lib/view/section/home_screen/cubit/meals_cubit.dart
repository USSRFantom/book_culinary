import 'package:book_culinary/data/repositories/meals/meals_repository.dart';
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

  String searchQuery(int page) {
    switch (_page) {
      case 1:
        return "a";
      case 2:
        return "b";
      case 3:
        return "c";
      case 4:
        return "d";
      case 5:
        return "e";
      case 6:
        return "f";
      case 7:
        return "g";
      case 8:
        return "h";
      case 9:
        return "i";
      case 10:
        return "j";
      case 11:
        return "k";
      case 12:
        return "l";
      case 13:
        return "m";
      case 14:
        return "n";
      case 15:
        return "o";
      case 16:
        return "p";
      case 17:
        return "q";
      case 18:
        return "r";
      case 19:
        return "s";
      case 20:
        return "t";
      case 21:
        return "u";
      case 22:
        return "v";
      case 23:
        return "w";
      case 24:
        return "x";
      case 25:
        return "y";
      case 26:
        return "z";
      default:
        return '';
    }
  }

  void setPageAllToStart() {
    _page = 1;
  }

  Future<void> fetchAllMeals() async {
    emit(state.copyWith(error: null));
    if (_page == 1) {
      emit(state.copyWith(status: const StateStatus.loading()));
      _allMeals.clear();
      final dataResponse = await _mealsRepository.fetchMeals(
        _page,
        {
          "f": searchQuery(_page).isNotEmpty ? searchQuery(_page) : null,
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
          "f": searchQuery(_page).isNotEmpty ? searchQuery(_page) : null,
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
