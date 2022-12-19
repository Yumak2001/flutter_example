import 'package:flutter/cupertino.dart';

abstract class MainPageKeys {
  static const _page = 'MainPage';

  static Key page = Key(_page);

  /// Body
  static Key body = Key(_page + 'Body');
  static Key bodyScrollList = Key(_page + 'BodyScrollList');
}
