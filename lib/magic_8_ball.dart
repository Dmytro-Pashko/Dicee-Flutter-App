import 'dart:math';

import 'package:flutter/material.dart';

Widget getMagic8BallScreen() {
  return MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Ask Me Anything'),
        backgroundColor: Colors.blue[900],
      ),
      body: Magic8BallWidget(),
    ),
  );
}

class Magic8BallWidget extends StatefulWidget {
  @override
  State<Magic8BallWidget> createState() => Magic8BallWidgetState();
}

class Magic8BallWidgetState extends State<Magic8BallWidget> {
  static Random randGen = Random();

  /// Generates integer number [1..5]
  static int getRandomDiceNumber() {
    return randGen.nextInt(4) + 1;
  }

  int ballNum = 1;

  void setNewRandomBall() {
    setState(() {
      ballNum = getRandomDiceNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextButton(
          onPressed: () {
            setNewRandomBall();
          },
          child: Image(
            image: AssetImage("images/ball$ballNum.png"),
          ),
        ),
      ),
    );
  }
}
