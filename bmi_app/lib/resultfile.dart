import 'package:flutter/material.dart';
import 'dart:math';

class Result extends StatelessWidget {
  final int height;
  final int weight;

  const Result({
    super.key,
    required this.height,
    required this.weight,
  });

  double calculateBMI() {
    double heightInMeters = height / 100;
    return weight / pow(heightInMeters, 2);
  }

  String getResultText(double bmi) {
    if (bmi >= 25) {
      return "Overweight ,   you should work hard";

    } else if (bmi > 18.5) {
      return "Normal , Perfect";
    } else {
      return "Underweight ,   eat some food";
    }
  }

  @override
  Widget build(BuildContext context) {
    double bmi = calculateBMI();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("BMI Result", style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your BMI is:",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              bmi.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 50,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              getResultText(bmi),
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "ReCalculate",
                style: TextStyle(fontSize: 18 , color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
