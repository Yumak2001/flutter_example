import 'package:flutter/cupertino.dart';

abstract class HomePageKeys {
  static const _page = 'HomePage';

  static Key page = Key(_page);
  static Key scaffold = Key(_page + 'Scaffold');

  ///BottomNavigationMenu
  static Key bottomNavMenu = Key(_page + 'ScaffoldBottomNavigationMenu');
  static Key bottomNavMenuItem(String item) =>
      Key(_page + 'ScaffoldBottomNavigationMenuItem$item');
  static Key bottomNavMenuItemIcon(String item) =>
      Key(_page + 'ScaffoldBottomNavigationMenuItem${item}Icon');

  ///AppBar
  static Key appBar(String keyPage) => Key(keyPage + 'AppBar');
  static Key appBarMenu(String keyPage) => Key(keyPage + 'AppBarMenu');
  static Key appBarMenuButton(String keyPage) =>
      Key(keyPage + 'AppBarMenuButton');
  static Key appBarMenuIcon(String keyPage) => Key(keyPage + 'AppBarMenuIcon');
  static Key appBarBack(String keyPage) => Key(keyPage + 'AppBarBack');
}
