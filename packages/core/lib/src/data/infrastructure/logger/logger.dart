import 'package:dependencies/dependencies.dart';

typedef LogHandler = void Function(
  dynamic message, {
  dynamic error,
  StackTrace? stackTrace,
});

abstract interface class ILoggerService {
  void debug(LogHandler handler);
  void info(LogHandler handler);
  void warning(LogHandler handler);
  void error(LogHandler handler);
  void trace(LogHandler handler);
}

class LoggerService implements ILoggerService {
  LoggerService._internal({LogHandler? customHandler})
      : _customHandler = customHandler;

  static LoggerService? _instance;

  factory LoggerService({LogHandler? customHandler}) {
    _instance ??= LoggerService._internal(customHandler: customHandler);
    return _instance!;
  }

  final LogHandler? _customHandler;

  final Logger _logger = Logger(
    level: Level.debug,
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 120,
      colors: true,
      printEmojis: true,
    ),
  );

  void _log(
    void Function(dynamic message, {dynamic error, StackTrace? stackTrace}) fn,
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _customHandler?.call(message, error: error, stackTrace: stackTrace);
    fn(message, error: error, stackTrace: stackTrace);
  }

  @override
  void debug(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _log(_logger.d, message, error: error, stackTrace: stackTrace);
  }

  @override
  void info(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _log(_logger.i, message, error: error, stackTrace: stackTrace);
  }

  @override
  void warning(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _log(_logger.w, message, error: error, stackTrace: stackTrace);
  }

  @override
  void error(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _log(_logger.e, message, error: error, stackTrace: stackTrace);
  }

  @override
  void trace(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _log(_logger.t, message, error: error, stackTrace: stackTrace);
  }
}
