import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CardModel(),
      child: const MyApp(),
    ),
  );
}

class MyCard {
  String title;
  int pressed;

  MyCard(this.title, this.pressed);
}

class CardModel extends ChangeNotifier {
  List<MyCard> cards = [
    MyCard("Card 1", 0),
    MyCard("Card 2", 0),
    MyCard("Card 3", 0),
    MyCard("Card 4", 0),
  ];

  void incrementPressed(int index) {
    cards[index].pressed++;
    notifyListeners();
  }

  int get totalPressed {
    int sum = 0;
    for (var card in cards) {
      sum += card.pressed;
    }
    return sum;
  }
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Consumer<CardModel>(
              builder: (context, model, child) {
                return Text(
                  "Number of Pressed: ${model.totalPressed}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                );
              },
            ),
          ),
        ),
      ),
      body: Consumer<CardModel>(
        builder: (context, model, child) {
          return ListView.builder(
            itemCount: model.cards.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(model.cards[index].title),
                  subtitle: Text(
                    "Pressed: ${model.cards[index].pressed}",
                  ),
                  onTap: () {
                    Provider.of<CardModel>(
                      context,
                      listen: false,
                    ).incrementPressed(index);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
