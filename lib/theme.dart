import 'package:flutter/material.dart';

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
