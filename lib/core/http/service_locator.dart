import 'package:get_it/get_it.dart';

extension SafeGetIt on GetIt {
  T? getIfRegistered<T extends Object>({
    Object? instance,
    String? instanceName,
  }) =>
      isRegistered<T>(instanceName: instanceName, instance: instance)
          ? get<T>(instanceName: instanceName)
          : null;
}

T getIt<T extends Object>() {
  return GetIt.instance.get<T>();
}
