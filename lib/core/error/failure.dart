import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class AuthorizationFailure extends Failure {}

class InternetServerFailure extends Failure {}

class FailureError1 extends Failure {}

class FailureError3 extends Failure {}

class FailureError4 extends Failure {}
