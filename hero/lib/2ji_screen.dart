import 'package:flutter/material.dart';

class second extends StatelessWidget {
  const second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2ja Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(

            width: 800,
            height: 500,


            child: Hero(

                tag: 'Bhatti',
                child: Image.asset("assets/images/2.png")),
          ),
          Container()
        ],
      ),
    );
  }
}
