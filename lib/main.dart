import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: BallPage(),
    ),
  );
}

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('Ask Me Anything'),
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  final int threshold = 10;
  int counter = 0;
  bool reachedLimit = false;
  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FlatButton(
          onPressed: () {
            setState(() {
              if (counter == 0) {
                reachedLimit = false;
              }
              if (counter < threshold) {
                ballNumber = Random().nextInt(4) + 1;
                counter++;
              } else {
                reachedLimit = true;
                counter = 0;
              }
            });
          },
          child: !reachedLimit
              ? Image.asset('images/ball$ballNumber.png')
              : Text(
                  'TOO MANY QUESTIONS\nFOR TODAY!',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.5,
                  style: TextStyle(letterSpacing: 2, color: Colors.blue[50]),
                ),
        ),
      ),
    );
  }
}
