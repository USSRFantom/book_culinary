import 'dart:io';
import 'dart:io' as dart_http;

import 'package:book_culinary/core/error/app_error.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:dio/dio.dart';

Type typeOf<T>() => T;

class IgnoreCertificateErrorOverrides extends HttpOverrides {
  @override
  dart_http.HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) {
        return true;
      });
  }
}

Map<String, dynamic>? filterQueryParameters(Map<String, dynamic>? params) {
  final filtered = <String, dynamic>{};
  params?.forEach((k, v) {
    if (v != null) {
      filtered[k] = v;
    }
  });

  if (filtered.isNotEmpty) {
    return filtered;
  } else {
    return null;
  }
}

DataResponse<T> handleResponseRaw<T>(
  Response response,
) {
  try {
    final responseData = response.data;

    if (responseData is Map) {
      if (responseData['data'] != null) {
        return DataResponse.data(responseData['data']);
      }
    }

    return DataResponse.data(responseData);
  } catch (e, st) {
    return DataResponse.error(InternalError(e.toString(), st.toString()));
  }
}

DataResponse<T> handleResponse<T>(
  Response response,
  T Function(Map<String, dynamic>)? mapper,
) {
  final responseData = response.data;

  try {
    if (typeOf<void>() == T || mapper == null) {
      if (responseData is Map &&
          responseData['success'] != null &&
          responseData['success'] == false) {
        // return DataResponse.error(ServerError(responseData.toString()));
        return DataResponse.error(
            ApiError(responseData['message'] ?? responseData.toString()));
      } else {
        return DataResponse.data(responseData);
      }
    }
    if (responseData['data'] != null) {
      return DataResponse.data(mapper(responseData['data']));
    }
    if (responseData['error'] != null) {
      return DataResponse.error(ServerError(responseData['error']));
    }
    if (responseData['success'] != null && responseData['success'] == false) {
      return DataResponse.error(ServerError(responseData.data));
    }
    return DataResponse.data(mapper(responseData));
  } catch (e, st) {
    return DataResponse.error(InternalError(e.toString(), st.toString()));
  }
}

DataResponse<List<T>> handleListResponse<T>(
  Response response,
  T Function(Map<String, dynamic>)? mapper,
) {
  final responseData = response.data;
  try {
    if (mapper == null) {
      if (responseData is Map) {
        if (responseData['meals'] != null) {
          final rawList = (responseData['meals'] as List<dynamic>);
          final data = (rawList.map((item) => item as T).toList());
          return DataResponse.data(data);
        }
      }
    }

    if (responseData is List && responseData.isNotEmpty) {
      final data = (responseData[0].map((item) => mapper!(item)).toList());
      return DataResponse.data(data);
    }
    if (responseData['meals'] != null) {
      final rawList = (responseData['meals'] as List<dynamic>);
      final data = (rawList.map((item) => mapper!(item)).toList());
      return DataResponse.data(data);
    }
    if (responseData['error'] != null) {
      return DataResponse.error(ServerError(responseData['error']));
    }
    final rawList = (responseData as List<dynamic>);
    final data = (rawList.map((item) => mapper!(item)).toList());
    return DataResponse.data(data);
  } catch (e, st) {
    return DataResponse.error(InternalError(e.toString(), st.toString()));
  }
}

Future<DataResponse<T>> handleException<T>(Exception e,
    [bool first = true]) async {
  if (e.runtimeType is! SocketException && first) {
    if ((e as DioException).response?.statusCode == 401 ||
        e.response?.statusCode == 403 ||
        e.response?.statusCode == 404) {
      return handleException(e, false);
    }
  }

  switch (e.runtimeType) {
    case DioException:
      if ((e as DioException).response?.statusCode == 401 ||
          e.response?.statusCode == 403) {
        return DataResponse.error(UnathorizedError(e.toString()));
      } else if (e.error is SocketException) {
        return DataResponse.error(InternetConnectionError(e.toString()));
      } else if (e.response?.statusCode == 500) {
        return DataResponse.error(ServerError(e.toString()));
      } else if (e.response?.statusCode == 410) {
        return DataResponse.error(ObjectNotFoundError(e.toString()));
      } else {
        return DataResponse.error(NetworkError(e.toString()));
      }
    default:
      return DataResponse.error(InternalError(e.toString()));
  }
}
