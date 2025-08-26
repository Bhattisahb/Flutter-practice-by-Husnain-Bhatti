import 'package:flutter/material.dart';
import '2ji_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // optional
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hero 1"),
        ),
        body: const Heroine(),
      ),
    );
  }
}


class Heroine extends StatefulWidget {
  const Heroine({super.key});

  @override
  State<Heroine> createState() => _HeroineState();
}

class _HeroineState extends State<Heroine> {
  @override
  Widget build(BuildContext context) {
    return   Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => second(),));
              },
              child: Hero(
                tag: 'Bhatti',
                child: Image.asset('assets/images/1.png'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text("Pau button mand"),
        ],
      ),
    );
  }
}

