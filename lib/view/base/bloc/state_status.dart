import 'package:book_culinary/core/error/app_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_status.freezed.dart';

@freezed
class StateStatus with _$StateStatus {
  const factory StateStatus.loading() = StateStatusLoading;
  const factory StateStatus.error([AppError? error]) = StateStatusError;
  const factory StateStatus.success() = StateStatusSuccess;
}
