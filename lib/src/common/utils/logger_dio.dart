import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'logger.dart';

class LoggingInterceptorDio extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    logPrint('————————————————— API Request - Start —————————————————');
    printKV('URI', options.uri);
    printKV('METHOD', options.method);
    logPrint('HEADERS:');
    options.headers.forEach((key, v) => printKV(' - $key', v));
    logPrint('BODY:');
    printAll(options.data ?? '');

    logPrint('————————————————— API Request - End —————————————————');
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    logPrint('————————————————— Api Error - Start —————————————————');
    logPrint('URI: ${err.requestOptions.uri}');
    if (err.response != null) {
      logPrint('STATUS CODE: ${err.response?.statusCode?.toString()}');
    }
    logPrint('HEADERS:');
    err.requestOptions.headers.forEach((key, v) => printKV(' - $key', v));
    if (err.response != null) {
      printKV('REDIRECT', err.response?.realUri ?? '');
      logPrint('REQUEST BODY:');
      printAll(err.requestOptions.data ?? '');
      logPrint('BODY:');
      printAll(err.response?.data ?? '');
      logPrint('ERROR: ${err.error}');
    }

    logPrint('————————————————— Api Error - End —————————————————');
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    logPrint('————————————————— Api Response - Start —————————————————');
    printKV('URI', response.requestOptions.uri);
    printKV('STATUS CODE', response.statusCode ?? '');
    logPrint('HEADERS:');
    response.requestOptions.headers.forEach((key, v) => printKV(' - $key', v));
    printKV('REDIRECT', response.isRedirect ?? false);
    logPrint('REQUEST BODY:');
    printAll(response.requestOptions.data ?? '');
    logPrint('BODY:');
    printAll(response.data ?? '');

    logPrint('————————————————— Api Response - End —————————————————');

    return handler.next(response);
  }

  void printKV(String key, Object v) {
    logPrint('$key: $v');
  }

  void printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }

  void logPrint(String s) {
    if (!kReleaseMode) Log.dio(s);
  }
}
