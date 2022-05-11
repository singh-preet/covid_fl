import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailModel {
  ProductDetailModel({@required this.prodName, this.price});

  final String prodName;
  final String price;
}

class ProductDetailController extends GetxController {
  List<ProductDetailModel> prodDetailData = [
    ProductDetailModel(prodName: "Broken LCD", price: "\$20"),
    ProductDetailModel(prodName: "Broken Glass", price: "\$30"),
    ProductDetailModel(prodName: "Audio Issue", price: "\$10"),
    ProductDetailModel(prodName: "Charging Port", price: "\$50"),
  ];
}
