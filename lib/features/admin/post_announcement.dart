import 'package:covid_fl/controllers/announcement_controller.dart';
import 'package:covid_fl/utils/app_colors.dart';
import 'package:covid_fl/utils/string_constant.dart';
import 'package:covid_fl/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostAnnouncement extends StatelessWidget {
  const PostAnnouncement({Key key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return GetBuilder<AnnouncementController>(
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              backgroundColor: AppColors.backgroundColor,
              elevation: 0,
              title: Text(StringConstant.POST_ANNOUNCEMENT),
            ),
            body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Card(
                          color: AppColors.white,
                          margin: EdgeInsets.all(19),
                          child: Padding(padding: EdgeInsets.all(8.0),
                              child: TextField(
                                  controller: controller.announcementController, maxLines: 15, decoration: InputDecoration.collapsed(hintText: StringConstant.ANNOUNCEMENT_HINT)))),
                      Center(
                        child: ButtonBar(
                          alignment: MainAxisAlignment.center,
                          buttonHeight: 40,
                          buttonMinWidth: 100,
                          children: <Widget>[
                            MaterialButton(
                              color: AppColors.darkGreenButton,
                              padding: EdgeInsets.all(10),
                              splashColor: AppColors.yellowSplashColor[200],
                              elevation: 6,
                              onPressed: ()=>controller.postAnnouncement(context),
                              child: Text(StringConstant.POST, style: StyleManager.regularWhite(fontSize: 20)),
                            ),
                            MaterialButton(
                              color: AppColors.darkGreenButton,
                              padding: EdgeInsets.all(10),
                              splashColor: AppColors.yellowSplashColor[200],
                              elevation: 6,
                              onPressed: ()=> print(controller.announcementController.text),
                              child: Text(StringConstant.CANCEL, style: StyleManager.regularWhite(fontSize: 20)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
            ));
      }
    );
  }
}
