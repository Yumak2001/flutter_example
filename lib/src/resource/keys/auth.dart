import 'package:flutter/cupertino.dart';

abstract class AuthPageKeys {
  static const _page = 'AuthPage';

  static Key page = Key(_page);
  static Key scaffold = Key(_page + 'Scaffold');

  ///AppBar
  static Key appBar(String keyPage) => Key(keyPage + 'AppBar');
}
