import 'package:flutter/cupertino.dart';

abstract class WebViewPageKeys {
  static const _page = 'WebViewPage';

  static Key page = Key(_page);
  static Key scaffold = Key(_page + 'Scaffold');

  ///Body
  static Key bodyWebView = Key(_page + 'BodyWebView');

  ///AppBar
  static Key appBar(String keyPage) => Key(keyPage + 'AppBar');
}
