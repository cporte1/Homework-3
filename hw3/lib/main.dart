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
    return ChangeNotifierProvider(
      create: (context) => GameProvider(),
      child: Consumer<GameProvider>(
        builder: (context, provider, child) {
          return GridVied.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crosAxisCount:4,
            ),
            itemCount: provier.cards.length,
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                child: Card(
                  backSide: Image.asset("assets/card_back.png"),
                  frontSide: Image.asset(provider.cards[index].frontSide),
                ),
                transform: Matrix.rotationY(
                  provider.cards[index].checkFaceUp ? math.pi : 0),
                );
              ),
              onTap: (index) {
            provider.cardFlip(index);
              },
            };
          ),
        }
      )
    )

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
