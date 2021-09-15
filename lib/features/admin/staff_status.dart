import 'package:covid_fl/utils/app_colors.dart';
import 'package:covid_fl/utils/string_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class StaffStatus extends StatelessWidget {
  const StaffStatus({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: new Text(StringConstant.STAFF_STATUS),
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
        children: <Widget>[
          Container(
              child: Text("formattedDate",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold))),
          SizedBox(
            height: 10,
          ),
          Container(
              child: Text("companyName",
                  style: TextStyle(
                      color: Colors.orange[400],
                      fontSize: 12,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold))),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actions: <Widget>[
                      IconSlideAction(
                          icon: Icons.timeline,
                          caption: StringConstant.TIMELINE,
                          color: Colors.blue,
                          onTap: () {}),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                          icon: Icons.clear,
                          color: Colors.red,
                          caption: StringConstant.CANCEL,
                          closeOnTap: false, 
                          onTap: () {
                            print("More  is Clicked");
                          })
                    ],
                    child: new Card(
                        elevation: 2,
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                        color: Colors.white,
                        child: ListTile(
                            onLongPress: () {},
                            onTap: () {},
                            trailing: GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(width: 1)),
                                      child: Padding(
                                          padding: EdgeInsets.all(15.0),
                                          child: Icon(
                                            Icons.cancel,
                                            color: Colors.red,
                                          )))),
                            ),
                            leading: CircleAvatar(
                              radius: 13,
                              backgroundColor: Color(0xffFDCF09),
                              child: CircleAvatar(
                                radius: 13,
                                backgroundImage:
                                    AssetImage("assets/generic.png"),
                              ),
                            ),
                            title: Text("fname",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                )),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(CupertinoIcons.check_mark_circled_solid,
                                    color: Colors.teal),
                                Icon(CupertinoIcons.check_mark_circled,
                                    color: Colors.teal),
                                Icon(CupertinoIcons.check_mark_circled_solid,
                                    color: Colors.redAccent),
                              ],
                            ))),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
