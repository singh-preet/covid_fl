import 'package:covid_fl/widgets/speed_dial.dart';
import 'package:flutter/material.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDialFAB(speedDial: speedDial, customStyle: customStyle),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF52796F),
        title: new RichText(
          text: TextSpan(
            text: 'Timeline - ',
            style: TextStyle(fontSize: 14),
            children: <TextSpan>[
              TextSpan(
                  text: "fname",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent)),
              TextSpan(text: " - " + "formattedDate"),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "No timeline for the user right now",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),

    );
  }



}
