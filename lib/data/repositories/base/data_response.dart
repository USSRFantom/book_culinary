import 'package:book_culinary/core/error/app_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
class DataResponse<T> with _$DataResponse<T> {
  const factory DataResponse.data(T data) = DataResponseData;
  const factory DataResponse.error(AppError error) = DataResponseError;
}
