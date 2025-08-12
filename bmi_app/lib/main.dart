import 'package:flutter/material.dart';


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
                        Icon(Icons.male, color: Colors.white),
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
                        Icon(Icons.female, color: Colors.white),
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
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        // Bottom row: Weight / Age cards
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
