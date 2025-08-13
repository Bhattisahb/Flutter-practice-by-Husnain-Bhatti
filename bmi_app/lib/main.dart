import 'package:flutter/material.dart';
import 'resultfile.dart';


const activecolor = Colors.white12;
const deactivecolor = Colors.white10;


enum Gender  {
  male,
  female,

}

void main() {
  runApp(const MyApp());
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
          title: const Text(
            "BMI Calculator",
            style: TextStyle(color: Colors.white),
          ),
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
  Gender? selectGender;
  int sliderheight=180;
  int sliderweight=60;
  int sliderage=20;
  // Color malecolor = activecolor;
  // Color femalecolor = deactivecolor;
  //
  // void updatecolor(Gender gender) {
  //   if (gender == Gender.male) {
  //     malecolor = activecolor;
  //     femalecolor = deactivecolor;
  //   }
  //   if (gender == Gender.female) {
  //     malecolor = deactivecolor;
  //     femalecolor = activecolor;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top row: Male / Female cards
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectGender=Gender.male;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: selectGender==Gender.male?activecolor:deactivecolor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.male, color: Colors.white, size: 80,),
                        SizedBox(height: 10),
                        Text(
                          "MALE",
                          style: TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectGender=Gender.female;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: selectGender==Gender.female?activecolor:deactivecolor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.female, color: Colors.white, size: 80,),
                        SizedBox(height: 10),
                        Text(
                          "FEMALE",
                          style: TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Middle box (Height section, for example)
        Expanded(
          child: Container(

            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white10

            ),
            child: Column(
              children: [

                Text("Height", style: TextStyle(fontSize: 15, color: Colors.white),),
                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$sliderheight", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700),),
                    Text("cm", style: TextStyle(fontSize: 15, color: Colors.white),),


                  ],
                ),
                Slider(
                    value: sliderheight.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Colors.redAccent,
                    inactiveColor: Colors.white12,
                    onChanged: (double newvalue){

                      setState(() {
                        sliderheight=newvalue.round();
                      });


                    }






                )
              ],
            ),


          ),
        ),

        // Bottom row: Weight / Age cards
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white10

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Weight ",  style: TextStyle(fontSize: 15, color: Colors.white)),
                      Text("$sliderweight" , style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700),)
                      ,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                sliderweight--;
                              });
                            },
                            icon: Icon(Icons.remove, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                sliderweight++;
                              });
                            },
                            icon: Icon(Icons.add, color: Colors.white),
                          ),

                        ],
                      )

                    ],
                  ),


                ),
              ),

              Expanded(
                child: Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white10

                  ),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Age ",  style: TextStyle(fontSize: 15, color: Colors.white)),
                      Text("$sliderage" , style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700),)
                      ,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                sliderage--;
                              });
                            },
                            icon: Icon(Icons.remove, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                sliderage++;
                              });
                            },
                            icon: Icon(Icons.add, color: Colors.white),
                          ),

                        ],
                      )

                    ],
                  ),


                ),
              )
            ],
          ),)
        , GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Result(
                  height: sliderheight,
                  weight: sliderweight,


                ),
              ),
            );


          },
          child: Container(
            child: Center(child: Text("Calculate", style: TextStyle(fontSize: 15),)),
            height: 60 ,
            margin: EdgeInsets.only(top: 10),
            color: Colors.redAccent,
            width: double.infinity,
          ),
        ) ],

    );
  }
}