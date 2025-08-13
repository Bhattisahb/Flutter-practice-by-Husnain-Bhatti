import 'package:flutter/material.dart';
import 'result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("HusnainBhatti App"),
        ),
        body: const BMI(),
      ),
    );
  }
}

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First Row
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: buildContainer(),
              ),
              Expanded(
                child: buildContainer(),
              ),
            ],
          ),
        ),

        // Middle Single Box
        Expanded(
          child: buildContainer(),
        ),

        // Second Row
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: buildContainer(),
              ),
              Expanded(
                child: buildContainer(),
              ),
            ],
          ),
        ),
      ],
    );
  }


}
