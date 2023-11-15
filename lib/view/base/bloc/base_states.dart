import 'package:book_culinary/core/error/app_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_states.freezed.dart';

@freezed
class BaseCubitState with _$BaseCubitState {
  const factory BaseCubitState.idle() = BaseCubitStateIdle;
  const factory BaseCubitState.loading() = BaseCubitStateLoading;
  const factory BaseCubitState.error(AppError error) = BaseCubitStateError;
  const factory BaseCubitState.success({
    required bool has
    InternetConnection,
  }) = StoresStateSuccess;
}
