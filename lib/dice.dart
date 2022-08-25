import 'dart:math';

import 'package:flutter/material.dart';

Widget getDiceScreen() {
  return Scaffold(
    backgroundColor: Colors.red,
    appBar: AppBar(
      title: const Text('Dicee'),
      backgroundColor: Colors.red,
    ),
    // body: const DicePageWidget(),
    body: const DicePageWidget(),
  );
}

class DicePageWidget extends StatefulWidget {
  const DicePageWidget({Key? key}) : super(key: key);

  @override
  State<DicePageWidget> createState() => _DicePageWidgetState();
}

class _DicePageWidgetState extends State<DicePageWidget> {
  static Random randGen = Random();

  /// Generates integer number [1..6]
  static int getRandomDiceNumber() {
    return randGen.nextInt(5) + 1;
  }

  int leftDiceNumber = getRandomDiceNumber();
  int rightDiceNumber = getRandomDiceNumber();

  void generateNewDices() {
    setState(() {
      leftDiceNumber = getRandomDiceNumber();
      rightDiceNumber = getRandomDiceNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
                onPressed: () {
                  generateNewDices();
                },
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset('images/dice$leftDiceNumber.png'))),
          ),
          Expanded(
            child: TextButton(
                onPressed: () {
                  generateNewDices();
                },
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset('images/dice$rightDiceNumber.png'))),
          ),
        ],
      ),
    );
  }
}
