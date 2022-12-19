import 'package:flutter/cupertino.dart';

abstract class TicketsPageKeys {
  static const _page = 'TicketsPage';

  static Key page = Key(_page);
  static Key scaffold = Key(_page + 'Scaffold');

  ///AppBar
  static Key appBar(String keyPage) => Key(keyPage + 'AppBar');
}
