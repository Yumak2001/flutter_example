import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';
import 'package:flutter/cupertino.dart';

abstract class ConstantsApp {
  /// MediaQuery
  static double topViewPadding(BuildContext context) => MediaQuery.of(context).padding.top;
  static double bottomViewPadding(BuildContext context) => MediaQuery.of(context).padding.bottom;
  static Size mainSize(BuildContext context) => MediaQuery.of(context).size;

  /// Bottom Navigation Menu
  static double bottomNavBarHeight([BuildContext? context]) =>
      61 + ((context != null) ? bottomViewPadding(context) : 0);
  static double bottomNavBarItemActiveHeight = 4.0;
  static double bottomNavBarItemIconSize = 35.0;
  static double bottomNavBarItemWidth(context) => mainSize(context).width / HomeScreens.values.length;

  /// App bar
  static double appBarHeight([BuildContext? context]) => 50 + ((context != null) ? topViewPadding(context) : 0);
  static double appBarIconMenuContainerSize = 35.0;
  static double appBarIconMenuSize = 30.0;
  static double appBarIconPositionTop = 7.5;
  static double appBarIconPositionLeft = 16.0;

  /// Main Page
  static double mainPageItemImageSize = 64.0;

  ///Duration
  static Duration durationAnimationMenu = Duration(milliseconds: 200);
  static Duration durationPageScroll = Duration(milliseconds: 500);
  static Duration durationBottomMenuAnimation = Duration(milliseconds: 300);
  static Duration durationInputTap = Duration(milliseconds: 200);
  static Duration durationAnimatedMainCarousel = Duration(milliseconds: 300);
  static Duration durationDoorAnimation = Duration(milliseconds: 800);
  static Duration durationErrorView = Duration(seconds: 2);
}
