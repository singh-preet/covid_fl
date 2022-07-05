import 'dart:convert';

import 'package:phone_tech_london/data/models/response_model/brand_response.dart';
import 'package:phone_tech_london/data/models/response_model/order_response.dart';
import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/data/network/http_service.dart';
import 'package:phone_tech_london/utils/app_preferences.dart';
import 'package:phone_tech_london/utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  BrandResponse? laptop;
  BrandResponse? brands;
  BrandResponse? tablets;
  OrdersResponse? orders;
  List<Tab> tabs = [
    Tab(
      child: Text(StringConstant.PHONES),
    ),
    Tab(
      child: Text(StringConstant.TABLETS),
    ),
    Tab(
      child: Text(StringConstant.LAPTOPS),
    ),
    Tab(
      child: Text(StringConstant.COUPON),
    ),
    Tab(
      icon: Text(StringConstant.ORDERS),
    )
  ];

  getHomePageData() async {
    print("Homepage");
    laptop = await HttpService.fetchBrands({
      "categoryId": "2",
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId)
    });
    brands = await HttpService.fetchBrands({
      "categoryId": "1",
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId)
    });
    tablets = await HttpService.fetchBrands({
      "categoryId": "3",
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId)
    });
    orders = await HttpService.fetchOrders({
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId)
    });
    update();
  }

  addCoupon() async {
    UpdateResponse res= await HttpService.addCoupon({
      'userId': 'FGAHSF65S65655',
      'appId': 'APPmFGAHSF65S65655',
      'counpon': 'ABC1000',
      'greaterThen': '100',
      'valueData': '10',
      'disType': '1'
    });

  }
  String category = "";

  updateCategory(String userCategory) {
    category = userCategory;
    update();
  }
}
