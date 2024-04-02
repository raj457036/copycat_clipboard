import 'package:dartz/dartz.dart';

class Failure {
  final String message;
  final String code;

  Failure({
    required this.message,
    required this.code,
  });
}

typedef FailureOr<T> = Future<Either<Failure, T>>;
