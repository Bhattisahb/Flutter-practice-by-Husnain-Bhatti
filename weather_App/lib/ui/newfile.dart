import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Climate(),
    );
  }
}
class Climate extends StatefulWidget {
  const Climate({super.key});

  @override
  State<Climate> createState() => _ClimateState();
}

class _ClimateState extends State<Climate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Weather App", style: TextStyle(fontWeight: FontWeight.w400),),
      backgroundColor: Colors.deepOrange,

      actions: [IconButton(onPressed: (){   print("pressed");} , icon: Icon(Icons.menu, color: Colors.white,))],
      ),
      body: 
      Stack(
        children: [
          Center(
            child: Image(
                image: AssetImage(
                    "images/Rain.jpg"
                ),
              height: 1200,
              width: 490,
              fit: BoxFit.fill,

            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.fromLTRB(0, 10.9, 20.9, 0),


            child: Text("Vehari " , style: TextStyle(fontSize: 22.9, color: Colors.white, fontStyle: FontStyle.italic),),
          ),
          Center(
            child: Image(
              image: AssetImage(
                  "images/Rain_1.png"
              ),
              height: 200,
              width: 200,

            ),
          ),
        ],
      ),
    );
  }
}

