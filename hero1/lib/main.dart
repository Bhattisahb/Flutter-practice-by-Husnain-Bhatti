import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Husnain Bhatti"),
          
        ),
        body: Heros(),
      ),
    );
  }
}

class Heros extends StatefulWidget {
  const Heros({super.key});

  @override
  State<Heros> createState() => _HerosState();
}

class _HerosState extends State<Heros> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //
      children: [
         Row(crossAxisAlignment: CrossAxisAlignment.end,
           children: [
             Text("Husnain Bhatti"),
           ],
         ),

      ],
    );
  }
}

