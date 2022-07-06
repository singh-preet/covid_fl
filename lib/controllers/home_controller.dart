import 'dart:convert';

import 'package:phone_tech_london/data/models/response_model/brand_response.dart';
import 'package:phone_tech_london/data/models/response_model/order_response.dart';
import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/data/network/http_service.dart';
import 'package:phone_tech_london/utils/app_preferences.dart';
import 'package:phone_tech_london/utils/categories.dart';
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

  getHomePageData( {bool? getLaptop, bool? getPhone, bool? getTab, bool? getOrder}) async {
    if(getLaptop==true)
    laptop = await HttpService.fetchBrands({
      "categoryId": "2",
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId)
    });
    if(getPhone==true)
    brands = await HttpService.fetchBrands({
      "categoryId": "1",
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId)
    });
    if(getTab==true)
    tablets = await HttpService.fetchBrands({
      "categoryId": "3",
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId)
    });
    if(getOrder==true)
    orders = await HttpService.fetchOrders({
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId)
    });
    update();
  }


  TextEditingController coupon=TextEditingController();
  TextEditingController greaterThan=TextEditingController();
  TextEditingController value=TextEditingController();

  addCoupon() async {
    UpdateResponse res= await HttpService.addCoupon({
      'userId': AppPreferences.getString(AppPreferences.userId),
      'appId': AppPreferences.getString(AppPreferences.appId),
      'counpon': coupon.text,
      'greaterThen': greaterThan.text,
      'valueData': value.text,
      'disType': "${category.index+1}"
    });
    return res;

  }
  late Categories category=Categories.FLAT;

  updateCategory(Categories userCategory) {
    category = userCategory;
    update();
  }
}
