import 'package:flutter/material.dart';
import 'home_page.dart';
import 'named_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/named': (context) => NamedPage(),
      },
    );
  }
}