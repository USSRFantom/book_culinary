import 'package:book_culinary/view/base/bloc/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class BaseScreenCubit extends Cubit<BaseCubitState> {
  BaseScreenCubit() : super(const BaseCubitState.idle()) {
    InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          emit(const BaseCubitState.success(hasInternetConnection: true));
          break;
        case InternetConnectionStatus.disconnected:
          emit(const BaseCubitState.success(hasInternetConnection: false));
          break;
      }
    });
  }
}
