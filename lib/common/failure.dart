import 'package:dartz/dartz.dart';

class Failure {
  final String message;
  final String code;

  const Failure({
    required this.message,
    required this.code,
  });

  factory Failure.fromException(dynamic e) {
    if (e is Failure) return e;
    try {
      return Failure(
        message: e.message,
        code: e.runtimeType.toString(),
      );
    } catch (e) {
      return Failure(
        message: e.toString(),
        code: e.runtimeType.toString(),
      );
    }
  }

  @override
  String toString() {
    return 'Failure(message: $message, code: $code)';
  }
}

const noInternetConnectionFailure = Failure(
  message: 'No internet connection',
  code: 'no_internet',
);

const authFailure = Failure(
  message: 'Not logged in',
  code: 'not_logged_in',
);

const driveFailure = Failure(
  message: 'Google Drive is not available.',
  code: 'gdrive_not_available',
);

const frequentSyncing = Failure(
  message: 'Too frequent request.',
  code: 'frequent-sync-request',
);

typedef FailureOr<T> = Future<Either<Failure, T>>;
