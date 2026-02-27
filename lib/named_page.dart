import 'package:flutter/material.dart';

class NamedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Named Page")),
      body: Center(
        child: Text("Іменована навігація"),
      ),
    );
  }
}