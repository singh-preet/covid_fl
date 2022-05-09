import 'package:covid_fl/routes/app_routes.dart';
import 'package:covid_fl/utils/app_logger.dart';
import 'package:covid_fl/widgets/action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandModel {
  BrandModel({@required this.name, this.remarks});
  final String name;
  final String remarks;
}

class HomeController extends GetxController {
  List<BrandModel> brandData = [BrandModel(name: "Samsung",remarks: "some remarks"),BrandModel(name: "Apple",remarks: ""),BrandModel(name: "Huawei",remarks: "some remarks"),BrandModel(name: "Sony",remarks: ""),];

  int selectedTabIndex = 0;

  void onTabChanged(int index, BuildContext context) {
    this.selectedTabIndex = index;
    if (this.selectedTabIndex == 0) {
      showCupertinoModalPopup(
          context: context, builder: (BuildContext context) => ActionSheet());
    } else if (this.selectedTabIndex == 2) {
      Get.toNamed(Routes.ADMIN_PANEL);
    } else if (this.selectedTabIndex == 1) {
      Get.toNamed(Routes.TIMELINE);
    }
    AppLogger.printLog(index.toString());
    update();
  }
}
