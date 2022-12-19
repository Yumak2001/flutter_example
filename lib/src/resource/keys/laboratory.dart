import 'package:flutter/cupertino.dart';

abstract class LaboratoryPageKeys {
  static const _page = 'LaboratoryPage';

  static Key page = Key(_page);

  /// Body
  static Key body = Key(_page + 'Body');
  static Key bodyScrollList = Key(_page + 'BodyScrollList');
  static Key bodySearchInput = Key(_page + 'BodySearchInput');
}
