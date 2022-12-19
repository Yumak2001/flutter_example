import 'package:flutter/material.dart';

abstract class ColorsApp {
  /// Text
  static const text = Color(0xFFEBE6E1);
  static const textWhite = Color(0xFFFFFFFF);
  static const textDark = Color(0xFF0A0A0A);
  static const textBlack = Color(0xFF000000);
  static const textAccent = Color(0xFFF36318);
  static const textDropBackgroundLight = Color(0xFFEBE6E1);
  static const textDropLight = Color(0xFF0A0A0A);
  static const textDropBackgroundDark = Color(0xFF0A0A0A);
  static const textDropDark = Color(0xFFEBE6E1);

  /// Border
  static const borderDark = Color(0xFF0A0A0A);
  static const borderLight = Color(0xFFEBE6E1);
  static const borderAccent = Color(0xFFF36318);
  static const borderImage = Color(0xFFFFE3B8);

  /// Bottom Navigation Menu
  static const bottomNavigationBackground = Color(0xFF0A0A0A);
  static const bottomNavigationActive = Color(0xFFF36318);
  static const bottomNavigationInActive = Color(0xFFEBE6E1);

  /// AppBar
  static const appBarBackground = Color(0xFF0A0A0A);
  static const appBarIconColor = Color(0xFFEBE6E1);

  /// Background
  static const backgroundMainPage = Color(0xFF0A0A0A);
  static const backgroundLaboratoryPage = Color(0xFFEBE6E1);
  static const backgroundAuthPage = Color(0xFFEBE6E1);
  static const backgroundModal = Color(0xFFEBE6E1);
  static const backgroundItemActive = Color(0xFFF36318);
  static const backgroundItem = Color(0xFF0A0A0A);
  static const backgroundItemLight = Color(0xFFFFFFFF);
  static const backgroundItemInActive = Color(0xFFEBE6E1);
  static const backgroundButtonLight = Color(0xFFEBE6E1);
  static const backgroundButtonDark = Color(0xFF0A0A0A);
  static const backgroundButtonAccent = Color(0xFFF36318);
  static const backgroundBuyTicketExposition = Color(0xFFEBE6E1);
  static const backgroundTicketHistory = Color(0xFF20201F);
  static const backgroundTicketFree = Color(0xFFEBE6E1);

  ///Check Box
  static final checkBoxBackground = Color(0xFF0A0A0A).withOpacity(0.1);
  static final checkBoxActive = Color(0xFF0A0A0A);
  static final checkBoxInActive = Color(0xFF0A0A0A).withOpacity(0.0);

  ///Input
  static final inputBackground = Color(0xFF0A0A0A).withOpacity(0.1);
  static final inputHint = Color(0xFF000000).withOpacity(0.4);
  static final inputText = Color(0xFF000000);
  static final inputError = Color(0xFFEB3333);

  ///Loader
  static final loaderAccent = Color(0xFFF36318);
  static final loaderButtonDark = Color(0xFF0A0A0A);
  static final loaderButtonLight = Color(0xFFEBE6E1);

  ///Icons
  static final iconDark = Color(0xFF000000);
  static final iconLight = Color(0xFFEBE6E1);

  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);

  ///Errors
  static const errorColorLight = Color(0xFFF36318);
  static const errorColorDark = Color(0xFF0A0A0A);

  ///GradientColors
  static const gradient1 = Color(0xFFFFE3B8);
  static const gradient2 = Color(0xFFEFC87C);
  static const gradient3 = Color(0xFFFFEBB8);
  static const gradient4 = Color(0xFFFFC266);

  static const gradientBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      ColorsApp.gradient1,
      ColorsApp.gradient2,
      ColorsApp.gradient3,
      ColorsApp.gradient4,
    ],
  );
  static const gradientBackgroundHorizontal = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      ColorsApp.gradient1,
      ColorsApp.gradient2,
      ColorsApp.gradient3,
      ColorsApp.gradient4,
    ],
  );
}
