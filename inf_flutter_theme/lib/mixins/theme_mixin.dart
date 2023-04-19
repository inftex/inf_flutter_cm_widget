import 'package:flutter/material.dart';

mixin ThemeMixin on Object {
  ///
  /// Font
  ///
  double get fontSizeLarge => 16;
  double get fontSizeRegular => 14;
  double get fontSizeSmall => 12;

  String get fontFamilyRegular => FontFamily.sFProDisplay;

  ///
  /// TextStyle
  ///
  TextStyle get textStyleRegular => TextStyle(
        fontFamily: fontFamilyRegular,
        fontSize: fontSizeRegular,
        color: Colors.black,
      );

  ///
  /// Color
  ///
  Color get colorPrimary => Colors.blue;
}

///
/// Theme Data
///
final themDataLight = ThemeData(
  /// Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: Colors.lightBlue[800],

  /// Scaffold
  scaffoldBackgroundColor: Colors.white,

  /// Define the default font family.
  fontFamily: FontFamily.sFProDisplay,
);

///
/// Font
///
class FontFamily {
  FontFamily._();
  static const String sFProDisplay = 'SFProDisplay';
}
