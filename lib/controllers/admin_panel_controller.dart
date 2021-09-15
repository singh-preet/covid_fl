import 'package:covid_fl/data/models/admin_panel_item.dart';
import 'package:covid_fl/routes/app_routes.dart';
import 'package:covid_fl/utils/string_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPanelController extends GetxController{
  List<AdminPanelItemModel> items=[
    AdminPanelItemModel(StringConstant.STAFF_STATUS, CupertinoIcons.person_solid, onStaffStatusTap),
    AdminPanelItemModel(StringConstant.NEW_ANNOUNCEMENT, CupertinoIcons.mail_solid, onNewAnnouncementTap),
    AdminPanelItemModel(StringConstant.SWITCH, CupertinoIcons.refresh_thick, onSwitchTap),
    AdminPanelItemModel(StringConstant.LEADERBOARD, Icons.star, AdminPanelController.onLeaderboardTap),
  ];

  static onStaffStatusTap(){
    print("onStaffStatusTap");
    Get.toNamed(Routes.STAFF_STATUS);
  }

  static onNewAnnouncementTap(){
    Get.toNamed(Routes.POST_ANNOUNCEMENT);

  }

  static onSwitchTap(){
  }

  static onLeaderboardTap(){
    Get.toNamed(Routes.LEADERBOARD);
  }

}