import 'package:covid_fl/utils/app_colors.dart';
import 'package:covid_fl/utils/string_constant.dart';
import 'package:flutter/material.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
        title: new Text(StringConstant.LEADERBOARD),
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                color: const Color(0xFF1B4332),
                elevation: 5,
                onPressed: () {
                },
                child: Text(
                  "< Prev",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              Text("formattedDate",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold)),
              RaisedButton(
                elevation: 5,
                color: const Color(0xFF1B4332),
                onPressed: () {
                },
                child: Text(
                  "Next >",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
          Container(
              child: Text("Points",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold))),
          SizedBox(
            height: 20,
          ),
          Chip(
            backgroundColor: Colors.white,
            /* avatar: CircleAvatar(
                    backgroundColor: Colors.grey.shade800,
                    child: Text('AB'),
                  ), */
            label: Text("Total Points: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
    );
  }
}
