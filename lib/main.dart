import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;
  List posts = [];

  @override
  void initState() {
    super.initState();
    loadTheme();
    loadPosts();
  }

  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDark = prefs.getBool('theme') ?? false;
    });
  }

  void changeTheme() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('theme', !isDark);
    });

    setState(() {
      isDark = !isDark;
    });
  }

  Future<void> loadPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      setState(() {
        posts = parseJson(response.body);
      });
    }
  }

  List parseJson(String body) {
    return json.decode(body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Homework"),
          actions: [
            IconButton(
              icon: Icon(Icons.brightness_6),
              onPressed: changeTheme,
            )
          ],
        ),
        body: posts.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(posts[index]['title']),
              subtitle: Text(posts[index]['body']),
            );
          },
        ),
      ),
    );
  }
}