import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionSheet extends StatelessWidget {
  const ActionSheet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text('What do you want to do?'),
actions: [
  CupertinoActionSheetAction(
    child:  Text('Absent'),
    onPressed: () {
    },
  ),
  CupertinoActionSheetAction(
    child: Text('Checkout',
        style: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold))
    ,
    onPressed: () {

    },
  ),
  CupertinoActionSheetAction(
    child: Text('Reaching Checkpoint',
        style: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold)),
    onPressed: () {
    },
  ),
  CupertinoActionSheetAction(
    child:Text('Leaving Checkpoint',
        style: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold)),
    onPressed: () {

    },
  ),
  CupertinoActionSheetAction(
    child: Text('At Office')
    ,
    onPressed: () {
    },
  ),
  CupertinoActionSheetAction(
    child:Text('Check in',
        style: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold))
    ,
    onPressed: () {

    },
  )
],
        cancelButton: CupertinoActionSheetAction(
          child: Text('Cancel'),
          onPressed: () {
            Get.back();
          },
        )
    );
  }
}
