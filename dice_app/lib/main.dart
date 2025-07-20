import 'package:flutter/material.dart';

void main() {
  runApp(DiceApp());
}

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DiceWithStateful(),
    );
  }
}

class DiceWithStateful extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}
int n = 0;
int b=3+n;
class _DiceState extends State<DiceWithStateful> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Dice Number: $b "), // dynamically shows the current number
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              b = (b % 6) + 1; // cycle between 1 and 6
            });
          },
          child: Image.asset('images/$b.jpeg'),
        ),
      ),
    );
  }
}
