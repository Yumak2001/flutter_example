import 'package:flutter/cupertino.dart';

abstract class EventDetailPageKeys {
  static const _page = 'EventDetail';

  static Key page = Key(_page);
  static Key scaffold = Key(_page + 'Scaffold');
  static Key body = Key(_page + 'Body');
}
