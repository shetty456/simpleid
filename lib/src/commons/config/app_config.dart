import 'dart:convert';

import 'package:flutter/services.dart';

class AppConfig {
  Environment? env;
  String? baseApiUrl;
  bool? isDebugMode = true;
  final String getTransactionUrl = '/v1/transaction';
  final String executeActionUrl = '/v1/transaction/workflow/execute';
  final String getTransactionStatusUrl = '/v1/transaction/workflow/status';


  static final AppConfig _instance = AppConfig._internal();

  AppConfig._internal();

  static AppConfig get() {
    return _instance;
  }

  void load(dynamic jsonMap) {
    env = Environment.from(jsonMap['env'] ?? '');
    baseApiUrl = jsonMap['baseApiUrl'];
    isDebugMode = jsonMap['isDebugMode'];
  }

  static Future<void> initialize() async {
    final Map<String, dynamic> defaultMap =
        jsonDecode(await rootBundle.loadString('config/config-default.json'));

    const String env = String.fromEnvironment('env', defaultValue: 'test');
    final Map<String, dynamic> envMap =
        jsonDecode(await rootBundle.loadString('config/config-$env.json'));
    defaultMap.addAll(envMap);
    AppConfig.get().load(defaultMap);
  }
}

enum Environment {
  test,
  prod;

  static Environment from(String env) {
    switch (env.toLowerCase()) {
      case 'prod':
        return Environment.prod;
      default:
        return Environment.test;
    }
  }
}
