import 'package:covid_fl/data/models/response_model/brand_response.dart';
import 'package:covid_fl/data/models/response_model/order_response.dart';
import 'package:covid_fl/data/network/http_service.dart';
import 'package:covid_fl/utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  BrandResponse? categories;
  BrandResponse? brands;
  OrdersResponse? orders;
  List<Tab> tabs = [
    Tab(
      child: Text("Phones"),
    ),
    Tab(
      child: Text("Laptops"),
    ),
    Tab(
      icon: Text("Orders"),
    ),
  ];

  getHomePageData() async {

     categories = await HttpService.fetchBrands({
      "categoryId": "2",
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId)
    });
    brands = await HttpService.fetchBrands({
      "categoryId": "1",
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId)
    });
    orders = await HttpService.fetchOrders({
      "userId": AppPreferences.getString(AppPreferences.userId),
      "appId": AppPreferences.getString(AppPreferences.appId)
    });
    update();
  }


}
