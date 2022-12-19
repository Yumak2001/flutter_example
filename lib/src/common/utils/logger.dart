import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

abstract class Log {
  static var logger = Logger(
    output: ConsoleOutput(),
    printer: MyPrinter(),
  );

  static void remoteLogger(String message, String level) {
    Sentry.captureMessage(
      '[$level] - $message',
    );
  }

  static void debug(String message) async {
    if (kDebugMode) {
      logger.d(message, '', StackTrace.current);
    }
    // remoteLogger(message, 'DEBUG');
  }

  static void info(String message) async {
    if (kDebugMode) {
      logger.i(message, '', StackTrace.current);
    }
  }

  static void warning(String message) async {
    logger.w(message, '', StackTrace.current);
    // remoteLogger(message, 'WARNING');
  }

  static void error(String message) async {
    logger.e(message, '', StackTrace.current);
    remoteLogger(message, 'ERROR');
  }

  static String dioStrings = '';

  static void dio(String message) async {
    logger.v(message, '', StackTrace.current);
    // if (dioStrings == '') {
    //   dioStrings += '${message}\n';
    // } else {
    //   dioStrings += '[DIO] - ${message}\n';
    //   if (message.contains('—————————————————')) {
    //     remoteLogger(dioStrings, 'DIO');
    //     dioStrings = '';
    //   }
    // }
    ///Если нужна отправка запросов в сентри
  }
}

class ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      if (event.level == Level.verbose) {
        log(line, name: '  DIO  ');
      } else {
        log(line, name: '${event.level.name.toUpperCase().padRight(7, ' ')}');
      }
    }
  }
}

class MyPrinter extends LogPrinter {
  static int methodCount = 0;
  @override
  List<String> log(LogEvent event) {
    var time = DateTime.now();
    List<String> list = [];
    if (event.level == Level.verbose) {
      list.add(' - ${event.message}');
    } else {
      list.add(
          '- [${DateFormat('dd.MM.yy HH:mm:ss').format(time)}.${time.microsecond.toString().padRight(3, '0')}] - ${event.message}');
    }
    switch (event.level) {
      case Level.debug:
        methodCount = 1;
        break;
      case Level.warning:
        methodCount = 3;
        break;
      case Level.error:
        methodCount = 5;
        break;
      case Level.info:
        methodCount = 0;
        break;
      default:
        methodCount = 0;
        break;
    }
    if (methodCount > 0) {
      List<String> stackTrace = formatStackTrace(event.stackTrace, methodCount);
      list.addAll(stackTrace);
    }
    return list;
  }
}

List<String> formatStackTrace(StackTrace? stackTrace, int methodCount) {
  var lines = stackTrace.toString().split('\n');
  int stackTraceBeginIndex = 1;
  if (stackTraceBeginIndex > 0 && stackTraceBeginIndex < lines.length - 1) {
    lines = lines.sublist(stackTraceBeginIndex);
  }
  var formatted = <String>[];
  var count = 0;
  for (var line in lines) {
    if (_discardDeviceStacktraceLine(line) ||
        _discardWebStacktraceLine(line) ||
        _discardBrowserStacktraceLine(line) ||
        line.isEmpty) {
      continue;
    }
    formatted.add('- #$count |  ${''.padRight(count, '  ')}${line.replaceFirst(RegExp(r'#\d+\s+'), '')}');
    if (++count == methodCount) {
      break;
    }
  }

  if (formatted.isEmpty) {
    return [];
  } else {
    return formatted;
  }
}

bool _discardDeviceStacktraceLine(String line) {
  final _deviceStackTraceRegex = RegExp(r'#[0-9]+[\s]+(.+) \(([^\s]+)\)');
  var match = _deviceStackTraceRegex.matchAsPrefix(line);
  if (match == null) {
    return false;
  }
  return match.group(2)!.startsWith('package:logger');
}

bool _discardWebStacktraceLine(String line) {
  final _webStackTraceRegex = RegExp(r'^((packages|dart-sdk)\/[^\s]+\/)');
  var match = _webStackTraceRegex.matchAsPrefix(line);
  if (match == null) {
    return false;
  }
  return match.group(1)!.startsWith('packages/logger') || match.group(1)!.startsWith('dart-sdk/lib');
}

bool _discardBrowserStacktraceLine(String line) {
  final _browserStackTraceRegex = RegExp(r'^(?:package:)?(dart:[^\s]+|[^\s]+)');
  var match = _browserStackTraceRegex.matchAsPrefix(line);
  if (match == null) {
    return false;
  }
  return match.group(1)!.startsWith('package:logger') || match.group(1)!.startsWith('dart:');
}
