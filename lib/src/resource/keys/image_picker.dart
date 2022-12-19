import 'package:flutter/cupertino.dart';

abstract class ImagePickerPageKeys {
  static const _page = 'ImagePickerPage';

  static Key page = Key(_page);
  static Key scaffold = Key(_page + 'Scaffold');

  ///Body
  static Key body = Key(_page + 'Body');

  ///AppBar
  static Key appBar(String keyPage) => Key(keyPage + 'AppBar');
}
