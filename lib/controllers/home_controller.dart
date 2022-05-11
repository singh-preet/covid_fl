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
  List<BrandModel> brandData = [
    BrandModel(name: "Samsung", remarks: "some remarks"),
    BrandModel(name: "Apple", remarks: ""),
    BrandModel(name: "Huawei", remarks: "some remarks"),
    BrandModel(name: "Sony", remarks: ""),
  ];
}
