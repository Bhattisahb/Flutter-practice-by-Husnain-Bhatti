import 'package:flutter/material.dart';
import 'result.dart';


main(){

  runApp(MyApp());
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
          title: Text("Bhatti App",style: TextStyle(color: Colors.white),),
        ),
        body: Bmi(),
      ),
    );
  }
}
 class Bmi extends StatefulWidget {
   const Bmi({super.key});

   @override
   State<Bmi> createState() => _BmiState();
 }

 class _BmiState extends State<Bmi> {
   @override
   Widget build(BuildContext context) {
     return Column(
       children: [
         buildContainer(),
         SizedBox(height: 10,),
         buildContainer(),

         SizedBox(height: 10,),


       ],



     );
   }


 }
