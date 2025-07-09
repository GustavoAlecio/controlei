import 'dart:io';
import 'dart:async';

import 'package:dependencies/dependencies.dart';

part 'custom_failure.freezed.dart';

@freezedNoHelpers
sealed class Failure with _$Failure {
  const factory Failure.app({
    required String message,
    StackTrace? stackTrace,
  }) = AppFailure;

  const factory Failure.network({
    required String message,
    StackTrace? stackTrace,
  }) = NetworkFailure;

  const factory Failure.unknown({
    required String message,
    StackTrace? stackTrace,
  }) = UnknownFailure;

  static Failure fromException(Object error, [StackTrace? stackTrace]) {
    if (error is TimeoutException) {
      return Failure.network(
        message: 'Response time exceeded.',
        stackTrace: stackTrace,
      );
    }

    if (error is SocketException) {
      return Failure.network(
        message: 'Internet connection problem.',
        stackTrace: stackTrace,
      );
    }

    if (error is FormatException) {
      return Failure.app(
        message: 'Error when processing data.',
        stackTrace: stackTrace,
      );
    }

    return Failure.unknown(
      message: 'Unexpected Error: ${error.toString()}',
      stackTrace: stackTrace,
    );
  }
}
