import 'package:flutter/cupertino.dart';

abstract class FirstPageKeys {
  static const _page = 'FirstPage';

  static Key page = Key(_page);
  static Key scaffold = Key(_page + 'Scaffold');
}
