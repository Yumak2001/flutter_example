import 'package:flutter/cupertino.dart';

abstract class NewsListPageKeys {
  static const _page = 'NewsList';

  static Key page = Key(_page);
  static Key body = Key(_page + 'Body');
}
