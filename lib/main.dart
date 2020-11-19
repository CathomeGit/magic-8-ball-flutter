import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final int threshold = 9;
  int counter = 0;
  int ballNumber = 1;
  DateTime lockDate;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FlatButton(
          onPressed: () {
            setState(() {
              if (lockDate != null && !isToday(lockDate)) {
                lockDate = null;
              }
              if (counter < threshold) {
                ballNumber = Random().nextInt(4) + 1;
                counter++;
              } else {
                lockDate = DateTime.now();
                counter = 0;
              }
            });
          },
          child: lockDate == null
              ? Image.asset('images/ball$ballNumber.png')
              : Text(
                  'TOO MANY QUESTIONS\nTODAY (' +
                      DateFormat('d.M.y').format(lockDate) + ')',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.5,
                  style: TextStyle(letterSpacing: 2, color: Colors.blue[50]),
                ),
        ),
      ),
    );
  }

  // https://stackoverflow.com/a/60213219/4925022
  bool isToday(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date).inDays;
    return diff == 0 && now.day == date.day;
  }
}
