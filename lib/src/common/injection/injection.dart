import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection(String environment) async {
  $initGetIt(getIt, environment: environment);
}

// @module
// abstract class RegisterModule {
//   @lazySingleton
//   Dio get dio => Dio()..interceptors.add(LogInterceptor(responseBody: true));
// }

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
  static const test = 'test';
}
