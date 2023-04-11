import 'package:flutter/material.dart';
import 'package:inf_flutter_cm_widget/mixins/theme_mixin.dart';

class CustomText extends StatelessWidget with ThemeMixinStateless {
  CustomText(this.text,
      {this.fontFamily,
      this.fontStyle = FontStyle.normal,
      this.color = Colors.black,
      this.fontSize,
      this.padding = const EdgeInsets.all(0),
      this.margin = const EdgeInsets.all(0),
      this.maxLine,
      this.overflow = TextOverflow.ellipsis,
      this.align = TextAlign.start,
      this.fontWeight = FontWeight.normal,
      this.textDecoration = TextDecoration.none,
      this.required = false,
      this.requiredText = '*',
      this.requiredColor = Colors.red});

  final String text;
  final String? fontFamily;
  final FontStyle fontStyle;
  final Color color;
  final double? fontSize;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final int? maxLine;
  final TextOverflow overflow;
  final TextAlign align;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;
  final bool required;
  final String requiredText;
  final Color requiredColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
            fontFamily: fontFamily ?? fontFamilyRegular,
            color: color,
            fontSize: fontSize ?? fontSizeRegular,
            fontStyle: fontStyle,
            fontWeight: fontWeight,
            decoration: textDecoration),
        overflow: overflow,
        maxLines: maxLine,
        textAlign: align,
      ),
    );
  }
}
