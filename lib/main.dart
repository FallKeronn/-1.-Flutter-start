import 'package:flutter/material.dart';

mixin Welcome {
  String greet() => "Welcome to my second homework";
}

class Me with Welcome {
  final String name;
  final String surname;
  final int age;


  factory Me.example() {
    return Me(
      name: "Oleh",
      surname: "Naumenko",
    );
  }

  Me({
    required this.name,
    required this.surname,
    int myAge = 25,
  })  : age = myAge,
        assert(myAge > 20);

  String get fullName => "$name $surname";
}

void main() {
  runApp(const Homework2());
}

class Homework2 extends StatelessWidget {
  const Homework2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String lambda(String text) => text.trim();

  int Function() counter() {
    int count = 0;
    return () => ++count;
  }

  @override
  Widget build(BuildContext context) {
    final me = Me(surname: "Naumenko", name: "Oleh", myAge: 25);

    String? tgNickname;
    tgNickname ??= "@FallKeronn";

    final count = counter();

    final List<String> social = ["Telegram", "Instagram", "LinkedIn"];
    final Set<String> languages = {"Ukrainian", "English"};
    final Map<String, int> family = {
      "Sister": 2,
      "Brother": 1,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text("Homework 2"),
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: ListView(
          children: [
            Text(me.greet()),
            SizedBox(height: 25),

            Text("Name: ${me.fullName}"),
            Text("Age: ${me.age}"),
            Text("TgNickname: $tgNickname"),

            SizedBox(height: 25),

            Text(
              "Factory constructor result:",
            ),
            Text(Me.example().fullName),

            SizedBox(height: 25),

            Text("Lambda and Closure example: ${lambda(me.fullName)}"),
            Text("-${count()}"),
            Text("-${count()}"),
            Text("-${count()}"),
            Text("-${count()}"),
            Text("-${count()}"),

            SizedBox(height: 25),

            Text("Social: $social"),
            Text("Languages: $languages"),
            Text("Family: $family"),

            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
