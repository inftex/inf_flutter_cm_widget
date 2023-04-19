import 'package:flutter/material.dart';
import 'package:inf_flutter_theme/widgets/custom_text.dart';

enum CustomButtonType {
  primary,
  secondary,
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? height;
  final ButtonStyle? style;
  final CustomButtonType type;
  final EdgeInsetsDirectional? padding;
  final Function()? onPressed;

  CustomButton({
    super.key,
    required this.text,
    this.textColor,
    this.height,
    this.style,
    this.type = CustomButtonType.primary,
    this.padding,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? _defaultHeight(),
      child: TextButton(
        onPressed: onPressed,
        style: style ??
            TextButton.styleFrom(
                padding: padding ?? _defaultPadding(),
                backgroundColor: _defaultBgColor(),
                shape: _defaultShape()),
        child: CustomText(
          text,
          fontWeight: FontWeight.w500,
          color: textColor ?? _defaultTextColor() ?? Colors.black,
        ),
      ),
    );
  }

  EdgeInsetsDirectional _defaultPadding() {
    return const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12);
  }

  double? _defaultHeight() {
    return null;
  }

  Color? _defaultTextColor() {
    Color? color;
    switch (type) {
      case CustomButtonType.secondary:
        color = Colors.blue;
        break;
      default:
        color = Colors.white;
        break;
    }
    return color;
  }

  Color? _defaultBgColor() {
    Color? color;
    switch (type) {
      case CustomButtonType.secondary:
        color = Colors.white;
        break;
      default:
        color = Colors.blue;
        break;
    }
    return color;
  }

  OutlinedBorder? _defaultShape() {
    OutlinedBorder? result;
    switch (type) {
      case CustomButtonType.secondary:
        result = RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(
              width: 1,
              color: Colors.blue,
            ));
        break;
      default:
        result = RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(
              color: Colors.blue,
            ));

        break;
    }
    return result;
  }
}
