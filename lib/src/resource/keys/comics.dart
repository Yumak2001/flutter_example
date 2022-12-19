import 'package:flutter/cupertino.dart';

abstract class ComicsPageKeys {
  static const _page = 'ComicsPage';

  static Key page = Key(_page);

  /// Body
  static Key body = Key(_page + 'Body');
  static Key scaffold = Key(_page + 'Scaffold');

  /// Button
  static Key buttonPay = Key(_page + 'ButtonPay');
}
