import 'package:flutter/material.dart';
import 'package:inf_flutter_cm_widget/theme.dart';

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
}
