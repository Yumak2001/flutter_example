import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

abstract class SentryConfiguration {
  static String dsn = 'https://d1090f937a4a4630ad1dd56d433339e2@sentry.staff.miura.tech/6';

  static FutureOr optionsConfiguration(SentryFlutterOptions options) async {
    if (kDebugMode) {
      /// Debug options Sentry
      options.dsn = dsn;
      options.tracesSampleRate = 1.0;
      options.attachThreads = true;
      options.serverName = ServerConfiguration.baseUrl;
      options.environment = 'staging';
    } else {
      /// Release options Sentry
      options.dsn = dsn;
      options.tracesSampleRate = 1.0;
      options.serverName = ServerConfiguration.baseUrl;
      options.environment = 'prod';
    }
  }
}

abstract class ServerConfiguration {
  static String baseUrl = 'https://faneron.ru';
  static String apiUrl = '/api/v1';
}
