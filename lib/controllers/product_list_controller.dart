import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListModel {
  ProductListModel({this.serviceName, this.price, @required this.prodName});

  final String prodName, serviceName, price;
}

class ProductListController extends GetxController {
  List<ProductListModel> productData = [
    ProductListModel(
        prodName: "Galaxy S9", serviceName: "Broken LCD", price: "\$20"),
    ProductListModel(
        prodName: "Galaxy S9 Plus", serviceName: "Broken Glass", price: "\$20"),
    ProductListModel(
        prodName: "Galaxy S8", serviceName: "Audio Issue", price: "\$20"),
    ProductListModel(
        prodName: "Galaxy S8 Plus",
        serviceName: "Charging Port",
        price: "\$20"),
  ];
}
