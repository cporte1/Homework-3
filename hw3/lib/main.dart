import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Card {
  final String front;
  final String back;
  boot checkFaceUp = false;

  Card(this.front, this.back);
}

class GameProvider extends ChangeNotifier {
  final List<Card> cards = [];

  GameProvider() {
    for (int = 0; i < 8; i++) {
      cards.add(Card("assets/card_front.png", "assets/card_back.png"));
    }
  }

void cardFlip(int card) {
  cards[card].checkFaceUp = !cards[card].checkFaceUp;
  if (checkGameWon()) {
    print('You Won!');
  }
  notifyListener();
}

  bool checkGameWon() {
    return cards
        .where((card) => !card.checkFaceUp)
        .isEmpty;
  }
}


class CardMatchingGame extends StatelessWidget {
  @override
  Widget build(buildContext context) {

  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CardMatchingGame(),
    );
  }
}
