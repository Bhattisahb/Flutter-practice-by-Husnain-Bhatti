import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void getlocation() async{
  final LocationSettings locationSettings =  LocationSettings(
    accuracy: LocationAccuracy.low,
    distanceFilter: 100,
  );

  Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
print(position);

}
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          print("button pressed");
          getlocation();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
          child: Text("Button"),),

      ),
    );
  }
}
