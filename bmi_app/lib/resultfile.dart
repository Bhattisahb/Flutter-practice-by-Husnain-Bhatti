import 'package:flutter/material.dart';
import 'dart:math';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar:
        AppBar(
          backgroundColor: Colors.black,
          title: Text('Husnain Bhatti App', style: TextStyle(color: Colors.white),),
        ),
        body: Center(child: Text("BODY DATA", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),)),
      ),
    );
  }
}
