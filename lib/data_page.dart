import 'package:flutter/material.dart';

class DataPage extends StatelessWidget {
  final String name;

  DataPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Привіт, $name"),

            ElevatedButton(
              child: Text("Повернути дані"),
              onPressed: () {
                Navigator.pop(context, "Інша сторінка!");
              },
            ),
          ],
        ),
      ),
    );
  }
}