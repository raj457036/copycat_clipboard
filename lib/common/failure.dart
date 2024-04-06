import 'package:dartz/dartz.dart';

class Failure {
  final String message;
  final String code;

  Failure({
    required this.message,
    required this.code,
  });

  factory Failure.fromException(Object e) {
    return Failure(
      message: e.toString(),
      code: e.runtimeType.toString(),
    );
  }
}

typedef FailureOr<T> = Future<Either<Failure, T>>;
