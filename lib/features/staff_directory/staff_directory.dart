import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StaffDirectory extends StatelessWidget {
  const StaffDirectory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dtnow = DateTime.now();
    var formattedDate = DateFormat.yMMMMd('en_US').format(dtnow);
    return Scaffold(
      backgroundColor: const Color(0xFF52796F),
      appBar: new AppBar(
        title: new Text("Staff Directory"),
        backgroundColor: const Color(0xFF52796F),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: () {
                // getData();
              })
        ],
      ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            child: Text(formattedDate,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold))),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Expanded(
            child: ListView.builder(
              itemCount:10,
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(
                        vertical: 5, horizontal: 25),
                    color: Colors.white,
                    child: ListTile(
                        leading:  Text("fname",
                            style: TextStyle(
                              decoration:
                              TextDecoration.lineThrough,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              Icons.cancel,
                              color: Colors.red,
                            )
                              ]
                    )));
              },
            ),
          ),
        ),
      ],
    ),
    );
  }
}
