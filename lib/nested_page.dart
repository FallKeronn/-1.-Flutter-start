import 'package:flutter/material.dart';

class NestedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nested Page")),
      body: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => FirstNestedScreen(),
          );
        },
      ),
    );
  }
}

class FirstNestedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Відкрити вкладену сторінку"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondNestedScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SecondNestedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Назад"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}