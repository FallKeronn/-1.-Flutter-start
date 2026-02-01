import 'package:flutter/material.dart';

void main() {
  runApp(const AnimationApp());
}

class AnimationApp extends StatelessWidget {
  const AnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade300,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),

      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              child: Text('Menu', style: TextStyle(fontSize: 20)),
            ),
            ListTile(title: Text('Home')),
            ListTile(title: Text('Settings')),
            ListTile(title: Text('Rules')),
          ],
        ),
      ),

      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: number == 0
            ? const HeroWidget()
            : const Center(
          child: Icon(
            Icons.settings,
            size: 50,
            color: Colors.green,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.open_in_new),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const HeroPage(),
            ),
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: number,
        onTap: (value) {
          setState(() {
            number = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Hero(
        tag: 'icon',
        child: Icon(
          Icons.home,
          size: 50,
          color: Colors.green,
        ),
      ),
    );
  }
}

class HeroPage extends StatelessWidget {
  const HeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Page')),
      body: const Center(
        child: Hero(
          tag: 'icon',
          child: Icon(
            Icons.home,
            size: 50,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
