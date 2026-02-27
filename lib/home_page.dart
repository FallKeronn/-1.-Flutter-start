import 'package:flutter/material.dart';
import 'second_page.dart';
import 'data_page.dart';
import 'nested_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              child: Text("На ім'я класу"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
                  ),
                );
              },
            ),

            ElevatedButton(
              child: Text("Іменована навігація"),
              onPressed: () {
                Navigator.pushNamed(context, '/named');
              },
            ),

            ElevatedButton(
              child: Text("Передати дані"),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataPage(name: "Тут могло бути ваше ім'я"),
                  ),
                );

                print("Назад: $result");
              },
            ),

            ElevatedButton(
              child: Text("Nested Navigation"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NestedPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}