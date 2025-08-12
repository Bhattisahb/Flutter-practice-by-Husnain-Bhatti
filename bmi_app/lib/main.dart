import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



main(){

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("BMI Calculator", style: TextStyle(color: Colors.white),),


        ),
        body: BMI(),
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


        Expanded(
          child: Row(
            children: [

              Expanded(child: Container(
                margin: EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.male, size: 80, color: Colors.white,),
                    Text("MALE", style: TextStyle(fontSize: 15 , color: Colors.white),),

                  ],
                ),


              )),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(15),

                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Icon(Icons.female, size: 80, color: Colors.white,),
                      Text("FEMALE", style: TextStyle(fontSize: 15 , color: Colors.white),),


                    ],


                  ),


                ),
              )

            ],
          ),
        ),


        Expanded(
          child: Container(
            margin: EdgeInsets.all(15),

            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(10),

            ),
          ),
        ),


        Expanded(
          child: Row(
            children: [

              Expanded(child: Container(
                margin: EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),

                ),
              )),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(15),

                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10),

                  ),
                ),
              )

            ],
          ),
        ),
      ],




    );






  }
}