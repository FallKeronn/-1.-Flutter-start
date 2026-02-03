import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int likes = 0;

  void addLike() {
    setState(() {
      likes++;
    });
  }

  void resetLikes() {
    setState(() {
      likes = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Likes: $likes'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LikeButton(onLike: addLike),
            const SizedBox(height: 8),
            ResetButton(onReset: resetLikes),
          ],
        ),
      ),
    );
  }
}

class LikeButton extends StatelessWidget {
  final VoidCallback onLike;

  const LikeButton({super.key, required this.onLike});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onLike,
      child: const Text('❤️ Like'),
    );
  }
}

class ResetButton extends StatelessWidget {
  final VoidCallback onReset;

  const ResetButton({super.key, required this.onReset});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onReset,
      child: const Text('🔄 Reset'),
    );
  }
}