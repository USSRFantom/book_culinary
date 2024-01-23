import 'package:book_culinary/core/error/app_error.dart';
import 'package:book_culinary/data/repositories/base/data_response.dart';
import 'package:book_culinary/helpers/constants/app_string.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class FetchData {
  static Future<DataResponse<T>> fromRemoteWithSaveElseLocal<T>({
    required Future<DataResponse<T>> Function() getFromRemote,
    required Future Function(T) saveToLocalStorage,
    required Future<DataResponse<T>> Function() getFromLocalStorage,
  }) async {
    final bool isConnected =
        kIsWeb ? true : await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      final remoteResponse = await getFromRemote();
      await remoteResponse.when(
        data: (data) async {
          await saveToLocalStorage(data);
        },
        error: (error) {},
      );
      return remoteResponse;
    } else {
      final localResponse = await getFromLocalStorage();
      return localResponse;
    }
  }

  static Future<DataResponse<T>> getRemoteElseLocal<T>({
    required Future<DataResponse<T>> Function() getFromRemote,
    required Future<DataResponse<T>> Function() getFromLocalStorage,
  }) async {
    final bool isConnected =
        kIsWeb ? true : await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      final remoteResponse = await getFromRemote();
      return remoteResponse;
    } else {
      final localResponse = await getFromLocalStorage();
      return localResponse;
    }
  }

  static Future<DataResponse<T>> fromRemoteWithSave<T>({
    required Future<DataResponse<T>> Function() getFromRemote,
    required Future Function(T) saveToLocalStorage,
  }) async {
    final remoteResponse = await getFromRemote();
    await remoteResponse.when(
      data: (data) async {
        await saveToLocalStorage(data);
      },
      error: (error) {},
    );
    return remoteResponse;
  }

  static Future<DataResponse<T>> fromRemoteThenLocal<T>({
    required Future<DataResponse<T>> Function() getFromRemote,
    required Future<T> Function() doFromLocalStorage,
  }) async {
    final remoteResponse = await getFromRemote();

    DataResponse<T>? result;

    await remoteResponse.when(
      data: (data) async {
        try {
          await doFromLocalStorage();
          result = DataResponse<T>.data(data);
        } catch (error) {
          result = DataResponse.error(LocalStorageError(error.toString()));
        }
      },
      error: (error) async {
        if (error is InternetConnectionError) {
          await doFromLocalStorage();
        }
        result = DataResponse.error(error);
      },
    );
    return result!;
  }

  static Future<DataResponse<T>> fromRemoteIfSuccessThenLocal<T>({
    required Future<DataResponse<T>> Function() getFromRemote,
    required Future<T> Function() doFromLocalStorage,
  }) async {
    final remoteResponse = await getFromRemote();

    DataResponse<T>? result;

    await remoteResponse.when(
      data: (data) async {
        try {
          await doFromLocalStorage();
          result = DataResponse<T>.data(data);
        } catch (error) {
          result = DataResponse.error(LocalStorageError(error.toString()));
        }
      },
      error: (error) async {
        result = DataResponse.error(error);
      },
    );
    return result!;
  }

  static Future<DataResponse<T>> fromRemote<T>({
    required Future<DataResponse<T>> Function() getFromRemote,
  }) async {
    final remoteResponse = await getFromRemote();
    return remoteResponse;
  }

  static Future<DataResponse<T>> fromLocal<T>({
    required Future<DataResponse<T>> Function() getFromLocalStorage,
  }) async {
    return await getFromLocalStorage();
  }

  static Future<DataResponse<T>> getFromBox<T>(String boxName) async {
    try {
      var box = await Hive.openBox<T>(boxName);
      T? value = box.values.firstOrNull;
      await box.close();
      if (value != null) {
        return DataResponse.data(value);
      } else {}
      return DataResponse.error(
        LocalStorageError(AppStrings.elemntNotFoundInBox),
      );
    } catch (e, st) {
      return DataResponse.error(
        LocalStorageError(st.toString()),
      );
    }
  }

  static Future<DataResponse<T>> getFromBoxByKey<T>(
      String boxName, String key) async {
    try {
      var box = await Hive.openBox<T>(boxName);
      T? value = box.get(key);
      await box.close();
      if (value != null) {
        return DataResponse.data(value);
      } else {
        return DataResponse.error(
          LocalStorageError(AppStrings.elemntNotFoundInBox),
        );
      }
    } catch (e, st) {
      return DataResponse.error(
        LocalStorageError(st.toString()),
      );
    }
  }

  static Future<DataResponse<List<T>>> getListFromBox<T>({
    required String boxName,
    int Function(T, T)? sortFunc,
    bool Function(T)? whereFunc,
    bool needToCloseBox = true,
  }) async {
    try {
      var box = await Hive.openBox<T>(boxName);
      List<T>? value = box.values.toList();
      if (sortFunc != null) {
        value.sort(sortFunc);
      }
      if (whereFunc != null) {
        value = value.where(whereFunc).toList();
      }
      if (needToCloseBox) {
        await box.close();
      }
      return DataResponse.data(value);
    } catch (e, st) {
      return DataResponse.error(
        LocalStorageError('${e.toString()}\n ${st.toString()}'),
      );
    }
  }

  static Future<DataResponse<void>> deleteFromHive<T>({
    required T object,
  }) async {
    try {
      await (object as HiveObject).delete();
      return const DataResponse.data(null);
    } catch (e, st) {
      return DataResponse.error(
        LocalStorageError('${e.toString()}\n ${st.toString()}'),
      );
    }
  }

  static Future<T?> getFromHiveLazy<T>(String id, String boxName) async {
    try {
      var box = await Hive.openBox<T>(boxName);
      final value = box.get(id);
      await box.close();
      if (value != null) {
        return value;
      } else {
        throw LocalStorageError(AppStrings.elemntNotFoundInBox);
      }
    } catch (e, st) {
      throw LocalStorageError('${e.toString()}\n ${st.toString()}');
    }
  }
}
