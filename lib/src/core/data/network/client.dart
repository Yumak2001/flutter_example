import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_log/dio_log.dart';
import 'package:faneron_mobile/src/common/injection/injection.dart';
import 'package:faneron_mobile/src/core/data/storage/user.dart';
import 'package:faneron_mobile/src/core/domain/repository/errors.dart';
import 'package:faneron_mobile/src/resource/configurate.dart';
import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/common/utils/logger_dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

abstract class Api {
  late final Dio client;

  Api(this.client);
}

@LazySingleton(as: Api)
class ApiImpl implements Api {
  @override
  late final Dio client;

  final AuthInterceptor _authInterceptor = AuthInterceptor(getIt<UserDataStorage>());

  ApiImpl() {
    client = Dio(
      BaseOptions(
        baseUrl: '${ServerConfiguration.baseUrl}${ServerConfiguration.apiUrl}',
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    client.interceptors.addAll([
      ErrorHandleInterceptor(),
      InterceptorsWrapper(onRequest: (options, handler) => _authInterceptor(options, handler)),
      DioLogInterceptor(),
      LoggingInterceptorDio(),
    ]);
  }
}

/// Примитивный пример внедрения авторизации
class AuthInterceptor {
  final UserDataStorage userStorage;

  AuthInterceptor(this.userStorage);

  call(RequestOptions options, RequestInterceptorHandler handler) async {
    if (userStorage.isAuth &&
        userStorage.accessToken != null &&
        userStorage.lastUpdateToken != null &&
        userStorage.expiresIn != null) {
      if (DateTime.now().difference(userStorage.lastUpdateToken!).inSeconds < userStorage.expiresIn!) {
        options.headers.addAll({
          'Authorization': 'Bearer ${userStorage.accessToken!}',
        });
      }
    }
    options.headers.addAll({
      'Date': DateTime.now().toString(),
    });
    return handler.next(options);
  }
}

class ErrorHandleInterceptor implements Interceptor {
  final ErrorsRepository errorsRepository = getIt<ErrorsRepository>();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    Log.error(err.toString());
    if (err.toString().contains('Failed host lookup')) {
      errorsRepository.setError(ErrorTypes.networkError);
    } else if (err.response?.statusCode == 500) {
      if (err.requestOptions.path.contains('ticket') ||
          err.requestOptions.path.contains('profile') ||
          err.requestOptions.path.contains('refresh') ||
          err.requestOptions.path.contains('logout')) {
        ///Не отображаем ошибку
        return handler.next(err);
      } else {
        errorsRepository.setError(ErrorTypes.unAuth);
      }
    } else {
      errorsRepository.setError(ErrorTypes.loadData);
    }
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode != 200) {
      Log.error('Error code: ${response.statusCode}');
    }

    if (response.statusCode == 500) {
      //TODO: Добавить отслеживание запросов не авторизованых
    }

    return handler.next(response);
  }
}

/// Преобразование json в изоляте
class DioIsolateTransformer extends DefaultTransformer {
  DioIsolateTransformer() : super(jsonDecodeCallback: _parseJson);
}

dynamic _parseAndDecode(String response) => jsonDecode(response);

Future<dynamic> _parseJson(String text) => compute(_parseAndDecode, text);
