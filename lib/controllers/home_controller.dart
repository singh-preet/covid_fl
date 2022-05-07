import 'package:covid_fl/features/admin/post_announcement.dart';
import 'package:covid_fl/features/staff_directory/staff_directory.dart';
import 'package:covid_fl/routes/app_routes.dart';
import 'package:covid_fl/utils/app_logger.dart';
import 'package:covid_fl/utils/string_constant.dart';
import 'package:covid_fl/widgets/action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {


  int selectedTabIndex = 0;

  void onTabChanged(int index, BuildContext context) {
    this.selectedTabIndex = index;
    if (this.selectedTabIndex == 0) {
      showCupertinoModalPopup(context: context, builder: (BuildContext context) => ActionSheet());
    } else if (this.selectedTabIndex == 2) {
      Get.toNamed(Routes.ADMIN_PANEL);
    } else if (this.selectedTabIndex == 1) {
      Get.toNamed(Routes.TIMELINE);
    }
    AppLogger.printLog(index.toString());
    update();
  }
}
