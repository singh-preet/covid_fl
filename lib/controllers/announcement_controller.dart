import 'dart:async';
import 'dart:convert';
import 'package:covid_fl/utils/app_preferences.dart';
import 'package:covid_fl/utils/url_constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncementController extends GetxController {
  TextEditingController announcementController;

  Future postAnnouncement(BuildContext context) async {
    showToast("Please Wait...");
    int userID = int.tryParse((AppPreferences.getString("userid") ?? "1"));
    var map = Map<String, dynamic>();
    const _GET_SCORE_ = 'POST_MESSAGE';

    map['action'] = _GET_SCORE_;
    map['id'] = userID.toString();
    map['message'] = announcementController.text;

    print("here in total Score: $map");

    http.Response response;
    var client = http.Client();
    try {
      response = await http.post(
          Uri.parse(UrlConstants.BASE_URL + "/task/index.php"),
          body: map,
          headers: {"Accept": "application/json"});
    } finally {
      client.close();
    }
    var data2 = json.decode(response.body);

    if (data2["result"] == 1) {
      _showMaterialDialog("Success: Announcement Posted", context);
      announcementController.text = "";

      //showToast("Success");
      //disableAll = false;
    } else
      //disableAll = true;
      _showMaterialDialog(
          "Error: Announcement not Posted. Please try again later", context);
  }

  void showToast(String msg) {
    print(msg);
    // Fluttertoast.showToast(
    //     msg: mesg,
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     backgroundColor: Colors.greenAccent,
    //     textColor: Colors.black);
  }

  _showMaterialDialog(String message, BuildContext context) {
    print("_showMaterialDialog");
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Keep Connected"),
              content: new Text(message),
              actions: <Widget>[
                FlatButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    //Timer _timer;
                    // ignore: unused_local_variable
                    Timer _timer =
                        new Timer(const Duration(milliseconds: 100), () {
                      // Navigator.of(context).push(_createRouteHomePage());
                    });
                  },
                )
              ],
            ));
  }


  @override
  void onInit() {
    announcementController = new TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    announcementController.clear();
    super.dispose();
  }
}
