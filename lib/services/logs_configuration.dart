import 'dart:async';

import 'package:f_logs/f_logs.dart';

class LogsConfiguration {
  Future<LogsDatabase> get database async => await LogsDatabase.instance;

  LogConfig _config = LogConfig();

  // Singleton instance
  static final LogsConfiguration _singleton = LogsConfiguration._();

  /// Singleton accessor
  static LogsConfiguration get instance => _singleton;

  LogsConfiguration._();

  LogConfig get config => _config;

  applyConfig(LogConfig config) {
    if (_config.encryption.isNotEmpty && _config.encryptionKey.isEmpty) {
      throw Exception(Constants.EXCEPTION_NULL_KEY);
    }
    _config = config;
  }
}
