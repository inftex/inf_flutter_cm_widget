import 'package:flutter/material.dart';
import 'package:inf_flutter_cm_widget/mixins/theme_mixin.dart';
import 'package:inf_flutter_cm_widget/widgets/custom_text.dart';
import 'package:inf_flutter_cm_widget/widgets/custom_textfield.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with ThemeMixin {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...buildText(),
            const SizedBox(height: 16),
            ...buildTextField(),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> buildTextField() {
    return [
      CustomText(
        'TextField demo',
        fontSize: fontSizeLarge,
        fontWeight: FontWeight.w500,
      ),
      Padding(
        padding: const EdgeInsetsDirectional.all(8),
        child: CustomTextField(
          label: 'Label',
          text: '',
          hintText: 'hint here',
          required: true,
          onValidated: (v) {
            if (v.isEmpty) {
              return 'Required field';
            }
            return '';
          },
        ),
      )
    ];
  }

  List<Widget> buildText() {
    return [
      CustomText(
        'Text demo',
        fontSize: fontSizeLarge,
        fontWeight: FontWeight.w500,
      ),
      CustomText(
        'Text small',
        fontSize: fontSizeSmall,
        required: true,
      ),
      CustomText(
        'Text normal',
        fontSize: fontSizeRegular,
      ),
      CustomText(
        'Text large really lonnnn nnnnn nnnnnnnnn nnnnnnnnnnnnnnn nnnnn nnnnn ggg ggg ggg gggg gg ggggg gggg ggg gg ggg ggg',
        fontSize: fontSizeLarge,
        required: true,
        maxLine: 1,
      )
    ];
  }
}
