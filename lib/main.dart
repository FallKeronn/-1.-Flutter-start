import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Me {
  String _name;
  String _lastName;

  Me({
    required String name,
    required String lastName
  })  : _name = name,
        _lastName = lastName;

  String get fullName {
    return '$_name $_lastName';
  }

  set name(String value) {
    _name = value;
  }

  set lastName(String value) {
    _lastName = value;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final me = Me(name: 'Олег', lastName: 'Науменко');

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            me.fullName,
            style: TextStyle(fontSize: 42),
          ),
        ),
      ),
    );
  }
}