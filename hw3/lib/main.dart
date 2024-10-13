import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Card {
  final String front;
  final String back;
  boot checkFaceUp = false;

  Card(this.front, this.back);
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
