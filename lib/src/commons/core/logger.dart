import 'package:simple_id/src/commons/config/app_config.dart';

class Logger {

  static final Logger _instance = Logger._internal();

  Logger._internal();

  factory Logger() {
    return _instance;
  }

  void log(final Object message) {
    // ignore: avoid_print
    (AppConfig.get().isDebugMode ?? false) ? print('$message') : null;
  }
}

final Logger logger = Logger();