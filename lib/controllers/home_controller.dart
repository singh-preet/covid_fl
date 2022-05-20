import 'package:covid_fl/data/models/order_model.dart';
import 'package:covid_fl/data/models/response_model/brand_response.dart';
import 'package:covid_fl/data/network/http_service.dart';
import 'package:covid_fl/utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  BrandResponse? categories;
  BrandResponse? brands;
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
    update();
  }


  List<OrderModel> orderData = [
    OrderModel(
        phone: "9315121614",
        email: "baani.sunpreet@gmail.com",
        amount: "200",
        customerName: "Sunpreet Singh",
        deviceName: "Sony",
        services: ["Screen Damage", "Camera Repair"]),
    OrderModel(
        phone: "9873575079",
        email: "sunpreet@gmail.com",
        amount: "200",
        services: ["Screen Damage", "Camera Repair"],
        customerName: "Aman Singh",
        deviceName: "iPhone")
  ];
}
