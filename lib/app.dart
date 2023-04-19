import 'package:flutter/material.dart';
import 'package:inf_flutter_cm_widget/demo/my_home_page.dart';
import 'package:inf_flutter_theme/theme.dart';

///
/// This class creates the Material App
/// Theme setup is here, view [ThemeMixin] for usage
///
class RootApp extends StatelessWidget {
  const RootApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themDataLight,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
