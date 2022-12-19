import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';

abstract class TextStylesApp {
  static const _fontDrukCyr = 'DrukCyr';
  static const _fontDrukTextCyr = 'DrukTextCyr';
  static const fontPragmatica = 'Pragmatica';
  static const _fontBebasNeue = 'BebasNeue';

  ///Title Style
  static TextStyle titleStyle(double opacity) => TextStyle(
        color: ColorsApp.text.withOpacity(opacity),
        fontFamily: _fontDrukTextCyr,
        fontSize: 18,
        height: 1.5,
      );

  ///DrukCyr
  static TextStyle drukCyr500(
    double fontSize, {
    Color color = ColorsApp.text,
    double lineHeight = 1.0,
  }) =>
      TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        color: color,
        fontFamily: _fontDrukCyr,
        height: lineHeight,
      );
  static TextStyle drukCyr500italic(
    double fontSize, {
    Color color = ColorsApp.text,
    double lineHeight = 1.0,
  }) =>
      TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        color: color,
        fontStyle: FontStyle.italic,
        fontFamily: _fontDrukCyr,
        height: lineHeight,
      );

  ///DrukTextCyr
  static TextStyle drukTextCyr500(
    double fontSize, {
    Color color = ColorsApp.text,
    double lineHeight = 1.0,
  }) =>
      TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        color: color,
        fontFamily: _fontDrukTextCyr,
        height: lineHeight,
      );
  static TextStyle drukTextCyr400(
    double fontSize, {
    Color color = ColorsApp.text,
    double lineHeight = 1.0,
  }) =>
      TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        color: color,
        fontFamily: _fontDrukTextCyr,
        height: lineHeight,
      );

  ///Pragmatica
  static TextStyle pragmatica400(
    double fontSize, {
    Color color = ColorsApp.text,
    double lineHeight = 1.0,
  }) =>
      TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        color: color,
        fontFamily: fontPragmatica,
        height: lineHeight,
      );
  static TextStyle pragmatica300(
    double fontSize, {
    Color color = ColorsApp.text,
    double lineHeight = 1.0,
  }) =>
      TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: fontSize,
        color: color,
        fontFamily: fontPragmatica,
        height: lineHeight,
      );

  ///Bebus Neue
  static TextStyle bebus700(
    double fontSize, {
    Color color = ColorsApp.text,
    double lineHeight = 1.0,
  }) =>
      TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        color: color,
        fontFamily: _fontBebasNeue,
        height: lineHeight,
      );
}
