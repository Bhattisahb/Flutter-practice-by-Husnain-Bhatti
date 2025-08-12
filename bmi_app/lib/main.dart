import 'package:flutter/material.dart';



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