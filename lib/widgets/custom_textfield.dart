import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inf_flutter_cm_widget/mixins/theme_mixin.dart';

import 'custom_text.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String text;
  final EdgeInsetsDirectional? contenntPadding;
  final bool hasBorder;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final String hintText;
  final Color? hintColor;
  final bool readOnly;
  final bool required;
  final String requiredText;
  final Color requiredColor;
  final TextInputType inputType;
  final Function(String text)? onChanged;
  final String Function(String text)? onValidated;

  CustomTextField(
      {Key? key,
      this.label = '',
      required this.text,
      this.contenntPadding = const EdgeInsetsDirectional.all(8),
      this.hasBorder = true,
      this.borderColor = Colors.grey,
      this.borderRadius = 8,
      this.borderWidth = 1,
      this.hintText = '',
      this.hintColor,
      this.inputType = TextInputType.text,
      this.readOnly = false,
      this.required = false,
      this.requiredText = '*',
      this.requiredColor = Colors.red,
      this.onChanged,
      this.onValidated})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> with ThemeMixin {
  final TextEditingController _textController = TextEditingController();
  String _errorText = '';
  bool _hasClear = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _init();
    _focusNode.addListener(() {
      _checkClear(_textController.text);
    });
  }

  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    _init();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.readOnly,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // label
          if (widget.label.isNotEmpty) ...[
            Row(
              children: [
                Flexible(child: CustomText(widget.label)),
                if (widget.required) ...[
                  const SizedBox(width: 4),
                  CustomText(widget.requiredText, color: widget.requiredColor),
                ]
              ],
            ),
            const SizedBox(height: 4),
          ],

          Container(
            decoration: BoxDecoration(
              borderRadius: !widget.hasBorder
                  ? null
                  : BorderRadius.circular(widget.borderRadius),
              border: !widget.hasBorder
                  ? null
                  : Border.all(
                      width: widget.borderWidth, color: widget.borderColor),
            ),
            child: TextField(
              focusNode: _focusNode,
              controller: _textController,
              keyboardType: widget.inputType,
              style: textStyleRegular,
              cursorColor: Colors.black,
              onChanged: (String text) {
                _validate(text);
                _checkClear(text);
                widget.onChanged?.call(text);
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: widget.contenntPadding,
                  isDense: !kIsWeb && (Platform.isAndroid || Platform.isIOS),
                  hintText: widget.hintText,
                  suffixIconConstraints: const BoxConstraints(
                    maxHeight: 14,
                  ),
                  suffixIcon: () {
                    if (!_hasClear) {
                      return null;
                    }
                    return Row(mainAxisSize: MainAxisSize.min, children: [
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: _clear,
                        child: const Icon(
                          Icons.clear,
                          size: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ]);
                  }()),
            ),
          ),

          // Error
          if (_errorText.isNotEmpty) ...[
            const SizedBox(height: 2),
            CustomText(
              _errorText,
              fontSize: fontSizeSmall,
              color: Colors.red,
            ),
          ]
        ],
      ),
    );
  }

  void _init() {
    _textController.text = widget.text;
  }

  void _clear() {
    _textController.clear();
    _validate('');
    _checkClear('');
    widget.onChanged?.call('');
  }

  void _validate(String text) {
    setState(() {
      _errorText = widget.onValidated?.call(text) ?? '';
    });
  }

  void _checkClear(String text) {
    setState(() {
      if (_focusNode.hasFocus && text.isNotEmpty) {
        _hasClear = true;
      } else {
        _hasClear = false;
      }
    });
  }
}
