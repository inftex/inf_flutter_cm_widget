import 'package:flutter/cupertino.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final Function(bool value) onChanged;

  const CustomSwitch({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
        value: value,
        onChanged: (value) {
          onChanged.call(value);
        });
  }
}
