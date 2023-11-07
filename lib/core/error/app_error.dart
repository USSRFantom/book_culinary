import 'package:equatable/equatable.dart';

abstract class AppError implements Equatable{
  final String? message;
  final String? stackTrace;
  const AppError(this.message, [this.stackTrace]);

  @override
  String toString() {
    return '[-->App error\ntype: ${runtimeType.toString()}\nmessage: $message\nstackTrace: $stackTrace\n<--]';
  }

  @override
  List<Object?> get props => [message, stackTrace];

  @override
  bool? get stringify => false;
}

class ServerError extends AppError {
  ServerError([String? message]) : super(message);
}

class NetworkError extends AppError {
  NetworkError(String? message) : super(message);
}

class InternetConnectionError extends AppError {
  InternetConnectionError([String? message]) : super(message);
}

class UnathorizedError extends AppError {
  UnathorizedError(String? message) : super(message);
}

class InternalError extends AppError {
  InternalError(String? message, [String? stackTrace])
      : super(message, stackTrace);
}

class LocalStorageError extends AppError {
  LocalStorageError(String? message) : super(message);
}

class ValidationError extends AppError {
  ValidationError(String? message) : super(message);
}

class ApiError extends AppError {
  ApiError(String? message) : super(message);
}

class ObjectNotFoundError extends AppError {
  ObjectNotFoundError([String? message]) : super(message);
}

class ServiceNotAvailableError extends AppError {
  ServiceNotAvailableError([String? message]) : super(message);
}
