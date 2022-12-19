import 'package:flutter/cupertino.dart';

abstract class ExpositionPageKeys {
  static const _page = 'ExpositionPage';

  static Key page = Key(_page);

  /// Body
  static Key body = Key(_page + 'Body');
}
