import 'package:flutter/foundation.dart';

class Env {
  late final String baseUrl;
  final String appVersion = '1.0.0+1';

  Env() {
    String devMode = 'dev';
    String env = kDebugMode == true ? devMode : 'prod';
    switch (env) {
      case 'local':
        baseUrl = 'http://localhost:3000';
        break;
      case 'dev':
        baseUrl = 'http://192.168.0.234:3000';
      case 'stage':
        baseUrl = 'http://localhost:3000';
        break;
      case 'prod':
        baseUrl = 'http://localhost:3000';
        break;
    }
  }
}
