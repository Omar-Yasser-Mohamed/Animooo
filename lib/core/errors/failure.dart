import 'failure_code.dart';

abstract class Failure {
  final String message;
  final FailureCode failureCode;

  const Failure({required this.message, required this.failureCode});
}

class AppFailure extends Failure {
  const AppFailure({required super.message, required super.failureCode});
}
