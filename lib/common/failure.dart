import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:universal_io/io.dart';

class Failure {
  final String message;
  final String code;

  const Failure({required this.message, required this.code});

  factory Failure.fromMessage(String message) {
    return Failure(message: message, code: "common-failure");
  }

  factory Failure.fromException(dynamic e) {
    if (e is Failure) return e;
    if (e is SocketException) return noInternetConnectionFailure;
    if (e is FunctionException) {
      return Failure(
        message: e.reasonPhrase ?? "Function error",
        code: e.status.toString(),
      );
    }
    try {
      return Failure(message: e.message, code: e.runtimeType.toString());
    } catch (e) {
      return Failure(message: e.toString(), code: e.runtimeType.toString());
    }
  }

  @override
  String toString() {
    return "An error occurred: $message (code: $code)";
  }
}

const noInternetConnectionFailure = Failure(
  message: 'No internet connection',
  code: 'no_internet',
);

const authFailure = Failure(message: 'Not logged in', code: 'not_logged_in');

const driveFailure = Failure(
  message: 'Google Drive is not available.',
  code: 'gdrive_not_available',
);

const encryptionUnavailableFailure = Failure(
  message:
      'Encryption is enabled but not ready, so clips were not synced. Please check your encryption setup.',
  code: 'encryption-unavailable',
);

Failure frequentSyncing(int seconds) {
  return Failure(
    message: 'Too frequent request. Try after $seconds seconds',
    code: 'frequent-sync-request',
  );
}

const pasteStackOverlimit = Failure(
  message:
      'Paste stack is already full. Please remove some items before adding new ones.',
  code: 'paste-stack-overlimit',
);

typedef FailureOr<T> = Future<Either<Failure, T>>;
