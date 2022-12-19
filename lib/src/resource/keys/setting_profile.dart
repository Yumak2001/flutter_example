import 'package:flutter/cupertino.dart';

abstract class SettingProfilePageKeys {
  static const _page = 'SettingProfilePage';

  static Key page = Key(_page);
  static Key scaffold = Key(_page + 'Scaffold');

  ///Body
  static Key body = Key(_page + 'Body');
  static Key bodyScrollList = Key(_page + 'BodyScrollList');

  ///AppBar
  static Key appBar(String keyPage) => Key(keyPage + 'AppBar');
}
